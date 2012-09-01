# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-pt,dictionaries/pt_BR))

$(eval $(call gb_Dictionary_add_root_files,dict-pt,\
	dictionaries/pt_BR/hyph_pt_BR.dic \
	dictionaries/pt_BR/pt_BR.aff \
	dictionaries/pt_BR/pt_BR.dic \
	dictionaries/pt_BR/README_en.txt \
	dictionaries/pt_BR/README_hyph_pt_BR.txt \
	dictionaries/pt_BR/README_pt_BR.txt \
))

# vim: set noet sw=4 ts=4:
