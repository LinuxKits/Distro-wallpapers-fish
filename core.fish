#!/usr/bin/fish
  function downloader
      cd ~/.cache/Distro_wallpapers-CLI-fish/
      wget https://github.com/LinuxKits/Distro_wallpapers/releases/latest/download/$distro.tar.gz
      tar xvf $distro.tar.gz >/dev/null 2>&1
      rm $distro.tar.gz
      cd
      echo "[cli]Done!---stored in ~/.cache/Distro_wallpapers-CLI-fish/"
  end

  function self_installer
      sudo cp core.fish /usr/bin/distro_wallpapers
  end

  function installer
      if test -d ~/.cache/Distro_wallpapers-CLI-fish/$distro
          sudo mv ~/.cache/Distro_wallpapers-CLI-fish/$distro /usr/share/wallpapers/Distro_wallpapers-CLI-fish/
          echo "[cli]Done!---Installed to /usr/share/wallpapers/distro_wallpapers-CLI-fish"
        else
          downloader
          sudo mv ~/.cache/Distro_wallpapers-CLI-fish/$distro /usr/share/wallpapers/Distro_wallpapers-CLI-fish/
          echo "[cli]Done!---Installed to /usr/share/wallpapers/distro_wallpapers-CLI-fish"
      end
  end

  function self_remover
      sudo rm /usr/bin/distro_wallpapers
  end

  function remover
      if test -d /usr/share/wallpapers/Distro_wallpapers-CLI-fish/$distro
          rm -rf ~/.cache/Distro_wallpapers-CLI-fish/$distro
          sudo rm -rf /usr/share/wallpapers/Distro_wallpapers-CLI-fish/$distro
          echo "[cli]Done!---removed from /usr/share/wallpapers/distro_wallpapers-CLI-fish"
        else
          echo "not installed"
      end
  end

  function wallpaper_list
    echo "---------online-----------"
      echo 'last update ->'
       curl -L https://github.com/LinuxKits/Distro_wallpapers/releases/latest/download/date.txt
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
      echo "----------local-------------"
          echo "Installed wallpaper"
          ls /usr/share/wallpapers/Distro_wallpapers-CLI-fish/ | sed '\~//~d'
          echo "--------------------------"
          echo "type the number follow and hit enter"
          read -P "inputbox>" wallpaper
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
                  case "*"
                      echo "unexcpet input"
              end
  end

if test -d ~/.cache/Distro_wallpapers-CLI-fish/
      else
          mkdir ~/.cache/Distro_wallpapers-CLI-fish/
end

if test -d /usr/share/wallpapers/Distro_wallpapers-CLI-fish/
      else
          echo "[error]no /usr/share/wallpapers/Distro_wallpapers-CLI-fish/ , using sudo to create one"
          sudo mkdir /usr/share/wallpapers/Distro_wallpapers-CLI-fish/
end
  echo "version 2021-04-02_12:17:14"
  echo ""
  echo "Script will need sudo to install wallpapers into /usr/share/wallpapers"
  echo "1 wallpaper installer"
  echo "2 wallpaper remover"
  echo "3 wallpaper puller"
  echo "4 install the script to /usr/bin"
  echo "5 remove the script in /usr/bin"
  echo "type the number follow and hit enter"
  switch $argv
  case ""
    read -P "input>" menu1
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
      end
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
    end
# done
