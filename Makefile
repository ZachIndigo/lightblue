LAUNCHAGENTDIR := ~/Library/LaunchAgents
PLIST := tv.newhopechurch.blinkstick.plist
SCRIPT := light-blue.sh
VENVDIR := ~/Scripts/venv

all: venv
	./configure

install: install-sudoers install-plist
	sudo cp $(SCRIPT) /usr/local/bin/$(SCRIPT)

install-plist: $(PLIST)
	mkdir -p $(LAUNCHAGENTDIR)
	cp ./$(PLIST) $(LAUNCHAGENTDIR)/$(PLIST)

venv:
	mkdir -p $(VENVDIR)
	/opt/homebrew/bin/python3.14 -m venv $(VENVDIR)
	$(VENVDIR)/bin/pip install blinkstick
	$(VENVDIR)/bin/pip install pyusb

.PHONY: install install-plist venv
