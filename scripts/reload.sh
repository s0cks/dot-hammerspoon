#!/usr/bin/env zsh
HS_EXEC="$HOMEBREW_PREFIX/bin/hs"

# reload hammerspoon
echo "$@ changed, reloading Hammerspoon..."
$HS_EXEC -c "hs.reload()"

# notify
osascript -e 'display notification "Hammerspoon Reloaded!" with title "Hammerspoon"'
