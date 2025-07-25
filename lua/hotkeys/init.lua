local bindings = require('hotkeys.bindings')
for _, binding in ipairs(bindings) do
  local modifiers = binding[1]
  for _, mapping in ipairs(binding[2]) do
    local k = hs.keycodes.map[mapping[1]]
    local callback = mapping[2]
    hs.hotkey.bind(modifiers, k, callback)
  end
end
