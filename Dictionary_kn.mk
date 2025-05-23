# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-kn,dictionaries/kn_IN))

$(eval $(call gb_Dictionary_add_root_files,dict-kn,\
        dictionaries/kn_IN/kn_IN.aff \
        dictionaries/kn_IN/kn_IN.dic \
        dictionaries/kn_IN/hyph_kn_IN.dic \
))

# vim: set noet sw=4 ts=4:

