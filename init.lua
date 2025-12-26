require('hs.ipc')

local function get_hammerspoon_home()
  local dir = os.getenv('HAMMERSPOON_HOME')
  if not dir then
    dir = os.getenv('HOME') .. '/.config/hammerspoon'
  end
  return dir
end

local function add_to_rtp(dir)
  local paths = {
    dir .. '/?.lua',
    dir .. '/lua/?.lua',
    dir .. '/lua/?/init.lua',
  }
  package.path = package.path .. ';' .. table.concat(paths, ';')
end

local hs_home = get_hammerspoon_home()
print('-- hammerspoon home: ' .. hs_home)
add_to_rtp(hs_home)
print('-- runtime path: ' .. package.path)

--- hotkeys
require('url-events')

--- Configure & start the app watcher
local app_watcher = require('app_watcher')
app_watcher:start()
