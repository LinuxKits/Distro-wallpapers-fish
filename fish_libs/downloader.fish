function downloader
      cd ~/.cache/Distro_wallpapers-CLI-fish/
      wget https://github.com/LinuxKits/Distro-wallpapers/releases/latest/download/$distro.tar.gz
      tar xvf $distro.tar.gz >/dev/null 2>&1
      rm $distro.tar.gz
      cd
      echo "[cli]Done!---stored in ~/.cache/Distro_wallpapers-CLI-fish/"
  end
