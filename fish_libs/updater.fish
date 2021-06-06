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
