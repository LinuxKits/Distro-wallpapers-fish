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
