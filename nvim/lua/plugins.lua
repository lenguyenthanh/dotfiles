-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = [[require('plugins.comment').setup()]]
  }

  -- telescope
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
        'aloussase/telescope-gradle.nvim',
        'crispgm/telescope-heading.nvim',
        'sudormrfbin/cheatsheet.nvim',
        'softinio/scaladex.nvim',
      },
      config = [[require("plugins.telescope").setup()]],
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
      config = [[require("plugins.treesister").setup()]],
  }

end)
