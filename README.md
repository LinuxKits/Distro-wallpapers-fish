# Distro_wallpapers-CLI-fish
This is a fish shell script or program to browse, download, configure and install the wallpapers via nitrogen from [Distro_wallpapers](https://github.com/happyeggchen/Distro_wallpapers).

# What it does
1. Interact with the user through the script by printing various options and letting the user choose an option like this :-
```
Script will need sudo to install wallpapers into /usr/share/wallpapers
1 wallpaper installer
2 wallpaper remover
3 wallpaper puller
4 install the script to /usr/bin
5 remove the script in /usr/bin
type the number follow and hit enter
input>
```
# Detailed information
## the first menu page
- 1 installer -> download and install wallpapers to /usr/share/wallpapers
- 2 remover -> scan all wallpapers which was installed by this script then remove it
- 3 puller -> simply pull the wallpapers dirs into ~/.cache/Distro_wallpapers-CLI-fish/
- 4 self_installer -> install the script to /usr/bin/distro_wallpapers (use distro_wallpapers) in shell to run this script)
- 5 self_remover -> remove the script from /usr/bin/
## other things
- you can use core.fish 1(or 2,3,4,5) to enter specific menu such as installer or remover
