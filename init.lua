require('hs.ipc')

local hsconfig_dir = '/Users/tazz/.config/hammerspoon'

package.path = package.path .. ';' .. hsconfig_dir .. '/?.lua'
package.path = package.path .. ';' .. hsconfig_dir .. '/lua/?.lua'
package.path = package.path .. ';' .. hsconfig_dir .. '/lua/?/init.lua'

require('hotkeys')
require('yabai')

hs.urlevent.bind('hello-world', function(event, params)
  hs.alert.show('Hello World')
end)

local app_watcher = require('app_watcher')
app_watcher:start()
