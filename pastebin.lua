local PASTEBIN_API_EXPIRE_NEVER = "N"
local PASTEBIN_API_EXPIRE_10MINUTES = "10M"
local PASTEBIN_API_EXPIRE_1HOUR = "1H"
local PASTEBIN_API_EXPIRE_1DAY = "1D"
local PASTEBIN_API_EXPIRE_1WEEK = "1W"
local PASTEBIN_API_EXPIRE_2WEEKS = "2W"
local PASTEBIN_API_EXPIRE_1MONTH = "1M"
local PASTEBIN_API_EXPIRE_DEFAULT = os.getenv("PASTEBIN_API_EXPIRE") or PASTEBIN_API_EXPIRE_1DAY

local PASTEBIN_API_ACCESS_PUBLIC = "0"
local PASTEBIN_API_ACCESS_UNLISTED = "1"
local PASTEBIN_API_ACCESS_PRIVATE = "2"
local PASTEBIN_API_ACCESS_DEFAULT = os.getenv("PASTEBIN_API_ACCESS") or PASTEBIN_API_ACCESS_PRIVATE

local PASTEBIN_API_ENDPOINT_DEFAULT = "https://pastebin.com/api/api_post.php"
local PASTEBIN_API_ENDPOINT = os.getenv("PASTEBIN_API_ENDPOINT") or PASTEBIN_API_ENDPOINT_DEFAULT

local PASTEBIN_API_DEVELOPER_KEY = os.getenv("PASTEBIN_DEVELOPER_KEY")
local PASTEBIN_API_USER_KEY = os.getenv("PASTEBIN_USER_KEY")

if not PASTEBIN_API_DEVELOPER_KEY then
	hs.alert("PASTEBIN_DEVELOPER_KEY environment variable not set")
end

if not PASTEBIN_API_USER_KEY then
	hs.alert("PASTEBIN_USER_KEY environment variable not set")
end

local utils = require("utils")

local notifications = utils.register_notifications({
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

local M = {}

---@param data string The data to paste to Pastebin
---@param expire? string The expiration time for the paste
---@param access? string The access for the paste
function M:paste(data, expire, access)
	local function on_response(code, response)
		if code == 200 then
			hs.pasteboard.setContents(response)
			notifications.paste_success.show()
		else
			notifications.paste_success.show()
		end
	end

	return hs.http.asyncPost(
		PASTEBIN_API_ENDPOINT,
		"api_option=paste"
			.. "&api_dev_key="
			.. PASTEBIN_API_DEVELOPER_KEY
			.. "&api_user_key="
			.. PASTEBIN_API_USER_KEY
			.. "&api_paste_private="
			.. (access or PASTEBIN_API_ACCESS_DEFAULT)
			.. "&api_paste_expire_date="
			.. (expire or PASTEBIN_API_EXPIRE_DEFAULT)
			.. "&api_paste_code="
			.. hs.http.encodeForQuery(data),
		{},
		on_response
	)
end

return M
