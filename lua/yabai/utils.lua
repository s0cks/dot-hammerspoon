local M = {}

---@alias YabaiTaskCallback function(code, out, err)
---@alias YabaiTaskArgs (string | number)[]

---@param args YabaiTaskArgs The arguments to pass to hs.task
---@param cb? YabaiTaskCallback
function M.yabai(args, cb)
  local on_finished = cb or function(code, out, err)
    if code ~= 0 then
      print('error: ' .. err)
    end
  end

  local on_stream = function(code, out, err)
    return true
  end

  local task = hs.task.new('/opt/homebrew/bin/yabai', on_finished, on_stream, args)
  task:start()
end

return M
