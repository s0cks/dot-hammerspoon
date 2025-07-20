local function toggle_ble()
	local out, status, exit, rc = hs.execute("blueutil -p toggle", true)
	if rc ~= 0 then
		print("failed to toggle bluetooth: " .. rc)
	end
end

local function app_watcher(name, event, app)
	if name == "RPCS3" then
		if event == hs.application.watcher.launched or event == hs.application.watcher.terminated then
			toggle_ble()
		end
	end
end

local watcher = hs.application.watcher.new(app_watcher)
watcher:start()
