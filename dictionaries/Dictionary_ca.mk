# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-ca,dictionaries/ca))

$(eval $(call gb_Dictionary_add_root_files,dict-ca,\
	dictionaries/ca/ca.aff \
	dictionaries/ca/ca.dic \
	dictionaries/ca/dict_LICENSES-en.txt \
	dictionaries/ca/dict_LLICENCIES-ca.txt \
	dictionaries/ca/hyph_ca.dic \
	dictionaries/ca/hyph_LICENSES-en.txt \
	dictionaries/ca/hyph_LLICENCIES-ca.txt \
	dictionaries/ca/hyph_release-note_ca.txt \
	dictionaries/ca/hyph_release-note_en.txt \
	dictionaries/ca/LICENSES-en.txt \
	dictionaries/ca/LLICENCIES-ca.txt \
	dictionaries/ca/README_th_ca_ES_v3.txt \
	dictionaries/ca/th_LICENCES-fr.txt \
	dictionaries/ca/th_LICENCIAS-es.txt \
	dictionaries/ca/th_LICENSES-en.txt \
	dictionaries/ca/th_LLICENCIES-ca.txt \
	dictionaries/ca/th_release_note-ca.txt \
))

$(eval $(call gb_Dictionary_add_thesauri,dict-ca,\
	dictionaries/ca/th_ca_ES_v3.dat \
))

# vim: set noet sw=4 ts=4:
