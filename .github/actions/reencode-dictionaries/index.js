
const core = require('@actions/core');
const fs = require('fs');
const path = require('path');
const Iconv = require('iconv').Iconv;

const rootPath = path.resolve(__dirname, '../../../')
const buildPath = path.resolve(rootPath, 'build')

function run() {
  try {
    getDictionariesFolders(rootPath).map(({ path, dictFolderName }) => {
      return {
        dictFolderName,
        folderPath: path,
        dictionaries: getAffixDicPairs(path)
      }
    })
      .filter(r => r.dictionaries.length)
      .forEach(processDictionaryFoler)

  } catch (error) {
    console.log(error)
    core.setFailed(error.message);
  }
}

function getDictionariesFolders(basePath) {
  return fs.readdirSync(basePath, { withFileTypes: true })
    .filter(dirent => dirent.isDirectory())
    .filter(dirent => !dirent.name.startsWith('.'))
    .filter(dirent => {
      const subFolderPath = path.resolve(basePath, dirent.name);
      return !!fs.readdirSync(subFolderPath, { withFileTypes: true })
        .find(
          dirent => dirent.isFile() && (
            dirent.name.endsWith('.aff') ||
            dirent.name.endsWith('.dic')
          )
        )
    })
    .map(dirent => ({
      path: path.resolve(basePath, dirent.name),
      dictFolderName: dirent.name
    }))
}


function getAffixDicPairs(folder) {
  return fs.readdirSync(folder, { withFileTypes: true })
    .filter(dirent => dirent.name.endsWith('.aff'))
    .map(dirent => {
      const aff = {
        path: path.resolve(folder, dirent.name),
        name: dirent.name
      }

      const dicFilename = `${path.parse(aff.name).name}.dic`;

      const dic = {
        path: path.resolve(folder, dicFilename),
        name: dicFilename,
      }
      return {
        aff,
        dic
      }
    })
    .filter(({ dic }) => fs.existsSync(dic.path))
}

function getReedsyDicts(folder) {
  return fs.globSync('*_reedsy.dic', { cwd: folder })
    .map(file => path.resolve(folder, file));
}

function processDictionaryFoler(dictionaryFolder) {
  const resultFolderPath = createResultDictionaryFolder(dictionaryFolder.dictFolderName)

  dictionaryFolder.dictionaries.forEach(({ aff, dic }) => {
    const encoding = getEncoding(aff.path);
    let isUtf8 = encoding === 'UTF-8'
    let affContent;
    let dicContent;
    if (isUtf8) {
      affContent = fs.readFileSync(aff.path)
      dicContent = fs.readFileSync(dic.path)
    } else {
      console.log('Found', encoding, 'aff file', aff.path, 'converting to UTF-8')
      const iconv = new Iconv(encoding, 'UTF-8');
      affContent = iconv.convert(
        fs.readFileSync(aff.path)
      )

      dicContent = iconv.convert(
        fs.readFileSync(dic.path)
      )
    }

    const resultAffFilePath = path.resolve(resultFolderPath, aff.name)
    const resultDicFilePAth = path.resolve(resultFolderPath, dic.name)

    fs.writeFileSync(resultAffFilePath, affContent)
    fs.writeFileSync(resultDicFilePAth, dicContent)

    if (!isUtf8) {
      changeAffFileEncodingSettingToUtf8(resultAffFilePath)
    }
  })

  getReedsyDicts(dictionaryFolder.folderPath).forEach(dictPath => {
    const destPath = path.resolve(resultFolderPath, path.basename(dictPath));
    fs.copyFileSync(dictPath, destPath);
  });
}

function createResultDictionaryFolder(dictionaryFolderName) {
  const dictFolderPath = path.resolve(buildPath, dictionaryFolderName)
  fs.mkdirSync(
    dictFolderPath,
    { recursive: true }
  )

  return dictFolderPath;
}
const encodingRegex = /SET\s\S*\s*$/gm

function getEncoding(affFilePath) {
  const fileData = fs.readFileSync(affFilePath, 'utf8');
  let encodingLine = fileData.match(encodingRegex)[0]
  return encodingLine
    .replace(/\s/g, '')
    .substring(3)
    .toUpperCase();
}

function changeAffFileEncodingSettingToUtf8(affFilePath) {
  let fileData = fs.readFileSync(affFilePath, 'utf8');
  fileData = fileData.replace(encodingRegex, 'SET UTF-8\n');
  fs.writeFileSync(affFilePath, fileData, { encoding: 'utf8' })
}

run();
