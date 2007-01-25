#*************************************************************************
#
#   OpenOffice.org - a multi-platform office productivity suite
#
#   $RCSfile: makefile.mk,v $
#
#   $Revision: 1.8 $
#
#   last change: $Author: obo $ $Date: 2007-01-25 13:40:02 $
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
TARGET	= dict_list

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

all_target: $(MISC)$/$(TARGET).don 

DIC2BIN= \
    dictionary_head \
    DicOOo.sxw

.IF "$(WITH_FONTOOO)" == "YES"
DIC2BIN+=	FontOOo.sxw
.ENDIF

$(MISC)$/$(TARGET).don : $(DIC2BIN)
    $(COPY) $(foreach,i,$(DIC2BIN) $i) $(BIN)
    @$(TOUCH) $@

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk

