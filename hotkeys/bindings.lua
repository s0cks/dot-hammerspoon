local utils = require("utils")
local apps = require("apps")
local notifications = require("hotkeys.notifications")

local function toggle_aerospace()
	local aerospace_app = hs.application.find("Aerospace")
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
	notifications.hammerspoon_reloaded.show()
end

local hyper_key = {
	"cmd",
	"alt",
	"ctrl",
	"shift",
}

local pastebin = require("pastebin")

return {
	{
		hyper_key,
		{
			{
				"r",
				function()
					hs.alert.show("hyper")
				end,
			},
			{
				"h",
				function()
					utils.open_vim_session("~/.hammerspoon")
				end,
			},
			{
				"k",
				function()
					utils.open_vim_session("~/.config/kitty/")
				end,
			},
			{
				"a",
				function()
					toggle_aerospace()
				end,
			},
			{
				"p",
				function()
					pastebin:paste("Hello World")
				end,
			},
			{
				"n",
				function()
					utils.open_vim_session("~")
				end,
			},
		},
	},
}
