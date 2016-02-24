#!/usr/bin/env python
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# This utility translates a normal dictionary (in this case English/Czech)
# into a thesaurus for one of the languages (in this case Czech).
#
# Based on idea of Zdenek Zabokrtsky <zabokrtsky@ufal.mff.cuni.cz>, big
# thanks! :-)

import os
import sys

def usage():
    message = """Usage: {program} slovnik_data_utf8.txt

  slovnik_data_utf8.txt: Dictionary data from http://slovnik.zcu.cz/download.php"""
    print(message.format(program = os.path.basename(sys.argv[0])))

def parse(filename):
    synonyms = {}
    meanings = {}

    with open(filename, "r") as fp:
        for line in fp:
            if (line == ''):
                continue
            elif (line[0] == '#'):
                continue
            else:
                terms = line.split('\t')
                if (terms[0] == '' or len(terms) < 2):
                    continue

                index = terms[0].strip()
                if (index == ''):
                    continue

                word = terms[1].strip()
                if (word == ''):
                    continue
                #type = terms[2] TODO for now the type (n:, adj:, ...) is ignored

                if index in synonyms:
                    synonyms[index].append(word)
                else:
                    synonyms[index] = [ word ]

                if word in meanings:
                    meanings[word].append(index)
                else:
                    meanings[word] = [ index ]

    return (synonyms, meanings)

def buildThesaurus(synonyms, meanings):
    # for every word:
    #   find all the indexes, and then again map the indexes to words - these are the synonyms
    for word in sorted(meanings.keys()):
        # we assume that various indexes (english words here) are various
        # meanings; not generally true, but...
        indexes = meanings[word]

        # we want to output each word just once
        used_this_round = [ word ]

        output_lines = []
        for index in indexes:
            syns = synonyms[index]

            line = ''
            for syn in syns:
                if not syn in used_this_round:
                    line += '|' + syn
                    used_this_round.append(syn)

            if line != '':
                # TODO prepend the line with '(adj)' or '(noun)' or so; see 'type' above
                output_lines.append(line)

        if len(output_lines) > 0:
            print word + '|' + str(len(output_lines))
            for line in output_lines:
                print line

def main(args):
    if (len(args) != 2):
        usage()
        sys.exit(1)

    (synonyms, meanings) = parse(args[1])

    print "UTF-8"
    buildThesaurus(synonyms, meanings)

if __name__ == "__main__":
    main(sys.argv)

# vim:set shiftwidth=4 softtabstop=4 expandtab:
