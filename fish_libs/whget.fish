#app_info:whget
#app_version:2021-4-30-b1
#by bluelake lab
#whget.start
function whget
      wget -U "$argv[3]" -q  $argv[2] -P $argv[1]
      echo "[cli]Done!---stored in $argv[1]/$argv[2]"
  end
#whget.end
