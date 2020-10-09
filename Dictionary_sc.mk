# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-fr,dictionaries/sc_IT))

$(eval $(call gb_Dictionary_add_root_files,dict-sc,\
	dictionaries/sc_IT/sc_IT.aff \
	dictionaries/sc_IT/sc_IT.dic \
	dictionaries/sc_IT/hyph_sc_IT.dic \
	dictionaries/sc_IT/pkg-description.txt \
))

$(eval $(call gb_Dictionary_add_thesauri,dict-sc_IT,\
	dictionaries/sc_IT/th_sc_IT.dat \
	dictionaries/sc_IT/th_sc_IT.idx
))

# vim: set noet sw=4 ts=4:
