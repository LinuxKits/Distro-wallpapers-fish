function remover
      if test -d /usr/share/backgrounds/Distro_wallpapers-CLI-fish/$distro
          rm -rf ~/.cache/Distro_wallpapers-CLI-fish/$distro
          sudo rm -rf /usr/share/backgrounds/Distro_wallpapers-CLI-fish/$distro
          echo "[cli]Done!---removed from /usr/share/wallpapers/distro_wallpapers-CLI-fish"
        else
          echo "not installed"
      end
  end
