dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY&
gnome-keyring-daemon --start --components=secrets&
# use systemd-environment-d-generator(8) to generate environment, and export those variables
export $(run-parts /usr/lib/systemd/user-environment-generators | sed '/:$/d; /^$/d' | xargs)
