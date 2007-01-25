#*************************************************************************
#
#   OpenOffice.org - a multi-platform office productivity suite
#
#   $RCSfile: makefile.mk,v $
#
#   $Revision: 1.4 $
#
#   last change: $Author: obo $ $Date: 2007-01-25 13:39:34 $
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
TARGET  = dict_de_CH

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ALL)$(DIC_DECH)"!=""

DIC2BIN= \
    de_CH.aff \
    de_CH.dic \
    COPYING \
    COPYING_OASIS \
    Copyright \
    INSTALL_de.txt \
    README_de_CH.txt \
    VERSION

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
    cd $(BIN) && $(WRAPCMD) unzip -o $(PWD)$/thes_de_CH_v2.zip

.ENDIF

