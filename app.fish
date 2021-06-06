#!/usr/bin/fish
#app_info:checkdependence
#app_version:2021-4-30-b1
#by bluelake lab
#checkdependence.start
function checkdependence
  if test -e $argv
    echo -e "\033[32m[checkdependence]check passed - $argv exist\033[0m"
  else
    echo -e "\033[0;31m[checkdependence]check failed - plz install $argv\033[0m"
    exit
  end
end
#checkdependence.end
#app_info:checknetwork
#app_version:2021-4-30-b1
#by bluelake lab
#checknetwork.start
function checknetwork
  if curl -s -L $argv[1] | grep -q $argv[2]
    echo -e "\033[32m[checknetwork]check passed - u`ve connected to $argv[1]\033[0m"
  else
    echo -e "\033[0;31m[checknetwork]check failed - check your network connection\033[0m"
  end
end
#checknetwork.end
#app_info:dir_exist
#app_version:2021-5-7-b2
#by bluelake lab
#dir_exist.start
function dir_exist
  if test -d $argv[1]
    echo -e "\033[32m[checkdir]check passed - dir $argv[1] exist\033[0m"
  else
    echo -e "\033[0;31m[checkdir]check failed - dir $argv[1] doesn't exist,going to makr one\033[0m"
    mkdir $argv[1]
  end
end
#dir_exist.end
#app_info:ifcreate
#app_version:2021-5-22-b1
#by bluelake lab
#ifcreate.start
function ifcreate
  if $argv[1]
    $argv[2]
  else
    $argv[3]
  end
end
#ifcreate.end
#app_info:list_menu
#app_version:2021-4-30-b1
#by bluelake lab
#list_menu.start
function list_menu
ls $argv | sed '\~//~d'
end
#list_menu.end
#app_info:whget
#app_version:2021-4-30-b1
#by bluelake lab
#whget.start
function whget
      wget -U "$argv[3]" -q  $argv[2] -P $argv[1]
      echo "[cli]Done!---stored in $argv[1]/$argv[2]"
  end
#whget.end
#app_info:Updater
#app_version:2021-6-6-b1
#by linuxkits
#Updater.start
function updater
  echo -e "\033[32m[Updater]Now DWF_Version = $DWF_Version\033[0m"
  set -g version_online (curl -s -L https://raw.githubusercontent.com/LinuxKits/Distro-wallpapers-fish/master/version)
  if test "$version_online" = "$argv"
  else
    echo -e "\033[0;31m[Updater]latest version [$version_online] Available on github or network broken\033[0m"
  end
end
#updater.end
function downloader
      cd ~/.cache/Distro_wallpapers-CLI-fish/
      wget https://github.com/LinuxKits/Distro-wallpapers/releases/latest/download/$distro.tar.gz
      tar xvf $distro.tar.gz >/dev/null 2>&1
      rm $distro.tar.gz
      cd
      echo "[cli]Done!---stored in ~/.cache/Distro_wallpapers-CLI-fish/"
  end
function self_installer
  if test -e /usr/bin/distro_wallpapers
    echo -e "\033[0;31mfound a old file "/usr/bin/distro_wallpapers",delete it?It may not the old DWF so take care\033[0m"
    echo -e "\033[0;31mtype y to remove,n to keep it\033[0m"
    read -P "DWF-INSTALLER>" installer_found_old_one
      switch $installer_found_old_one
      case y
      sudo rm /usr/bin/distro_wallpapers
      echo "[cli]OK!---REINSTALL IT AGAIN"
      case n
      sudo cp core.fish /usr/bin/distro_wallpapers_fish
      echo "[cli]Done!---Installed to /usr/bin/distro_wallpapers_fish"
      case "*"
        echo "unexcpet input"
      end
    else
    sudo cp core.fish /usr/bin/distro_wallpapers_fish
    echo "[cli]Done!---Installed to /usr/bin/distro_wallpapers_fish"
  end
end
function installer
      if test -d ~/.cache/Distro_wallpapers-CLI-fish/$distro
          sudo mv ~/.cache/Distro_wallpapers-CLI-fish/$distro /usr/share/backgrounds/Distro_wallpapers-CLI-fish/
          echo "[cli]Done!---Installed to /usr/share/wallpapers/distro_wallpapers-CLI-fish"
        else
          downloader
          sudo mv ~/.cache/Distro_wallpapers-CLI-fish/$distro /usr/share/backgrounds/Distro_wallpapers-CLI-fish/
          echo "[cli]Done!---Installed to /usr/share/wallpapers/distro_wallpapers-CLI-fish"
      end
  end
function self_remover
      sudo rm /usr/bin/distro_wallpapers_fish
  end
function remover
      if test -d /usr/share/backgrounds/Distro_wallpapers-CLI-fish/$distro
          rm -rf ~/.cache/Distro_wallpapers-CLI-fish/$distro
          sudo rm -rf /usr/share/backgrounds/Distro_wallpapers-CLI-fish/$distro
          echo "[cli]Done!---removed from /usr/share/wallpapers/distro_wallpapers-CLI-fish"
        else
          echo "not installed"
      end
  end
#app_info:list_menu
#app_version:2021-4-30-b1
#by bluelake lab
#list_menu.start
function list_menu
ls $argv | sed '\~//~d'
end
#list_menu.end
function wallpaper_list
    echo "---------online-----------"
      echo 'last update ->'
       curl -L https://github.com/LinuxKits/Distro-wallpapers/releases/latest/download/date.txt
       echo "Available distros' wallpapers"
          echo "1-Debian | 2-Pop_OS!"
          echo "3-Zorin-OS | 4-aosp"
          echo "5-bluelake | 6-deepin"
          echo "7-elementary | 8-gnome"
          echo "9-lineageos | 10-manjaro_xfce"
          echo "11-mint | 12-plasma"
          echo "13-raspbian | 14-solus"
          echo "15-ubuntu | 16-Fedora"
          echo "17-endeavour | 18-MX-Linunx"
          echo "19-antiX | 20-kubuntu"
          echo "21-remixOS"
      echo "----------local-------------"
          echo "Installed wallpaper"
          list_menu /usr/share/backgrounds/Distro_wallpapers-CLI-fish/
          echo "--------------------------"
          echo "type the number follow and hit enter"
          read -P "DWF>" wallpaper
              switch $wallpaper
                  case 1
                      set -g distro Debian;;$argv
                  case 2
                      set -g distro Pop_OS;;$argv
                  case 3
                      set -g distro Zorin-OS;;$argv
                  case 4
                      set -g distro aosp;;$argv
                  case 5
                      set -g distro bluelake;;$argv
                  case 6
                      set -g distro deepin;;$argv
                  case 7
                      set -g distro elementary;;$argv
                  case 8
                      set -g distro gnome;;$argv
                  case 9
                      set -g distro lineageos;;$argv
                  case 10
                      set -g distro manjaro_xfce;;$argv
                  case 11
                      set -g distro mint;;$argv
                  case 12
                      set -g distro plasma;;$argv
                  case 13
                      set -g distro raspbian;$argv
                  case 14
                      set -g distro solus;;$argv
                  case 15
                      set -g distro ubuntu;;$argv
                  case 16
                      set -g distro Fedora;;$argv
                  case 17
                      set -g distro endeavour;;$argv
                  case 18
                      set -g distro MX-Linux;;$argv
                  case 19
                      set -g distro antiX;;$argv
                  case 20
                      set -g distro kubuntu;;$argv
                  case 21
                      set -g distro remixOS;$argv
                  case "*"
                      echo "unexcpet input"
              end
  end
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
#build time UTC = 2021-06-06_06:12:23
