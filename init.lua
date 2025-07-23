require('hotkeys')

hs.urlevent.bind('hello-world', function(event, params)
  hs.alert.show('Hello World')
end)

local app_watcher = require('app_watcher')
app_watcher:start()
