local M = {}
M.public = '0'
M.unlisted = '1'
M.private = '2'
M.default = os.getenv('PASTEBIN_API_ACCESS') or M.private
return M
