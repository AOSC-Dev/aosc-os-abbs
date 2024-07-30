#
# Loads LATX (Loongson Architecture Translator for x86) preferences.
#
# Edit:
#
#     - ~/.config/latx.conf to change LATX's user preferences.
#     - /etc/latx.conf to change LATX's global preferences.
#
if [ ! -e "$HOME/.config/latx.conf" ]; then
	cp /etc/latx.conf \
		"$HOME/.config/latx.conf"
fi

if [ -e "$HOME/.config/latx.conf" ]; then
	source "$HOME/.config/latx.conf"
elif [ -e /etc/latx.conf ]; then
	source /etc/latx.conf
fi
