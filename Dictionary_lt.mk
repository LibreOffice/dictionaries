# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-lt,dictionaries/lt_LT))

$(eval $(call gb_Dictionary_add_root_files,dict-lt,\
	dictionaries/lt_LT/COPYING_lt_LT \
	dictionaries/lt_LT/hyph_lt_LT.dic \
	dictionaries/lt_LT/lt_LT.aff \
	dictionaries/lt_LT/lt_LT.dic \
	dictionaries/lt_LT/README_hyph_lt_LT.txt \
	dictionaries/lt_LT/README_lt_LT.txt \
))

# vim: set noet sw=4 ts=4:
