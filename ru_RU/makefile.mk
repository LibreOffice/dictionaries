#*************************************************************************
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
# 
# Copyright 2000, 2010 Oracle and/or its affiliates.
#
# OpenOffice.org - a multi-platform office productivity suite
#
# This file is part of OpenOffice.org.
#
# OpenOffice.org is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License version 3
# only, as published by the Free Software Foundation.
#
# OpenOffice.org is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License version 3 for more details
# (a copy is included in the LICENSE file that accompanied this code).
#
# You should have received a copy of the GNU Lesser General Public License
# version 3 along with OpenOffice.org.  If not, see
# <http://www.openoffice.org/license.html>
# for a copy of the LGPLv3 License.
#
#*************************************************************************

PRJ=..

PRJNAME=dictionaries
TARGET=dict-ru

# --- Settings -----------------------------------------------------

.INCLUDE: settings.mk
# it might be useful to have an extension wide include to set things
# like the EXTNAME variable (used for configuration processing)
# .INCLUDE :  $(PRJ)$/source$/<extension name>$/<extension_name>.pmk

# --- Files --------------------------------------------------------

# name for uniq directory
EXTENSIONNAME:=dict-ru
EXTENSION_ZIPNAME:=dict-ru

# some other targets to be done

# --- Extension packaging ------------------------------------------

.IF "$(WITH_LANG)" != ""
DESCRIPTION_SRC:=$(MISC)/$(EXTENSIONNAME)_in/description.xml
.ENDIF 

# just copy:
COMPONENT_FILES= \
    $(EXTENSIONDIR)$/hyph_ru_RU.dic \
    $(EXTENSIONDIR)$/th_ru_RU_v2.dat \
    $(EXTENSIONDIR)$/ru_RU.aff \
    $(EXTENSIONDIR)$/ru_RU.dic \
    $(EXTENSIONDIR)$/README_thes_ru_RU.txt \
    $(EXTENSIONDIR)$/README_Lightproof_ru_RU.txt \
    $(EXTENSIONDIR)$/Lightproof.py \
    $(EXTENSIONDIR)$/Linguistic.xcu \
    $(EXTENSIONDIR)$/pythonpath/lightproof_ru_RU.py \
    $(EXTENSIONDIR)$/pythonpath/lightproof_handler_ru_RU.py \
    $(EXTENSIONDIR)$/pythonpath/lightproof_impl_ru_RU.py \
    $(EXTENSIONDIR)$/pythonpath/lightproof_opts_ru_RU.py \
    $(EXTENSIONDIR)$/dialog/ru_RU_en_US.default \
    $(EXTENSIONDIR)$/dialog/ru_RU_en_US.properties \
    $(EXTENSIONDIR)$/dialog/ru_RU.xdl \
    $(EXTENSIONDIR)$/dialog/OptionsDialog.xcs

COMPONENT_CONFIGDEST=.
COMPONENT_XCU= \
    $(EXTENSIONDIR)$/dictionaries.xcu

# disable fetching default OOo license text
CUSTOM_LICENSE=README_ru_RU.txt
# override default license destination
PACKLICS= $(EXTENSIONDIR)$/$(CUSTOM_LICENSE)

COMPONENT_UNZIP_FILES= \
    $(EXTENSIONDIR)$/th_ru_RU_v2.idx

.IF "$(WITH_LANG)" != ""
PROPERTIES_LOCALIZED:=$(MISC)/$(EXTENSIONNAME)_in/properties_localized
COMPONENT_UNZIP_FILES+=$(EXTENSIONDIR)$/dialog/OptionsDialog.xcu $(PROPERTIES_LOCALIZED)
.ELSE
COMPONENT_FILES+=$(EXTENSIONDIR)$/dialog/OptionsDialog.xcu
.ENDIF

# add own targets to packing dependencies (need to be done before
# packing the xtension
# EXTENSION_PACKDEPS=makefile.mk $(CUSTOM_LICENSE)
EXTENSION_PACKDEPS=$(COMPONENT_FILES) $(COMPONENT_UNZIP_FILES)

# global settings for extension packing
.INCLUDE : extension_pre.mk
.INCLUDE : target.mk
# global targets for extension packing
.INCLUDE : extension_post.mk

#.INCLUDE :  $(PRJ)$/prj$/tests.mk

$(EXTENSIONDIR)$/th_ru_RU_v2.idx : "$(EXTENSIONDIR)$/th_ru_RU_v2.dat"
         $(COMMAND_ECHO)$(AUGMENT_LIBRARY_PATH) $(LOCAL_OUT_FOR_BUILD)$/bin$/idxdict -o $(EXTENSIONDIR)$/th_ru_RU_v2.idx <$(EXTENSIONDIR)$/th_ru_RU_v2.dat

.IF "$(WITH_LANG)" != ""
$(DESCRIPTION_SRC) : description.xml
    @@-$(MKDIRHIER) $(@:d)
    $(COMMAND_ECHO)$(XRMEX) -p $(PRJNAME) -i $< -o $@ -m $(LOCALIZESDF) -l all
$(EXTENSIONDIR)/dialog/OptionsDialog.xcu : dialog/OptionsDialog.xcu
    $(COMMAND_ECHO)$(CFGEX) -p $(PRJNAME) \
                            -i $< \
                            -o $(EXTENSIONDIR)/dialog/OptionsDialog.xcu  \
                            -m $(WORKDIR)/CustomTarget/translations/translate/sdf/dictionaries/ru_RU/dialog/localize.sdf \
                            -l all
$(PROPERTIES_LOCALIZED) : $(EXTENSIONDIR)/dialog/ru_RU_en_US.properties
    $(COMMAND_ECHO)$(PERL) $(OUTDIR)/bin/propmerge \
                            -i $< \
                            -m $(WORKDIR)/CustomTarget/translations/translate/sdf/dictionaries/ru_RU/dialog/localize.sdf
    @@-$(TOUCH) $(PROPERTIES_LOCALIZED)
.ENDIF
