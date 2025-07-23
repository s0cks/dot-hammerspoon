local M = {}

local function find_main_desktop_space()
	local screen = hs.screen.mainScreen():getUUID()
	local spaces = hs.spaces.missionControlSpaceNames()[screen]
	for k, v in pairs(spaces) do
		if v == "Desktop" then
			return k
		end
	end
end

local desktop_space = find_main_desktop_space()
print("desktop space: " .. hs.inspect(desktop_space))

function M.move_window_to_main_desktop(window)
	hs.spaces.moveWindowToSpace(window, desktop_space)
end

function M.open_vim_session(dir)
	hs.execute("kt-vim-session " .. dir, true)
end

function M.get_app_id_from_bundle_path(path)
	local info = hs.application.infoForBundlePath(path)
	return info and info["CFBundleIdentifier"] or nil
end

function M.toggle_ble()
	local out, status, exit, rc = hs.execute("blueutil -p toggle", true)
	if rc ~= 0 then
		print("failed to toggle bluetooth: " .. rc)
	end
end

---@alias NotificationClickedCallback function(notification, button)

---@class NotificationSpec
---@field tag string
---@field title string
---@field subtitle string
---@field description? string
---@field on_click? NotificationClickedCallback
---@field id? number
---@field show? function

---@alias NotificationSpecSet { [string]: NotificationSpec }

---@param notifications NotificationSpecSet
---@return NotificationSpecSet notifications Returns the notifications specified by the notifications parameter
function M.register_notifications(notifications)
	for id, notification in pairs(notifications) do
		notification.id = hs.notify.register(id, notification.on_click)
		notification.show = function()
			hs.notify.show(notification.title, notification.subtitle, notification.description or "", function()
				return notification.tag or id
			end)
		end
	end
	return notifications
end

return M
