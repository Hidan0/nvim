local colorscheme = "catppuccin"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
  vim.notify("Can not load " .. colorscheme .. " theme!")
  return
end
