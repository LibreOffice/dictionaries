# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-es,dictionaries/es))

$(eval $(call gb_Dictionary_add_root_files,dict-es,\
	dictionaries/es/es_ANY.aff \
	dictionaries/es/es_ANY.dic \
	dictionaries/es/hyph_es_ANY.dic \
	dictionaries/es/package-description.txt \
	dictionaries/es/README_es_ANY.txt \
	dictionaries/es/README_hyph_es_ANY.txt \
	dictionaries/es/README_th_es_ANY.txt \
))

$(eval $(call gb_Dictionary_add_thesauri,dict-es,\
	dictionaries/es/th_es_ANY_v2.dat \
))

# vim: set noet sw=4 ts=4:
