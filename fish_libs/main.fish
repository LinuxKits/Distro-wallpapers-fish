#app_info:Distro_wallpapers-fish
#app_version:2021-6-6-b1
#by linuxkits
#Distro_wallpapers-fish.start
set -g DWF_Version 2021-6-6-b1
if test -d ~/.cache/Distro_wallpapers-CLI-fish/
      else
          mkdir ~/.cache/Distro_wallpapers-CLI-fish/
end

if test -d /usr/share/backgrounds/
else
  echo "[error]no /usr/share/backgrounds , using sudo to create one"
  sudo mkdir /usr/share/backgrounds
end

if test -d /usr/share/backgrounds/Distro_wallpapers-CLI-fish/
      else
          echo "[error]no /usr/share/backgrounds/Distro_wallpapers-CLI-fish/ , using sudo to create one"
          sudo mkdir /usr/share/backgrounds/Distro_wallpapers-CLI-fish/
end

if test -d /usr/share/wallpapers/
else
  echo "[error]no /usr/share/wallpapers/ , using sudo to create one"
  sudo mkdir /usr/share/wallpapers
end

if test -d /usr/share/backgrounds/gnome/
else
  echo "[error]no /usr/share/backgrounds/gnome/ , using sudo to create one"
  sudo mkdir /usr/share/backgrounds/gnome/
end

if test -d /usr/share/wallpapers/Distro_wallpapers-CLI-fish
      else
          echo "[error]no /usr/share/wallpapers/Distro_wallpapers-CLI-fish/ , using sudo to link one"
          sudo ln -s  /usr/share/backgrounds/Distro_wallpapers-CLI-fish/ /usr/share/wallpapers/Distro_wallpapers-CLI-fish
end
if test -d /usr/share/backgrounds/gnome/Distro_wallpapers-CLI-fish
      else
          echo "[error]no /usr/share/backgrounds/gnome/Distro_wallpapers-CLI-fish/ , using sudo to link one"
          sudo ln -s  /usr/share/backgrounds/Distro_wallpapers-CLI-fish/ /usr/share/backgrounds/gnome/Distro_wallpapers-CLI-fish
end
checkdependence /usr/bin/wget
checkdependence /usr/bin/curl
checknetwork github.com software
updater $DWF_Version
set -g version_online ""
while test "-0-" = "-0-"
echo ""
echo -e "\033[33mScript will need sudo to install wallpapers into /usr/share/wallpapers\033[0m"
echo -e "\033[36m(1) wallpaper installer\033[0m"
echo -e "\033[36m(2) wallpaper remover\033[0m"
echo -e "\033[36m(3) wallpaper puller\033[0m"
echo -e "\033[36m(4) install the script to /usr/bin\033[0m"
echo -e "\033[36m(5) remove the script in /usr/bin\033[0m"
echo -e "\033[36m(6) exit\033[0m"
echo -e "\033[33mtype the number follow and hit enter\033[0m"
  read -P "DWF>" menu1
    switch $menu1
    case 1
      wallpaper_list installer
    case 2
      wallpaper_list remover
    case 3
      wallpaper_list downloader
    case 4
      self_installer
    case 5
      self_remover
    case 6
      exit
    end
  end
#Distro_wallpapers-fish.end
