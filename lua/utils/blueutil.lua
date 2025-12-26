local M = {}

function M.exec(cmd, parent_scope)
  local command = {}
  table.insert(command, 'blueutil')
  for _, c in ipairs(cmd) do
    table.insert(command, c)
  end
  local out, status, exit, rc = hs.execute(table.concat(command, ' '), parent_scope or true)
  if rc ~= 0 then
    print('failed to toggle bluetooth: ' .. rc)
  end
end

function M.toggle()
  M.exec({ '-p', 'toggle' })
end

return M
