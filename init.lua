require('hs.ipc')

package.path = package.path .. ';/Users/tazz/.hammerspoon/lua/?.lua;/Users/tazz/.hammerspoon/lua/?/init.lua'
require('hotkeys')
require('yabai')

hs.urlevent.bind('hello-world', function(event, params)
  hs.alert.show('Hello World')
end)

local app_watcher = require('app_watcher')
app_watcher:start()
