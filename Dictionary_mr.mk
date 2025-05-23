# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-mr,dictionaries/mr_IN))

$(eval $(call gb_Dictionary_add_root_files,dict-mr,\
        dictionaries/mr_IN/mr_IN.aff \
        dictionaries/mr_IN/mr_IN.dic \
        dictionaries/mr_IN/hyph_mr_IN.dic \
        dictionaries/mr_IN/COPYING \
))

$(eval $(call gb_Dictionary_add_thesauri,dict-mr,\
        dictionaries/mr_IN/th_mr_IN_v2.dat \
))

# vim: set noet sw=4 ts=4:

