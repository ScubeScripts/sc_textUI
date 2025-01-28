fx_version 'cerulean'
game 'gta5'

name "sc_textUI"
author "ScubeScripts"
description "Simple textUI"
version "1.0.0"

ui_page 'ui/textui.html'

client_scripts {
    'client/*.lua'
  }

server_scripts {
    'server/*.lua'
}

files {
    'ui/*.html'
}

export 'showUI'
export 'hideUI'
