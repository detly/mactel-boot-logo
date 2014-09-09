#!/usr/bin/make

# Invoke as "make LOGO_TYPE=ubuntu" to make an Ubuntu logo

LOGO_TYPE ?= blank

LOGO_DIR   = logos
LOGO_FILE  = $(LOGO_TYPE).icns

logo: $(LOGO_FILE)

$(LOGO_FILE): %.icns: $(LOGO_DIR)/%.svg
	rsvg-convert -w 128 -h 128 -o "$*.png" "$<"
	png2icns "$@" "$*.png"

all: logo

.PHONY: clean
clean:
	-rm *.png
	-rm *.icns
