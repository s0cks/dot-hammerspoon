local watchers = require("app_watcher.watchers")

local function on_event(name, event, app)
	if watchers[name] then
		local w = watchers[name]
		if w.on_event then
			w.on_event(event)
		end

		if event == hs.application.watcher.activated and w.on_activated then
			w.on_activated(app)
		elseif event == hs.application.watcher.deactivated and w.on_deactivated then
			w.on_deactivated(app)
		elseif event == hs.application.watcher.hidden and w.on_hidden then
			w.on_hidden(app)
		elseif event == hs.application.watcher.launched and w.on_launched then
			w.on_launched(app)
		elseif event == hs.application.watcher.launching and w.on_launching then
			w.on_launching(app)
		elseif event == hs.application.watcher.terminated and w.on_terminated then
			w.on_terminated(app)
		elseif event == hs.application.watcher.unhidden and w.on_unhidden then
			w.on_unhidden(app)
		end
	end
end

return hs.application.watcher.new(on_event)
