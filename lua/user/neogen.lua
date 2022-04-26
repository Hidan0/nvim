local status, neogen = pcall(require, "neogen")
if not status then
	vim.notify("Can not load neogen!")
	return
end

neogen.setup({
	enabled = true, --if you want to disable Neogen
	input_after_comment = true,
})
