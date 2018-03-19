# Makefile for doc-kit
#
# Copyright (C) 2018 SUSE Linux GmbH
#
# Author:
# Stefan Knorr <sknorr@suse.de>
#

ifndef PREFIX_BIN
  PREFIX := /usr/bin
endif
ifndef PREFIX_EXTRA
  PREFIX := /usr/share
endif

SHELL         := /bin/bash
PACKAGE       := doc-kit

CDIR          := $(shell pwd)
BUILD_DIR     := build
CBUILD_DIR    := $(CDIR)/$(BUILD_DIR)
INSTALL_EXTRA := doc/packages/doc-kit

# project version number
VERSION       := 0.1

.PHONY: build install dist clean
all: dist

build/doc-kit: bin/doc-kit $(BUILD_DIR)
	cp $< $@

build/LICENSE: LICENSE $(BUILD_DIR)
	cp $< $@

build/README.md: README.md $(BUILD_DIR)
	cp $< $@

install: $(INSTALL_EXTRA)
	install -m755 bin/doc-kit $(PREFIX_BIN)
	install -m644 LICENSE $(PREFIX_EXTRA)/$(INSTALL_EXTRA)
	install -m644 README.md $(PREFIX_EXTRA)/$(INSTALL_EXTRA)

$(INSTALL_DIR) $(BUILD_DIR):
	@mkdir -p $@

dist: build/doc-kit build/README.md build/LICENSE
	@tar cfjhP $(PACKAGE)-$(VERSION).tar.bz2 \
	  --transform 's:^$(CBUILD_DIR):$(PACKAGE)-$(VERSION):' \
	  $(CBUILD_DIR)
	@echo "Successfully created $(PACKAGE)-$(VERSION).tar.bz2"

#	  -C $(BUILD_DIR) \
#

clean:
	@rm -rf $(BUILD_DIR) 2> /dev/null || echo
	@rm $(PACKAGE)-*.tar.bz2 2> /dev/null || echo
	@echo "All deleted."
