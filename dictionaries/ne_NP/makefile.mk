#*************************************************************************
#
#   OpenOffice.org - a multi-platform office productivity suite
#
#   $RCSfile: makefile.mk,v $
#
#   $Revision: 1.2 $
#
#   last change: $Author: kz $ $Date: 2007-12-12 13:22:46 $
#
#   The Contents of this file are made available subject to
#   the terms of GNU Lesser General Public License Version 2.1.
#
#
#     GNU Lesser General Public License Version 2.1
#     =============================================
#     Copyright 2005 by Sun Microsystems, Inc.
#     901 San Antonio Road, Palo Alto, CA 94303, USA
#
#     This library is free software; you can redistribute it and/or
#     modify it under the terms of the GNU Lesser General Public
#     License version 2.1, as published by the Free Software Foundation.
#
#     This library is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#     Lesser General Public License for more details.
#
#     You should have received a copy of the GNU Lesser General Public
#     License along with this library; if not, write to the Free Software
#     Foundation, Inc., 59 Temple Place, Suite 330, Boston,
#     MA  02111-1307  USA
#
#*************************************************************************

PRJ = ..

PRJNAME	= dictionaries
TARGET	= dict_ne_NP

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ALL)$(DIC_NENP)"!=""

DIC2BIN= \
    ne_NP.aff \
    ne_NP.dic \
    README_ne_NP.txt \
    README_th_ne_NP_v2.txt

.ENDIF

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk
.INCLUDE : $(PRJ)$/util$/target.pmk

.IF "$(DIC_ALL)$(DIC_NENP)"!=""

ALLTAR : $(MISC)$/th_ne_NP_v2.don

$(MISC)$/th_ne_NP_v2.don: th_ne_NP_v2.zip
    +cd $(BIN) && $(WRAPCMD) unzip -o $(PWD)$/th_ne_NP_v2.zip
    +$(PERL) $(PRJ)$/util$/th_gen_idx.pl -o $(BIN)$/th_ne_NP_v2.idx <$(BIN)$/th_ne_NP_v2.dat && $(TOUCH) $(MISC)$/th_ne_NP_v2.don

.ENDIF			# "$(DIC_ALL)$(DIC_NENP)"!=""
