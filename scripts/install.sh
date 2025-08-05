#!/usr/bin/env zsh
SCRIPTS_DIR=${0:a:h}
HSROOT_DIR=${SCRIPTS_DIR:h}

TRIGGER_JSON=$(
  jq -n \
    --arg cmd "$SCRIPTS_DIR/reload.sh" \
    --arg dir "$HSROOT_DIR/" \
    --arg name "reload-hammerspoon" \
    '[ "trigger", $dir, { 
      "name": $name,
      "expression": [ "anyof",
        [ "match", "**/*.lua", "wholename" ]
      ],
      "command": [ $cmd ],
      "append_files": true
    }]'
)

watchman -j <<<$TRIGGER_JSON
