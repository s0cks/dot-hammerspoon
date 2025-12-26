---@alias OnAppEvent function(event)
---@class AppEventHandler
---@field on_event? OnAppEvent
---@field on_launched? function()
---@field on_terminated? function()
---@field on_activated? function()
---@field on_deactivated? function()
---@field on_hidden? function()
---@field on_launching? function()
---@field on_unhidden? function()
---@alias WatcherConfig { [string]: AppEventHandler }

local blueutil = require('utils.blueutil')
---@type WatcherConfig
local watchers = {
  RPCS3 = {
    on_launched = blueutil.toggle(),
    on_terminated = blueutil.toggle(),
  },
  ['Google Chrome'] = {
    on_activated = function()
      print('--- chrome activated')
    end,
    on_deactivated = function()
      print('--- chrome deactivated')
    end,
  },
}

local app_events = {
  'activated',
  'deactivated',
  'hidden',
  'launched',
  'launching',
  'terminated',
  'unhidden',
}

local function on_event(name, event, app)
  if not watchers[name] then
    return
  end

  local w = watchers[name]
  if w.on_event then
    w.on_event(event)
  end

  for _, event_name in ipairs(app_events) do
    if event == hs.application.watcher[event_name] and w['on_' .. event_name] then
      w['on_' .. event_name](app)
    end
  end
end

return hs.application.watcher.new(on_event)
