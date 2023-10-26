local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- Useful lua functions used ny lots of plugins
  use "nvim-lua/plenary.nvim"

  -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/popup.nvim"

  -- Show functions signature in c++
	use "ray-x/lsp_signature.nvim"

  -- C++ better Syntax Highlighting
  use "https://github.com/tree-sitter/tree-sitter-cpp"

  -- Tmux nvim navigation
  use "christoomey/vim-tmux-navigator"

  -- VSCode like pictograms in nvim
  use "onsails/lspkind.nvim"

  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
  }
  --use "ahmedkhalf/project.nvim"

  -- Nvim Json Schema Store Support(needed for openapi 3 completion)
  use "b0o/SchemaStore.nvim"

  -- Nvim Cmp Plugins and related
  use 'hrsh7th/cmp-buffer'
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  -- Themes
  use "savq/melange-nvim"
	use "lunarvim/colorschemes"
  use "savq/melange"
  use "projekt0n/github-nvim-theme"
  use "rebelot/kanagawa.nvim"
  use "ellisonleao/gruvbox.nvim"

  -- Rust syntax highlighting and other things
  use "rust-lang/rust.vim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- Enable Lsp
	use "neovim/nvim-lspconfig"

  -- Simple to use language server installer
  use "williamboman/nvim-lsp-installer"
  use 'hrsh7th/cmp-nvim-lsp'

  -- Friendly Snippets
  use 'rafamadriz/friendly-snippets'

  -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-autopairs"

  -- Rust inlay Hints and etc
  use "simrat39/rust-tools.nvim"

  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- Colored Brackets in Nvim
  use "HiPhish/rainbow-delimiters.nvim"

  -- Plugin for Configuration and Coloring the text
  use "nvim-treesitter/playground"

  -- Plugins for Latex
  use "lervag/vimtex"

  -- Plugin for the line at the top for the tabs
  use "akinsho/bufferline.nvim"
  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }
  use 'kazhala/close-buffers.nvim'

  -- Tmux Bar Sharing
  use 'vimpostor/vim-tpipeline'

  use 'nvim-tree/nvim-web-devicons'
  -- Nvim Line at the bottom of the screen
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  --Prettier and dependency
  use('jose-elias-alvarez/null-ls.nvim')

  -- Prettier Linter for Js Code
  use('MunifTanjim/prettier.nvim')

  -- Telescope for File Operations and UI
  use { "nvim-telescope/telescope.nvim"}

  -- Lsp like vs-code pictograms to completions
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

  -- File Browser for telescope
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Auto Html Tags
  use('windwp/nvim-ts-autotag')

  -- Show Colors in Hex
  use('norcalli/nvim-colorizer.lua')

  -- Ui improved for Lsp Recommendations
  use('glepnir/lspsaga.nvim')

  -- Git for Nvim
  use("dinhhuy258/git.nvim")

  -- Git Sings for lateral bar
  use("lewis6991/gitsigns.nvim")

  -- Java
  use("mfussenegger/nvim-jdtls")

  -- Tabs and Spaces Standardizer
  use("tenxsoydev/tabs-vs-spaces.nvim")

  use {'srcery-colors/srcery-vim', as = 'srcery'}

  -- Omnisharp definition extension
  use {'Hoffs/omnisharp-extended-lsp.nvim'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

