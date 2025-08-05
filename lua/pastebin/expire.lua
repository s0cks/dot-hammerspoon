local M = {}

M.never = 'N'
M.ten_minutes = '10M'
M.one_hour = '1H'
M.one_day = '1D'
M.one_week = '1W'
M.two_weeks = '2W'
M.one_month = '1M'
M.default = os.getenv('PASTEBIN_API_EXPIRE') or M.one_day

return M
