PRJ=..
PRJNAME=dictionaries
TARGET=pack_writing_aids

.INCLUDE : settings.mk

ZIP1TARGET      = writingaids
ZIP1LIST        = $(BIN)$/*.dic $(BIN)$/*.aff $(BIN)$/*.txt $(BIN)$/*.lst $(BIN)$/*.idx $(BIN)$/*.dat $(BIN)$/*.sxw

.INCLUDE : target.mk

