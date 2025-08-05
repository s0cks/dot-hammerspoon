require('hs.ipc')

local hsconfig_dir = os.getenv('HOME') .. '/.config/hammerspoon'
print('-- hammerspoon configuration dir: ' .. hsconfig_dir)
local paths = {
  hsconfig_dir .. '/?.lua',
  hsconfig_dir .. '/lua/?.lua',
  hsconfig_dir .. '/lua/?/init.lua',
}
package.path = package.path .. ';' .. table.concat(paths, ';')
print('-- package.path: ' .. package.path)

--- hotkeys
require('hotkeys')
require('url-events')

--- Configure & start the app watcher
local app_watcher = require('app_watcher')
app_watcher:start()
