local utils = require("utils")
return utils.register_notifications({
	paste_success = {
		tag = "paste-success",
		title = "Pastebin",
		subtitle = "󰆒 Paste Successful",
		on_click = function(notification)
			--- TODO: implement @s0cks
		end,
	},
	paste_failed = {
		tag = "paste-failed",
		title = "Pastebin",
		subtitle = " Paste Failed",
	},
})
