local M = {}

local utils = require('yabai.utils')

--- sets the ratio of the current window
---@param value number
---@param cb? YabaiTaskCallback
function M.set_ratio(value, cb)
  utils.yabai({ '-m', 'window', '--ratio', 'abs:' .. value }, cb)
end

---@alias YabaiDirection 'east'|'west'|'south'|'north'|'mouse'|'center'

--- Move a window in the specified direction
---@param dir YabaiDirection
---@param cb? YabaiTaskCallback
function M.swap(dir, cb)
  utils.yabai({ '-m', 'window', '--swap', dir }, cb)
end

---@alias WindowToggleMode 'float'

---@param mode WindowToggleMode
function M.toggle(mode, cb)
  utils.yabai({ '-m', 'window', '--toggle', mode }, cb)
end

return M
