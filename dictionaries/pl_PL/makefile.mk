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
TARGET  = dict_pl_PL

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ALL)$(DIC_PLPL)"!="" 

# DIC2BIN must be non-empty in order to generate the respective lines for
# Polish in the dictionary.lst of the writingaids.zip

DIC2BIN = \
    hyph_pl_PL.dic \
    README_hyph_pl_PL.txt \
    pl_PL.aff \
    pl_PL.dic \
    README_pl_PL.txt

.ENDIF

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk
.INCLUDE : $(PRJ)$/util$/target.pmk

.IF "$(DIC_ALL)$(DIC_PLPL)"!=""

ALLTAR : $(MISC)$/th_pl_PL_v2.don

$(MISC)$/th_pl_PL_v2.don: th_pl_PL_v2.zip
    cd $(BIN) && $(WRAPCMD) unzip -o $(PWD)$/th_pl_PL_v2.zip && $(TOUCH) ..$/misc$/th_pl_PL_v2.don
# .idx file is already part of the zip-archive
#    +$(PERL) $(PRJ)$/util$/th_gen_idx.pl -o $(BIN)$/th_pl_PL_v2.idx <$(BIN)$/th_pl_PL_v2.dat && $(TOUCH) $(MISC)$/th_pl_PL_v2.don

.ENDIF          # "$(DIC_ALL)$(DIC_PLPL)"!=""
