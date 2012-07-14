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
TARGET=dict-da

# --- Settings -----------------------------------------------------

.INCLUDE: settings.mk
# it might be useful to have an extension wide include to set things
# like the EXTNAME variable (used for configuration processing)
# .INCLUDE :  $(PRJ)$/source$/<extension name>$/<extension_name>.pmk

# --- Files --------------------------------------------------------

# name for uniq directory
EXTENSIONNAME:=dict-da
EXTENSION_ZIPNAME:=dict-da

# some other targets to be done

# --- Extension packaging ------------------------------------------

.IF "$(WITH_LANG)" != ""
DESCRIPTION_SRC:=$(MISC)/$(EXTENSIONNAME)_in/description.xml
.ENDIF 

# just copy:
COMPONENT_FILES= \
    $(EXTENSIONDIR)$/da_DK.aff \
    $(EXTENSIONDIR)$/da_DK.dic \
    $(EXTENSIONDIR)$/desc_da_DK.txt \
    $(EXTENSIONDIR)$/desc_en_US.txt \
    $(EXTENSIONDIR)$/hyph_da_DK.dic \
    $(EXTENSIONDIR)$/Trold_42x42.png \
    $(EXTENSIONDIR)$/th_da_DK.dat \
    $(EXTENSIONDIR)$/README_th_da_DK.txt \
    $(EXTENSIONDIR)$/HYPH_da_DK_README.txt \
    $(EXTENSIONDIR)$/help/en/help.tree \
    $(EXTENSIONDIR)$/help/da/help.tree \
    $(EXTENSIONDIR)$/help/da/org.openoffice.da.hunspell.dictionaries/page1.xhp \
    $(EXTENSIONDIR)$/help/da/org.openoffice.da.hunspell.dictionaries/page2.xhp \
    $(EXTENSIONDIR)$/help/da/org.openoffice.da.hunspell.dictionaries/Trold.png


COMPONENT_CONFIGDEST=.
COMPONENT_XCU= \
    $(EXTENSIONDIR)$/dictionaries.xcu

# disable fetching default OOo license text
CUSTOM_LICENSE=README_da_DK.txt
# override default license destination
PACKLICS= $(EXTENSIONDIR)$/$(CUSTOM_LICENSE)

COMPONENT_UNZIP_FILES= \
    $(EXTENSIONDIR)$/th_da_DK.idx

# add own targets to packing dependencies (need to be done before
# packing the xtension
# EXTENSION_PACKDEPS=makefile.mk $(CUSTOM_LICENSE)
EXTENSION_PACKDEPS=$(COMPONENT_FILES) $(COMPONENT_UNZIP_FILES)

# global settings for extension packing
.INCLUDE : extension_pre.mk
.INCLUDE : target.mk
# global targets for extension packing
.INCLUDE : extension_post.mk

.INCLUDE :  $(PRJ)$/prj$/tests.mk

$(EXTENSIONDIR)$/th_da_DK.idx : "$(EXTENSIONDIR)$/th_da_DK.dat"
         $(COMMAND_ECHO)$(AUGMENT_LIBRARY_PATH) $(OUTDIR_FOR_BUILD)$/bin$/idxdict -o $(EXTENSIONDIR)$/th_da_DK.idx <$(EXTENSIONDIR)$/th_da_DK.dat

.IF "$(WITH_LANG)" != ""
$(DESCRIPTION_SRC) : description.xml
    @@-$(MKDIRHIER) $(@:d)
    $(COMMAND_ECHO)$(XRMEX) -p $(PRJNAME) -i $< -o $@ -m $(LOCALIZESDF) -l all
.ENDIF
