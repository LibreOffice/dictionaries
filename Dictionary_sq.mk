# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the General Public 
# License, v. 2.0. If a copy of the GPL was not distributed with this
# file, You can obtain one at https://www.gnu.org/licenses/gpl-3.0.en.html
#

$(eval $(call gb_Dictionary_Dictionary,dict-sq,dictionaries/sq_AL))

$(eval $(call gb_Dictionary_add_root_files,dict-sq,\
	dictionaries/sq/sq_AL.aff \
	dictionaries/sq/sq_AL.dic \
	dictionaries/sq/README.txt\
	dictionaries/sq/Copyright\
))


# vim: set noet sw=4 ts=4:
