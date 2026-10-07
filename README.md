# LIGHTBLUE

Lightblue is a script to tell a blinkstick square to always be on a certain
color, so we can use them to identify which Mac is live on a KVM.

## INSTALL

As an administrator, run:

`make install`

to setup the system side of things. You will need to edit the light-blue.sh and
/etc/sudoers.d/lightblue files to use the color code you intend for this Mac if
not the default (#4040ff).

As the graphics user, run:

`make`

to setup the venv, install dependencies, and install the LaunchAgent.
