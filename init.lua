require('hs.ipc')

local hsconfig_dir = '/Users/tazz/.config/hammerspoon'
local paths = {
  hsconfig_dir .. '/?.lua',
  hsconfig_dir .. '/lua/?.lua',
  hsconfig_dir .. '/lua/?/init.lua',
}
package.path = package.path .. ';' .. table.concat(paths, ';')
print('--- package.path: ' .. package.path)

require('hotkeys')
require('yabai')

hs.urlevent.bind('hello-world', function(event, params)
  hs.alert.show('Hello World')
end)

local app_watcher = require('app_watcher')
app_watcher:start()
