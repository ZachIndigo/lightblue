LAUNCHAGENTDIR := ~/Library/LaunchAgents
PLIST := tv.newhopechurch.blinkstick.plist
SCRIPT := light-blue.sh
VENVDIR := ~/Scripts/venv

all: venv
	./configure

install: install-sudoers install-plist install-libusb install-python
	sudo cp $(SCRIPT) /usr/local/bin/$(SCRIPT)

install-sudoers:
	@printf "%s ALL=(ALL) NOPASSWD: %s/Scripts/venv/bin/python3.14 %s/Scripts/venv/bin/blinkstick --set-color \\#4040ff\n\n" "graphics" "/Users/graphics" "/Users/graphics" | sudo tee /etc/sudoers.d/lightblue

install-plist: $(PLIST)
	mkdir -p $(LAUNCHAGENTDIR)
	cp ./$(PLIST) $(LAUNCHAGENTDIR)/$(PLIST)

install-libusb: install-brew
	brew install libusb
	sudo mkdir -p /usr/local/lib
	sudo cp /opt/homebrew/lib/libusb* /usr/local/lib/.

install-python: install-brew
	brew install python@3.14

install-brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

venv:
	mkdir -p $(VENVDIR)
	/opt/homebrew/bin/python3.14 -m venv $(VENVDIR)
	$(VENVDIR)/bin/pip install blinkstick
	$(VENVDIR)/bin/pip install pyusb

.PHONY: install install-brew install-libusb install-plist install-python venv
