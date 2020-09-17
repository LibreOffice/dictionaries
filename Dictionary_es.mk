# -*- Mode: makefile-gmake; tab-width: 4; indent-tabs-mode: t -*-
#
# This file is part of the LibreOffice project.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

$(eval $(call gb_Dictionary_Dictionary,dict-es,dictionaries/es))

$(eval $(call gb_Dictionary_add_root_files,dict-es,\
	dictionaries/es_AR.aff \
	dictionaries/es_AR.dic \
	dictionaries/es_BO.aff \
	dictionaries/es_BO.dic \
	dictionaries/es_CL.aff \
	dictionaries/es_CL.dic \
	dictionaries/es_CO.aff \
	dictionaries/es_CO.dic \
	dictionaries/es_CR.aff \
	dictionaries/es_CR.dic \
	dictionaries/es_CU.aff \
	dictionaries/es_CU.dic \
	dictionaries/es_DO.aff \
	dictionaries/es_DO.dic \
	dictionaries/es_EC.aff \
	dictionaries/es_EC.dic \
	dictionaries/es_ES.aff \
	dictionaries/es_ES.dic \
	dictionaries/es_GQ.aff \
	dictionaries/es_GQ.dic \
	dictionaries/es_GT.aff \
	dictionaries/es_GT.dic \
	dictionaries/es_HN.aff \
	dictionaries/es_HN.dic \
	dictionaries/es_MX.aff \
	dictionaries/es_MX.dic \
	dictionaries/es_NI.aff \
	dictionaries/es_NI.dic \
	dictionaries/es_PA.aff \
	dictionaries/es_PA.dic \
	dictionaries/es_PE.aff \
	dictionaries/es_PE.dic \
	dictionaries/es_PH.aff \
	dictionaries/es_PH.dic \
	dictionaries/es_PR.aff \
	dictionaries/es_PR.dic \
	dictionaries/es_PY.aff \
	dictionaries/es_PY.dic \
	dictionaries/es_SV.aff \
	dictionaries/es_SV.dic \
	dictionaries/es_US.aff \
	dictionaries/es_US.dic \
	dictionaries/es_UY.aff \
	dictionaries/es_UY.dic \
	dictionaries/es_VE.aff \
	dictionaries/es_VE.dic \
	dictionaries/es/hyph_es.dic \
	dictionaries/es/package-description.txt \
	dictionaries/es/README.txt \
	dictionaries/es/README_hyph_es.txt \
	dictionaries/es/README_th_es.txt \
	dictionaries/es/LICENSE.md \
))

$(eval $(call gb_Dictionary_add_thesauri,dict-es,\
	dictionaries/es/th_es_v2.dat \
))

# vim: set noet sw=4 ts=4:
