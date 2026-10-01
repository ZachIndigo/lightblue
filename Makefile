LAUNCHAGENTDIR := ~/Library/LaunchAgents
PLIST := tv.newhopechurch.blinkstick.plist

all:
	./configure

install: install-sudoers install-plist
	sudo cp lightblue.sh /usr/local/bin/lightblue.sh

install-plist: $(PLIST)
	mkdir -p $(LAUNCHAGENTDIR)
	cp ./$(PLIST) $(LAUNCHAGENTDIR)/$(PLIST)

venv:
	mkdir -p ~/Scripts/venv
	/opt/homebrew/bin/python3.14 -m venv ~/Scripts/venv
	~/Scripts/venv/bin/pip install blinkstick
	~/Scripts/venv/bin/pip install pyusb

.PHONY: install install-plist
