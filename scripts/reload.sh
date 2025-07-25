#!/usr/bin/env sh
echo "$@ changed, reloading Hammerspoon..."
/opt/homebrew/bin/hs -c "hs.reload()"
osascript -e 'display notification "Hammerspoon Reloaded!" with title "Hammerspoon"'
