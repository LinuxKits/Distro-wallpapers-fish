#!/usr/bin/fish
#this script is to download the wallpaper of each linux distros and use it as your wallpaper
#part#
	#head#
	function puller
        cd wallpaper/;;wget https://github.com/happyeggchen/Distro_wallpapers/raw/master/raw/latest/$distro.tar.gz;;tar xvf $distro.tar.gz;;rm $distro.tar.gz;;cd ..
    end
    
    function install_local
        if test -d wallpaper/$distro
            cp -r wallpaper/$distro ~/.local/share/wallpapers;;echo $distro >> wallpaper/installed.dat
        else
            puller;;cp -r wallpaper/$distro ~/.local/share/wallpapers;;echo $distro >> wallpaper/installed.dat
        end
    end
    
    
    function remove_local
        if test -d wallpaper/$distro
            rm -rf wallpaper/$distro ~/.local/share/wallpapers;;sed -i '/$distro/s/.*//g' wallpaper/installed.dat
            rm -rf ~/.local/share/wallpapers/$distro
        else
            echo "not installed"
        end
    end
    
	function wallpaper_installer
			echo "Available distros' wallpapers"
            echo "1-Debian | 2-Pop_OS!"
            echo "3-Zorin-OS | 4-aosp"
            echo "5-bluelake | 6-deepin"
            echo "7-elementary | 8-gnome"
            echo "9-lineageos | 10-manjaro_xfce"
            echo "11-mint | 12-plasma"
            echo "13-raspbian | 14-solus"
            echo "15-ubuntu"
            echo "type the number follow and hit enter"
            read dwallpaper
                switch $dwallpaper
                    case 1
                        set -g distro Debian;;install_local
                    case 2
                        set -g distro Pop_OS!;;install_local
                    case 3
                        set -g distro Zorin-OS;;install_local
                    case 4
                        set -g distro aosp;;install_local
                    case 5
                        set -g distro bluelake;;install_local
                    case 6
                        set -g distro deepin;;install_local
                    case 7
                        set -g distro elementary;;install_local
                    case 8
                        set -g distro gnome;;install_local
                    case 9
                        set -g distro lineageos;;install_local
                    case 10
                        set -g distro manjaro_xfce;;install_local
                    case 11
                        set -g distro mint;;install_local
                    case 12
                        set -g distro plasma;;install_local
                    case 13
                        set -g distro raspbian;install_local
                    case 14
                        set -g distro solus;;install_local
                    case 15
                        set -g distro ubuntu;;install_local
                end
    end
    
    function wallpaper_installer
            echo "remove a distro wallpaper"
            echo "1-Debian | 2-Pop_OS!"
            echo "3-Zorin-OS | 4-aosp"
            echo "5-bluelake | 6-deepin"
            echo "7-elementary | 8-gnome"
            echo "9-lineageos | 10-manjaro_xfce"
            echo "11-mint | 12-plasma"
            echo "13-raspbian | 14-solus"
            echo "15-ubuntu"
            echo "Installed wallpaper"
            cat wallpaper/installed.dat
            echo "type the number follow and hit enter"
            read rwallpaper
                switch $rwallpaper
                    case 1
                        set -g distro Debian;;remove_local
                    case 2
                        set -g distro Pop_OS!;;remove_local
                    case 3
                        set -g distro Zorin-OS;;remove_local
                    case 4
                        set -g distro aosp;;remove_local
                    case 5
                        set -g distro bluelake;;remove_local
                    case 6
                        set -g distro deepin;;remove_local
                    case 7
                        set -g distro elementary;;remove_local
                    case 8
                        set -g distro gnome;;remove_local
                    case 9
                        set -g distro lineageos;;remove_local
                    case 10
                        set -g distro manjaro_xfce;;remove_local
                    case 11
                        set -g distro mint;;remove_local
                    case 12
                        set -g distro plasma;;remove_local
                    case 13
                        set -g distro raspbian;remove_local
                    case 14
                        set -g distro solus;;remove_local
                    case 15
                        set -g distro ubuntu;;remove_local
                end
    end
#head_end#

#body#
    if test -d wallpaper
    else
    mkdir wallpaper
    end

    echo "1-wallpaper_installer|2-wallpaper_remover"
    echo "type the number follow and hit enter"
        read function
            switch $function
                case 1
                    wallpaper_installer
                case 2
                    wallpaper_remover
            end
#body_end#
