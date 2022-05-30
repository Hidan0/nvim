local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("Can not load Treesitter!")
  return
end

vim.cmd[[au BufRead,BufNewFile *.wgsl	set filetype=wgsl]]

configs.setup {
  -- ensure_installed = "",
  sync_installed = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },

  -- nvim-ts-rainbow
  rainbow = {
    enable = true,
    disable = { "" },
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
