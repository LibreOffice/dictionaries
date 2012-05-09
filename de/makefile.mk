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
TARGET=dict-de

# --- Settings -----------------------------------------------------

.INCLUDE: settings.mk
# it might be useful to have an extension wide include to set things
# like the EXTNAME variable (used for configuration processing)
# .INCLUDE :  $(PRJ)$/source$/<extension name>$/<extension_name>.pmk

# --- Files --------------------------------------------------------

# name for uniq directory
EXTENSIONNAME:=dict-de
EXTENSION_ZIPNAME:=dict-de

# Build the dict-de extension when building this directory using the
# dictionaries.xcu from here. For this COMPONENT_COPYONLY has to be undefined.
#COMPONENT_COPYONLY=TRUE

# some other targets to be done

# --- Extension packaging ------------------------------------------

.IF "$(WITH_LANG)" != ""
DESCRIPTION_SRC:=$(MISC)/$(EXTENSIONNAME)_in/description.xml
.ENDIF 

# just copy:
COMPONENT_FILES= \
    $(EXTENSIONDIR)$/COPYING_OASIS.txt \
    $(EXTENSIONDIR)$/COPYING_GPLv3 \
    $(EXTENSIONDIR)$/de_AT_frami.dic \
    $(EXTENSIONDIR)$/de_CH_frami.dic \
    $(EXTENSIONDIR)$/de_DE_frami.dic \
    $(EXTENSIONDIR)$/de_DE_frami.aff \
    $(EXTENSIONDIR)$/hyph_de.dic \
    $(EXTENSIONDIR)$/README_de_DE_frami.txt \
    $(EXTENSIONDIR)$/README_extension_owner.txt \
    $(EXTENSIONDIR)$/README_hyph_de.txt \
    $(EXTENSIONDIR)$/README_thesaurus.txt \
    $(EXTENSIONDIR)$/th_de_AT_v2.dat \
    $(EXTENSIONDIR)$/th_de_DE_v2.dat

COMPONENT_CONFIGDEST=.
COMPONENT_XCU= \
    $(EXTENSIONDIR)$/dictionaries.xcu

# disable fetching default OOo license text
CUSTOM_LICENSE=COPYING_GPLv2
# override default license destination
PACKLICS= $(EXTENSIONDIR)$/$(CUSTOM_LICENSE)

COMPONENT_UNZIP_FILES= \
    $(EXTENSIONDIR)$/th_de_AT_v2.idx \
    $(EXTENSIONDIR)$/th_de_DE_v2.idx

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

$(EXTENSIONDIR)$/th_de_DE_v2.idx : "$(EXTENSIONDIR)$/th_de_DE_v2.dat"
         $(COMMAND_ECHO)$(AUGMENT_LIBRARY_PATH) $(LOCAL_OUT_FOR_BUILD)$/bin$/idxdict -o $(EXTENSIONDIR)$/th_de_DE_v2.idx <$(EXTENSIONDIR)$/th_de_DE_v2.dat
$(EXTENSIONDIR)$/th_de_AT_v2.idx : "$(EXTENSIONDIR)$/th_de_AT_v2.dat"
         $(COMMAND_ECHO)$(AUGMENT_LIBRARY_PATH) $(LOCAL_OUT_FOR_BUILD)$/bin$/idxdict -o $(EXTENSIONDIR)$/th_de_AT_v2.idx <$(EXTENSIONDIR)$/th_de_AT_v2.dat

.IF "$(WITH_LANG)" != ""
$(DESCRIPTION_SRC) : description.xml
    @@-$(MKDIRHIER) $(@:d)
    $(COMMAND_ECHO)$(XRMEX) -p $(PRJNAME) -i $< -o $@ -m $(LOCALIZESDF) -l all
.ENDIF
