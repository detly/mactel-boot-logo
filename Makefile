#!/usr/bin/make

LOGO_FILE ?= dummy-logo.icns

logo: $(LOGO_FILE)

$(LOGO_FILE): %.icns: %.svg
	rsvg-convert -w 128 -h 128 -o "$*.png" "$<"
	png2icns "$@" "$*.png"

.PHONY: clean
clean:
	-rm *.png
	-rm *.icns
