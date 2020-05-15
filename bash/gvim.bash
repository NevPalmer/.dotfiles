#!/bin/bash
exec=/usr/bin/gvim  #the path to gvim
if [ $# -eq 0 ]
  then  # no filename given
    if [ -z "$($exec --serverlist)" ]
      then  # no filename given and no gvim instance
        $exec -f --servername GVIM > /dev/null 2>&1
      else  # no filename given, but a gvim instance exists
        $exec -f --servername GVIM --remote-send ':vnew<CR>' > /dev/null 2>&1
    fi
  else  # filenames given
    if [ -z "$($exec --serverlist)" ]
      then
        $exec -f --servername GVIM --remote "$@" > /dev/null 2>&1
      else
        $exec -f --servername GVIM --remote +vsplit "$@" > /dev/null 2>&1
        $exec -f --servername GVIM --remote-send '<C-W>h:bp<CR><C-W>l' > /dev/null 2>&1
    fi
fi
