local utils = require('utils')

local notifications = utils.register_notifications({
  aerospace_launched = {
    tag = 'aerospace-launched',
    title = '🚀 AeroSpace',
    subtitle = 'Launched!',
    on_click = function(notification, button)
      print('hello world')
    end,
  },
  aerospace_landed = {
    tag = 'aerospace-landed',
    title = '🚀 AeroSpace',
    subtitle = 'Landed!',
  },
  hammerspoon_reloaded = {
    tag = 'hammerspoon-reloaded',
    title = '🔨 HammerSpoon',
    subtitle = 'Reloaded!',
    on_click = function(notification, button)
      hs.openConsole(true)
    end,
  },
})

return notifications
