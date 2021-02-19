# #!/bin/bash
# Applications
#dwmblocks &
#compton &
#bar &
#udiskie &
#picom &
#random-paper &
sync-xmodmap &
fehbg &
usbdaemon &
wmname LG3D &
tlp-wrapper &
random-vpn &
sudo .bin/pbp-cpu big off &
transmission-daemon -w downloads/torrents -T &
mpd &
dunst -lto 2 -nto 2 -cto 2 &
xrdb -merge ~/.Xresources &
pulseaudio &
xbanish &
xsetroot -cursor_name left_ptr &
blueman-applet &
#sync-mail &
#setxkbmap -option caps:escape &

session=${1:-bspwm}
case $session in
	bspwm)
		sxhkd &
		exec bspwm
		;;
	ob|openbox)
		exec openbox-session
		;;
	xfce|xfce4)
		exec xfce4-session
		;;
esac
