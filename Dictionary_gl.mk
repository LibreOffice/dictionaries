# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-gl,dictionaries/gl))

$(eval $(call gb_Dictionary_add_root_files,dict-gl,\
	dictionaries/gl/gl_ES.aff \
	dictionaries/gl/gl_ES.dic \
	dictionaries/gl/LICENCES-gl.txt \
	dictionaries/gl/LICENSES-en.txt \
	dictionaries/gl/README-gl-ES.txt \
	dictionaries/gl/spell.txt \
))

# vim: set noet sw=4 ts=4:
