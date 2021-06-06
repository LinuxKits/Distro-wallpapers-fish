#!/usr/bin/fish
  #this is a Earthenfish mods info files
  function import
    cat fish_libs/$argv.fish >> app.fish
  end
#import something here,write your mods in fish_libs
import header
import checkdependence
import checknetwork
import dir_exist
import ifcreate
import list_menu
import whget
import updater
import downloader
import self_installer
import installer
import self_remover
import remover
import list_menu
import wallpaper_list
import main
