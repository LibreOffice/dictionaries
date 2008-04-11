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
# $Revision: 1.8 $
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
TARGET	= dict_it_IT

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ALL)$(DIC_ITIT)"!=""

DIC2BIN= \
    it_IT.aff \
    it_IT.dic \
    hyph_it_IT.dic \
    README_it_IT.txt \
    README_it_IT_thes.txt

.ENDIF

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk
.INCLUDE : $(PRJ)$/util$/target.pmk

.IF "$(DIC_ALL)$(DIC_ITIT)"!=""

ALLTAR : $(MISC)$/th_it_IT_v2.don

$(MISC)$/th_it_IT_v2.don: th_it_IT_v2.zip
    cd $(BIN) && $(WRAPCMD) unzip -o $(PWD)$/th_it_IT_v2.zip
    $(PERL) $(PRJ)$/util$/th_gen_idx.pl -o $(BIN)$/th_it_IT_v2.idx <$(BIN)$/th_it_IT_v2.dat && $(TOUCH) $(MISC)$/th_it_IT_v2.don

.ENDIF			# "$(DIC_ALL)$(DIC_ITIT)"!=""
