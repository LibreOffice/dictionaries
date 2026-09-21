# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-lij,dictionaries/lij_IT))

$(eval $(call gb_Dictionary_add_root_files,dict-lij,\
	dictionaries/lij_IT/lij_IT.aff \
	dictionaries/lij_IT/lij_IT.dic \
	dictionaries/lij_IT/hyph_lij_IT.dic \
	dictionaries/lij_IT/README_lij_IT.txt \
	dictionaries/lij_IT/README_hyph_lij_IT.txt \
	dictionaries/lij_IT/LICENSE_lij_IT.txt \
	dictionaries/lij_IT/LICENSE_hyph_lij_IT.txt \
))

# vim: set noet sw=4 ts=4:
