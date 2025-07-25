local utils = require('utils')
local apps = require('apps')
local notifications = require('hotkeys.notifications')

local function toggle_aerospace()
  local aerospace_app = hs.application.find('Aerospace')
  if aerospace_app then
    aerospace_app:kill()
    notifications.aerospace_landed.show()
  else
    hs.application.open(apps.aerospace)
    notifications.aerospace_launched.show()
  end
  hs.spaces.openMissionControl()
end

local function reload_hammerspoon()
  hs.reload()
  hs.alert('Hammerspoon Reloaded!')
end

local cmd_shift = {
  'cmd',
  'shift',
}

local hyper_key = {
  'cmd',
  'alt',
  'ctrl',
  'shift',
}

local pastebin = require('pastebin')
local yabai = require('yabai')

return {
  {
    cmd_shift,
    {
      {
        'l',
        function()
          yabai.window.swap('east')
        end,
      },
      {
        'h',
        function()
          yabai.window.swap('west')
        end,
      },
      {
        'j',
        function()
          yabai.window.swap('south')
        end,
      },
      {
        'k',
        function()
          yabai.window.swap('north')
        end,
      },
      {
        'g',
        function()
          yabai.space.toggle('gap')
          yabai.space.toggle('padding')
        end,
      },
      {
        'f',
        function()
          yabai.window.toggle('float')
        end,
      },
    },
  },
  {
    hyper_key,
    {
      {
        'r',
        function()
          reload_hammerspoon()
        end,
      },
      {
        'b',
        function()
          hs.application.open(apps.boop)
        end,
      },
      {
        'h',
        function()
          utils.open_vim_session('~/.hammerspoon')
        end,
      },
      {
        'k',
        function()
          utils.open_vim_session('~/.config/kitty/')
        end,
      },
      {
        'a',
        function()
          toggle_aerospace()
        end,
      },
      {
        'p',
        function()
          pastebin:paste('Hello World')
        end,
      },
      {
        'n',
        function()
          utils.open_vim_session('~')
        end,
      },
    },
  },
}
