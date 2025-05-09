# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-or,dictionaries/or_IN))

$(eval $(call gb_Dictionary_add_root_files,dict-or,\
        dictionaries/or_IN/or_IN.aff \
        dictionaries/or_IN/or_IN.dic \
        dictionaries/or_IN/hyph_or_IN.dic \

))

# vim: set noet sw=4 ts=4:

