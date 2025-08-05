local M = {}

local function exec_aerospace_cmd(args, parent_scope)
  local out, status, exit, rc = hs.execute('aerospace ' .. args, parent_scope or true)
  if rc ~= 0 then
    print('failed to execute aerospace command with args `' .. args .. '`: ' .. rc)
  end
end

function M.toggle()
  exec_aerospace_cmd('enable toggle')
end

return M
