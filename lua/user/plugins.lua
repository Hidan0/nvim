-- Auto bootstrap
local fn = vim.fn

local installPath = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(installPath)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    installPath,
  })
  print("Installing packer...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- use a protected call to get the pkg
local status, packer = pcall(require, "packer")
if not status then
  vim.notify("Can not load packer")
  return
end

-- Use packer as a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  -- ==== Plugins ====
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("lewis6991/gitsigns.nvim") -- git
  use("norcalli/nvim-colorizer.lua")
  use("kyazdani42/nvim-web-devicons")
  use({ "akinsho/bufferline.nvim", tag = "*" })
  use("moll/vim-bbye")
  use("akinsho/toggleterm.nvim")
  use("andweeb/presence.nvim") -- discord presence
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim")
  use("nvim-lualine/lualine.nvim")
  use("simrat39/rust-tools.nvim")
  use("machakann/vim-sandwich")
  use("anuvyklack/pretty-fold.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use({
    "danymat/neogen",
  })

  -- ==== Themes ====
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  -- ==== Compilation ====
  use("hrsh7th/nvim-cmp") -- main plugin
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")

  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp")

  -- ==== Snippet ====
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- some snippets

  -- ==== LSP ====
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- server language installer
  use("jose-elias-alvarez/null-ls.nvim") -- linter and formatting

  -- ==== Telescope ====
  use("nvim-telescope/telescope.nvim")
  --  use "nvim-telescope/telescope-media-files.nvim"

  -- ==== Treesitter ====
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("p00f/nvim-ts-rainbow")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- ==== Nvim-tree ====
  use("kyazdani42/nvim-tree.lua")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
