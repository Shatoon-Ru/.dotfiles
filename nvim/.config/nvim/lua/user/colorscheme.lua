----------------------------------
-- В случае отсутствия темы 
-- закружает стандартную
-- и выводит уведомление 
-- в строке состояния
----------------------------------
local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
