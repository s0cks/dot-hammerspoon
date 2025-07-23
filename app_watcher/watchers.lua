local utils = require("utils")

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

---@type WatcherConfig
return {
	RPCS3 = {
		on_launched = utils.toggle_ble,
		on_terminated = utils.toggle_ble,
	},
}
