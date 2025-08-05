local PASTEBIN_API_ENDPOINT_DEFAULT = 'https://pastebin.com/api/api_post.php'
local PASTEBIN_API_ENDPOINT = os.getenv('PASTEBIN_API_ENDPOINT') or PASTEBIN_API_ENDPOINT_DEFAULT

local PASTEBIN_API_DEVELOPER_KEY = os.getenv('PASTEBIN_DEVELOPER_KEY')
local PASTEBIN_API_USER_KEY = os.getenv('PASTEBIN_USER_KEY')

if not PASTEBIN_API_DEVELOPER_KEY then
  print('PASTEBIN_API_DEVELOPER_KEY environment variable not set. unable to create pastes!')
end

if not PASTEBIN_API_USER_KEY then
  print('PASTEBIN_API_USER_KEY environment variable not set. unable to create pastes!')
end

local notifications = require('pastebin.notifications')
local paste_expire = require('pastebin.expire')
local paste_access = require('pastebin.access')

local function on_paste_response(code, response)
  if code == 200 then
    hs.pasteboard.setContents(response)
    notifications.paste_success.show()
  else
    notifications.paste_success.show()
  end
end

local M = {}

---@param data string The data to paste to Pastebin
---@param expire? string The expiration time for the paste
---@param access? string The access for the paste
function M:paste(data, expire, access)
  return hs.http.asyncPost(
    PASTEBIN_API_ENDPOINT,
    'api_option=paste'
      .. '&api_dev_key='
      .. PASTEBIN_API_DEVELOPER_KEY
      .. '&api_user_key='
      .. PASTEBIN_API_USER_KEY
      .. '&api_paste_private='
      .. (access or paste_access.default)
      .. '&api_paste_expire_date='
      .. (expire or paste_expire.default)
      .. '&api_paste_code='
      .. hs.http.encodeForQuery(data),
    {},
    on_paste_response
  )
end

return M
