local M = {}

local function exec_blueutil_cmd(args, parent_scope)
  local out, status, exit, rc = hs.execute('blueutil ' .. args, parent_scope or true)
  if rc ~= 0 then
    print('failed to toggle bluetooth: ' .. rc)
  end
end

function M.toggle()
  exec_blueutil_cmd('-p toggle')
end

return M
