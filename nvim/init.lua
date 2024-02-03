vim.cmd([[set nu]])
vim.g.mapleader= ' '
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins ={
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                    "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim",
      },
  }

}
local opts = {

}

require("lazy").setup("plugins")
--colorscheme
--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])
--telescope.nvim setup
--local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<C-p>', builtin.find_files, {})

--treesitter setup
--local config = require("nvim-treesitter.configs")
--config.setup({
  -- ensure_installed = {"cpp", "python", "lua", "java"},
   --highlight = {enable = true},
   --indent = {enable = true},
--})
--neotree setup
--vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')
