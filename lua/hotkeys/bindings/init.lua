local CMD_SHIFT = {
  'cmd',
  'shift',
}
local HYPER = {
  'cmd',
  'alt',
  'ctrl',
  'shift',
}

return {
  {
    CMD_SHIFT,
    require('hotkeys.bindings.cmd_shift'),
  },
  {
    HYPER,
    require('hotkeys.bindings.hyper'),
  },
}
