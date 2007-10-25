Autor/Author: Raimundo Moura <raimundomoura@openoffice.org>

pt-BR: Este dicionário está em desenvolvimento por Raimundo Moura e sua equipe. Ele está licenciado sob os termos da Licença Pública Geral Menor versão 2.1 (LGPLv2.1), como publicado pela Free Software Foundation. Os créditos estão disponíveis em http://www.broffice.org/creditos e você pode encontrar novas versões em http://www.broffice.org/verortografico.

en-US: This dictionary is under development by Raimundo Moura and his team. It is licensed under the terms of the GNU Lesser General Public License version 2.1 (LGPLv2.1), as published by the Free Software Foundation. The credits are available at http://www.broffice.org/creditos and you can find new releases at http://www.broffice.org/verortografico.


Copyright (C) 2006 - 2007 por/by Raimundo Santos Moura <raimundomoura@openoffice.org>

=============
APRESENTAÇÃO
=============

O Projeto Verificador Ortográfico do BrOffice.org é um projeto
colaborativo desenvolvido pela comunidade Brasileira.
A relação completa dos colaboradores deste projeto está em:
http://www.broffice.org.br/creditos

***********************************************************************
* Este é um dicionário para correção ortográfica da língua Portuguesa *
* para o Myspell.                                                     *
* Este programa é livre e pode ser redistribuído e/ou modificado nos  *
* termos da GNU Lesser General Public License (LGPL) versão 2.1.      *
*                                                                     *
***********************************************************************

======================
SOBRE ESTA ATUALIZAÇÃO
======================
. Inclusão das regras para a formação das Ênclises e Mesóclises;
. Nesta atualização foram analisados 1.849 termos, em sua maioria 
  parônimos. Foram encontradas palavras grafadas com mais de uma
  forma, a exemplo de 'charreu' e charréu, e eliminadas as incorretas 
  (Colaboração de Leonardo Fontenelle).
. Revisão e exclusão de 1.113 nomes próprios duplicados; 
. Exclusão de associações errôneas de termos à regras (colaboração de
  Leonardo Fontenelle), exemplos: ação/K, ligeiro/M, duplex/B, etc;  
. Inclusão de algumas letras como 'à' e 'é' para correção de falha na 
  versão 2.3 do BrOffice.org;
. Correção do apóstrofo em algumas palavras com d' como: 
  açucenas-d'água e pai-d'égua, cuja grafia apresentava o d´
  (asento agudo ao invés do apóstrofo). Leonardo Fontenelle;
. Inclusão dos termos 'triangularização','dinamicidade', 'mestranda',
  colaboração de Leo Barichello;
. Inclusão do  termo 'cochilos', colaboração de Rafael da Fonseca 
  Duarte;
. Inclusão dos termos 'couché', 'pré-obliterado', 'pré-filatelia' e 
  'regomado', colaboração de Carlos Dalmiro Silva Soares;
. Criação do Temático Filatélico por Carlos Dalmiro Silva Soares;
. Correção da conjugação de verbos terminados em ear com som aberto,
  como: idear e estrear. Colaboração Hortência Maria Moura;
. Inclusão do gênero feminino dos numerais ordinais como:
  ducentésima, trecentésima, tricentésima, quadringentésima, 
  qüingentésima, sexcentésima, seiscentésima, septingentésima,
  octingentésima e nongentésima;
. Inclusão ds siglas dos Estados de Alagoas (AL) e Amapá (AP);
. Inclusão de algumas palavras no gênero feminino, tais como: 
  oficiala, hipopótama, faquiresa, etc.
. Exclusão da forma singular da palavra 'víveres';
. Correção na regra de conjugação de verbos terminados em: aguar,
  equar e inquar. Exemplos adequar(adéqüe,adéqüem), desaguar (deságüem),
  minguar (míngüe);
. Correção de 'argüeiro' e 'desmilingüir' (trema);
. Correção da conjugação dos verbos haver e reaver
  inclusão de 'hemos' e 'heis', e exlusão de 'reei',
  'reás', reá e reão;
. Exclusão de 'corma' e 'satividade', colaboração Leo Barichello;
. Exclusão de 'indentar' verbo e derivados;
. Inclusão de 'hidroplanagem','biodisponibilidade';
. Correção de termos compostos com prefixos: Neo, Contra,
  ultra, semi, proto, supra, pseudo, auto, intra, extra,
  infra. Evitando-se erros como: semianalfabeto,
  infraestrutura, semiárido, etc.
. Criação do Temático Microbiologia por Gervásio Paulo da Silva;
. Inclusão dos termos 'historicamente' e 'Finlândia', colaboração de 
  Sérgio A. Elarrat Canto;
. Exclusão de 1.309 termos terminados em 'icamente' derivados de
  palavras acentuadas terminadas em 'ia'. Aplicação errônea da regra;  
 
=======================================================
COMO INSTALAR O VERIFICADOR BRASILEIRO NO BROFFICE.ORG
=======================================================

Copie os arquivos pt_BR.dic e pt_BR.aff para o diretório <BrOffice.org>
/share/dict/ooo, onde <BrOffice.org> é o diretório em que o programa 
foi instalado.

No Windows, normalmente, o caminho é este: 
C:\Arquivos de programas\BrOffice.org 2.0\share\dict\ooo, e no  Linux
/opt/BrOffice.org/share/dict/ooo/.

No mesmo diretório, localize o arquivo dictionary.lst. Abra-o com um
editor de textos e acrescente a seguinte linha ao final(se não
existir):

DICT pt BR pt_BR

É necessário reiniciar o BrOffice, inclusive o início rápido da versão
para Windows que fica na barra de tarefas, para que o corretor
funcione.

===================
DÚVIDAS FREQUENTES
===================

Os arquivos foram copiados mas o Verificador não está funcionando.
O Verificador Ortográfico não deve estar configurado corretamente,
isto pode estar ocorrendo por um dos seguintes motivos:

1- O dicionário provavelmente não está instalado.

Para se certificar de que está utilizando o idioma correto confira como
estão as informações em: Ferramentas >> Opções >>   Configurações de
Idioma >> Idiomas. O item Ocidental deve apresentar o dicionário
selecionado (deve aparecer um logo "Abc" do lado do idioma).

Se não estiver Português (Brasil) mude para esse idioma. Após
configurado clique em 'OK'.
Feche o BrOffice, inclusive o Iniciador Rápido,  e em seguida reabra-o;


2 - O verificador não está configurado para verificar texto ao digitar.
Neste caso confira como estão as informações em: Ferramentas >> Opções
>> Configurações de Idiomas >> Recursos de Verificação Ortográfica e, 
no campo opções deste formulário marque a opção 'Verificar texto ao 
digitar';


Novas atualizações estarão disponíveis no site do BrOffice.Org, na
página do Verificador Ortográfico.

http://www.openoffice.org.br/?q=verortografico


============
INTRODUCTION
============

The BrOffice.org Orthography Checker is a colaborative project developed
by the Brazilian community.
The complete list of participants in this project is at
http://www.broffice.org.br/creditos

***********************************************************************
* This is a dictionary for orthography correction for the Portuguese  *
* language for Myspell.                                               *
* This is a free program and it can be redistributed and/or           *
* modified under the terms of the GNU Lesser General Public License   *
* (LGPL) version 2.1.                                                 *
*                                                                     *
***********************************************************************

=================
ABOUT THIS UPDATE
=================

==============================================================
HOW TO INSTALL THE BRAZILIAN ORTOGRAPH CHECKER IN BROFFICE.ORG
==============================================================

Copy the files pt_BR.dic and pt_BR.aff to the directory <BrOffice.org>
/share/dict/ooo, where <BrOffice.org> is the directory where the software
has been installed.

In Windows, usually, the path is
C:\Arquivos de programas\BrOffice.org 2.0\share\dict\ooo, and in GNU/Linux
/opt/BrOffice.org/share/dict/ooo/.

In the same directory, locate the file dictionary.lst. Open it with a
text editor e add the following line to the end of the file (if it is
not already there):

DICT pt BR pt_BR

It is necessary to restart BrOffice, including the fast start for the Windows version
that resides on the task bar, in order to have the orthography checker to work.


==========================
FREQUENTLY ASKED QUESTIONS
==========================

The files have been copied but the checker is not working. The orthography checker may not be
configured correctly, this may be due to one of the following reasons:

1- The dictionary is probably not installed.

To make sure that you are using the right language, check the information at
Ferramentas >> Opções >>  Configurações de Idioma >> Idiomas.
The item "Ocidental" must present the selected dictionary (a logo "Abc" should
appear beside the language).
If the language selected is not "Português (Brasil)" change to this language.
After the configuration is correct, click on 'OK'.
Close BrOffice and the fast start, and open it afterwards;

2 - The checker is not configured to verify the orthography on typing. For this

problem, check the information at
"Ferramentas >> Opções >> Configurações de Idiomas >> Recursos de Verificação Ortográfica"
and, in the field "Opções" of this form, check the option ''Verificar texto ao digitar';

New updates will be available at the BrOffice.Org website, on the page of the
Orthography Checker.

http://www.broffice.org/verortografico

