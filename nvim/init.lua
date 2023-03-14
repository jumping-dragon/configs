if vim.g.neovide then
  -- scale_factor
  vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 100.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 4.0
end

vim.wo.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
-- don't want case sensitive searches
vim.o.ignorecase = true
-- but still want search to be smart. If i type a upper case thing, do a case
-- sensitive blah
vim.o.smartcase = true

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- tokyonight-night theme
  use 'folke/tokyonight.nvim'
  vim.cmd[[colorscheme tokyonight-night]]


  -- nvim-tree
  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true
  -- empty setup using defaults
  require("nvim-tree").setup()
  vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
  map("n", "<C-b>", ":NvimTreeToggle<CR>")

  -- nvim-treesitter
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }
  require'nvim-treesitter.configs'.setup {
	  -- Modules and its options go here
	  highlight = { enable = true },
	  incremental_selection = { enable = true },
	  textobjects = { enable = true },
  }

  -- lualine
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  require('lualine').setup()

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
