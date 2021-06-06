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
