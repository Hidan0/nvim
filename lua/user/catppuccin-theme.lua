local status, catppuccin = pcall(require, "catppuccin")
if not status then
	vim.notify("Can not laod catppuccin.lua")
	return
end

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "bold",
		strings = "NONE",
		variables = "italic",
		conditionals = "italic",
		loops = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = false,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
		},
		which_key = false,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		-- bufferline = true,
		bufferline = {
			enabled = true,
			transparent_panel = false,
		},
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		hop = false,
		notify = false,
		telekasten = false,
		symbols_outline = false,
	},
})

local vimStatus, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not vimStatus then
	vim.notify("Nvim can not load catppuccin theme!")
	return
end
