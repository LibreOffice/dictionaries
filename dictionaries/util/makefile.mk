PRJ=..
PRJNAME=dictionaries
TARGET=writingaids

.INCLUDE : settings.mk

ZIP1TARGET      = writingaids
ZIP1LIST        = $(BIN)$/*.dic $(BIN)$/*.aff $(BIN)$/*.txt $(BIN)$/dictionary.lst $(BIN)$/*.idx $(BIN)$/*.dat

.INCLUDE : target.mk

