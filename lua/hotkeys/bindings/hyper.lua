local utils = require('utils')
local pastebin = require('pastebin')
local apps = require('apps')

local function reload_hammerspoon()
  hs.reload()
end

return {
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
      utils.open_vim_session('~/.config/hammerspoon/')
    end,
  },
  {
    'k',
    function()
      utils.open_vim_session('~/.config/kitty/')
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
  {
    'y',
    function()
      utils.open_yazi_session('~/')
    end,
  },
  {
    'o',
    function()
      hs.application.open(apps.obsidian)
    end,
  },
}
