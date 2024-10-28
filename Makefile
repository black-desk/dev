DESTDIR ?=

prefix      ?= /usr/local
bindir      ?= $(prefix)/bin
datarootdir ?= $(prefix)/share

INSTALL         ?= install
INSTALL_PROGRAM ?= $(INSTALL)
INSTALL_DATA    ?= $(INSTALL) -m 644

SHELL = sh

.PHONY: all
all:

.PHONY: clean
clean:

.PHONY: test
test:
	@echo "No tests yet"
	@false

.PHONY: install-bin
install-bin:
	$(INSTALL) -d "$(DESTDIR)$(bindir)"
	$(INSTALL_PROGRAM) bin/dev "$(DESTDIR)$(bindir)"/dev


.PHONY: install-data
install-data:
	$(INSTALL) -d "$(DESTDIR)$(datarootdir)"/dev
	$(INSTALL_DATA) share/dev/CMakeUserPresets.json "$(DESTDIR)$(datarootdir)"/dev/CMakeUserPresets.json
	$(INSTALL_DATA) share/dev/dev-autotools "$(DESTDIR)$(datarootdir)"/dev/dev-autotools
	$(INSTALL_DATA) share/dev/dev-cargo "$(DESTDIR)$(datarootdir)"/dev/dev-cargo
	$(INSTALL_DATA) share/dev/dev-cmake "$(DESTDIR)$(datarootdir)"/dev/dev-cmake
	$(INSTALL_DATA) share/dev/dev-go "$(DESTDIR)$(datarootdir)"/dev/dev-go
	$(INSTALL_DATA) share/dev/dev-utils "$(DESTDIR)$(datarootdir)"/dev/dev-utils

.PHONY: install
install: install-bin install-data

.PHONY: uninstall-bin
uninstall-bin:
	rm -f "$(DESTDIR)$(bindir)"/dev

.PHONY: uninstall-data
uninstall-data:
	rm -f "$(DESTDIR)$(datarootdir)"/dev/CMakeUserPresets.json
	rm -f "$(DESTDIR)$(datarootdir)"/dev/dev-autotools
	rm -f "$(DESTDIR)$(datarootdir)"/dev/dev-cargo
	rm -f "$(DESTDIR)$(datarootdir)"/dev/dev-cmake
	rm -f "$(DESTDIR)$(datarootdir)"/dev/dev-go
	rm -f "$(DESTDIR)$(datarootdir)"/dev/dev-utils

.PHONY: uninstall
uninstall: uninstall-bin uninstall-data
