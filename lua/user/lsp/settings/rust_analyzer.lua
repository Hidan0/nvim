return {
	settings = {
		["rust_analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			updates = { channel = "nightly" },
			cargo = { loadOutDirsFromCheck = true },
			procMacro = { enable = true },
			inlayHints = { parameterHints = false },
		},
	},
}
