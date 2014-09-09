#!/usr/bin/make -f

# Copyright 2014 Jason Heeris, jason.heeris@gmail.com
# 
# This file is part of mactel-boot-logo, and is licensed under the GPL v3:
# https://github.com/detly/mactel-boot-logo/blob/master/COPYING

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
