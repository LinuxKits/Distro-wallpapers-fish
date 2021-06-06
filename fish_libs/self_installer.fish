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
