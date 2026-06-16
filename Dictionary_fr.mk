# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-fr,dictionaries/fr_FR))

$(eval $(call gb_Dictionary_add_root_files,dict-fr,\
	dictionaries/fr_FR/dictionaries/fr.aff \
	dictionaries/fr_FR/dictionaries/fr.dic \
	dictionaries/fr_FR/dictionaries/hyph_fr.dic \
	dictionaries/fr_FR/dictionaries/hyph-fr.tex \
	dictionaries/fr_FR/french_flag.png \
	dictionaries/fr_FR/package-description.txt \
	dictionaries/fr_FR/dictionaries/README_dict_fr.txt \
	dictionaries/fr_FR/dictionaries/README_hyph_fr-3.0.txt \
	dictionaries/fr_FR/dictionaries/README_thes_fr.txt \
))

$(eval $(call gb_Dictionary_add_thesauri,dict-fr,\
	dictionaries/fr_FR/dictionaries/thes_fr.dat \
))

# vim: set noet sw=4 ts=4:
