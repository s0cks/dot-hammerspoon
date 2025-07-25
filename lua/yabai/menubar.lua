local bar = hs.menubar.new(true, 'hs-yabai')
if not bar then
  hs.alert("Couldn't create Yabai menubar")
  return nil
end
bar:setTooltip('Yabai')
bar:setIcon('/Users/tazz/.hammerspoon/resources/yabai/icon.png')

local enable = {
  title = 'Enable Yabai',
  fn = function()
    hs.alert('Enabled')
  end,
}

local disable = {
  title = 'Disable Yabai',
  fn = function()
    hs.alert('Disabled')
  end,
}

local function is_yabai_enabled()
  local out, status, type, rc = hs.execute('pgrep -fl /opt/homebrew/bin/yabai >/dev/null')
  print('out: ' .. out)
  print('type: ' .. type)
  print('rc: ' .. rc)
  return rc == 0
end

bar:setMenu({
  is_yabai_enabled() and disable or enable,
})
return bar
