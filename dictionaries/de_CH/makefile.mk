#*************************************************************************
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
# 
# Copyright 2008 by Sun Microsystems, Inc.
#
# OpenOffice.org - a multi-platform office productivity suite
#
# $RCSfile: makefile.mk,v $
#
# $Revision: 1.7 $
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

PRJ = ..

PRJNAME	= dictionaries
TARGET  = dict_de_CH

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ALL)$(DIC_DECH)"!=""

DIC2BIN= \
    de_CH.aff \
    de_CH.dic \
    README_de_CH.txt

.ENDIF

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk
.INCLUDE : $(PRJ)$/util$/target.pmk

#
# add thesaurus for de_CH
#
.IF "$(DIC_ALL)$(DIC_DECH)"!=""

ALLTAR : $(MISC)$/thes_de_CH_v2.don

$(MISC)$/thes_de_CH_v2.don: thes_de_CH_v2.zip
    cd $(BIN) && $(WRAPCMD) unzip -o $(PWD)$/thes_de_CH_v2.zip && $(TOUCH) ..$/misc$/thes_de_CH_v2.don

.ENDIF

