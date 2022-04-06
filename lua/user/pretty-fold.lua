local status, pretty_fold = pcall(require, "pretty-fold")
if not status then
	vim.notify("Can not load pretty-fold!")
	return
end

local status_ok, pretty_fold_preview = pcall(require, "pretty-fold.preview")
if not status_ok then
	vim.notify("Can not load pretty-fold.preview")
	return
end

pretty_fold.setup({
	fill_char = "━",
	sections = {
		left = {
			"━ ",
			function()
				return string.rep("*", vim.v.foldlevel)
			end,
			" ━┫",
			"content",
			"┣",
		},
		right = {
			"┫ ",
			"number_of_folded_lines",
			": ",
			"percentage",
			" ┣━━",
		},
	},

	remove_fold_markers = true,

	-- Keep the indentation of the content of the fold string.
	keep_indentation = true,

	-- Possible values:
	-- "delete" : Delete all comment signs from the fold string.
	-- "spaces" : Replace all comment signs with equal number of spaces.
	-- false    : Do nothing with comment signs.
	process_comment_signs = "spaces",

	-- Comment signs additional to the value of `&commentstring` option.
	comment_signs = {},

	-- List of patterns that will be removed from content foldtext section.
	stop_words = {
		"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
	},

	add_close_pattern = true, -- true, 'last_line' or false

	matchup_patterns = {
		{ "^%s*do$", "end" }, -- `do ... end` blocks
		{ "^%s*if", "end" }, -- if
		{ "^%s*for", "end" }, -- for
		{ "function%s*%(", "end" }, -- 'function(' or 'function ('
		{ "{", "}" },
		{ "%(", ")" }, -- % to escape lua pattern char
		{ "%[", "]" }, -- % to escape lua pattern char
	},
})

pretty_fold_preview.setup({
	key = "h",
	-- border = { " ", "", " ", " ", " ", " ", " ", " " },
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
})