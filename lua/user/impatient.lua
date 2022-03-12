local status, impatient = pcall(require, "impatient")
if not status then
  vim.status("Can not load impatient!")
  return
end

impatient.enable_profile()
