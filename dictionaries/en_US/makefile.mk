#*************************************************************************
#
#   $RCSfile: makefile.mk,v $
#
#   $Revision: 1.2 $
#
#   last change: $Author: khendricks $ $Date: 2003-06-24 19:07:02 $
#
#   The Contents of this file are made available subject to the terms of
#   either of the following licenses
#
#          - GNU Lesser General Public License Version 2.1
#          - Sun Industry Standards Source License Version 1.1
#
#   Sun Microsystems Inc., October, 2000
#
#   GNU Lesser General Public License Version 2.1
#   =============================================
#   Copyright 2000 by Sun Microsystems, Inc.
#   901 San Antonio Road, Palo Alto, CA 94303, USA
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License version 2.1, as published by the Free Software Foundation.
#
#   This library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public
#   License along with this library; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston,
#   MA  02111-1307  USA
#
#
#   Sun Industry Standards Source License Version 1.1
#   =================================================
#   The contents of this file are subject to the Sun Industry Standards
#   Source License Version 1.1 (the "License"); You may not use this file
#   except in compliance with the License. You may obtain a copy of the
#   License at http://www.openoffice.org/license.html.
#
#   Software provided under this License is provided on an "AS IS" basis,
#   WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
#   WITHOUT LIMITATION, WARRANTIES THAT THE SOFTWARE IS FREE OF DEFECTS,
#   MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE, OR NON-INFRINGING.
#   See the License for the specific provisions governing your rights and
#   obligations concerning the Software.
#
#   The Initial Developer of the Original Code is: Sun Microsystems, Inc.
#
#   Copyright: 2000 by Sun Microsystems, Inc.
#
#   All Rights Reserved.
#
#   Contributor(s): _______________________________________
#
#
#
#*************************************************************************

PRJ = ..

PRJNAME	= dictionaries
TARGET	= dict_en_US
LIBTARGET=NO

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ENUS)"!="" 

all_target: $(MISC)$/$(TARGET).don  $(MISC)$/th_en_US.don

.IF "$(GUI)" == "WNT"
ATHENCODE=      thencode.exe
.ELSE
ATHENCODE=      thencode
.ENDIF

DIC2BIN= \
    en_US.aff \
    en_US.dic \
    hyph_en_US.dic


$(MISC)$/$(TARGET).don : $(MISC)$/th_en_US.don
    +$(COPY) $(foreach,i,$(DIC2BIN) $i) $(BIN)
    @echo "DICT en US en_US">>$(BIN)$/dictionary.lst
    @echo "HYPH en US hyph_en_US">>$(BIN)$/dictionary.lst
    @echo "THES en US th_en_US">>$(BIN)$/dictionary.lst
    @touch $@

.ENDIF

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk

$(MISC)$/th_en_US.don: $(SOLARVER)$/$(UPD)$/$(INPATH)$/bin$/$(ATHENCODE) $(MISC)$/th_en_US_words.txt $(MISC)$/th_en_US_thes.txt
    $(WRAPCMD)  $(SOLARVER)$/$(UPD)$/$(INPATH)$/bin$/$(ATHENCODE) $(MISC) $(BIN) th_en_US && $(TOUCH) $(@)

#unzip the text input files
$(MISC)$/th_en_US_words.txt:	th_en_US_words.zip
# cd is a 4nt internal command, we need a '+'
    +cd $(MISC) && $(WRAPCMD) jar xf $(PWD)$/th_en_US_words.zip

$(MISC)$/th_en_US_thes.txt:	th_en_US_thes.zip
# ditto
    +cd $(MISC) && $(WRAPCMD) jar xf $(PWD)$/th_en_US_thes.zip
