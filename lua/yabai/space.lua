local M = {}

local utils = require('yabai.utils')

--- focuses a specific space
---@param target 'recent'|'prev'|'next'|number
function M.focus(target)
  utils.yabai({ '-m', 'space', '--focus', target })
end

--- create a new space
function M.create()
  utils.yabai({ '-m', 'space', '--create' })
end

--- assign a label to a space
function M.label(space, name)
  utils.yabai({ '-m', 'space', space, '--label', name })
end

--- balances the window tree of the current space
function M.balance()
  utils.yabai({ '-m', 'space', '--balance' })
end

--- flip the window tree of the current space
---@param axis 'x-axis'|'y-axis'
function M.mirror(axis)
  utils.yabai({ '-m', 'space', '--mirror', axis })
end

--- rotates the window tree of the current space
---@param degrees 90|180|270|'90'|'180'|'270'
function M.rotate(degrees)
  utils.yabai({ '-m', 'space', '--rotate', degrees })
end

--- set the layout of the current space
---@param layout 'bsp'|'float'
function M.layout(layout)
  utils.yabai({ '-m', 'space', '--layout', layout })
end

--- toggles the specified attribute for the curent space
---@param attr 'gap'|'padding'
function M.toggle(attr)
  utils.yabai({ '-m', 'space', '--toggle', attr })
end

--- set the gap for the current space
---@param value number
function M.set_gap(value)
  utils.yabai({ '-m', 'space', '--gap', 'abs:' .. value })
end

--- inc the gap for the current space by value
--- @param value number
function M.inc_gap(value)
  utils.yabai({ '-m', 'space', '--gap', 'rel:' .. value })
end

--- dec the gap for the current space by value
--- @param value number
function M.dec_gap(value)
  utils.yabai({ '-m', 'space', '--gap', 'rel:-' .. value })
end

return M
