---@diagnostic disable: undefined-global
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  -- PackerSync after save
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = [[require('plugins.comment').setup()]]
  }

  -- todo write my own luasnip functions
  use {
    'L3MON4D3/LuaSnip',
    requires = "rafamadriz/friendly-snippets", -- TODO remove when I have my own snippets
    config = [[require("plugins.snippets").setup()]]
  }

  -- telescope
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'vim-telescope/telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      config = [[require("plugins.telescope").setup()]],
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
    "benfowler/telescope-luasnip.nvim", -- TODO remove when I have my own snippets
    'aloussase/telescope-gradle.nvim',
    'crispgm/telescope-heading.nvim',
    'softinio/scaladex.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  }

  -- nvim-cmp autocompletion
  use {
    {
      'hrsh7th/nvim-cmp',
      config = [[require("plugins.cmp").setup()]],
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'octaltree/cmp-look',
    'hrsh7th/cmp-nvim-lua',
  }

  -- lsp
  use {
    {
      'neovim/nvim-lspconfig',
      config = [[require("plugins.lsp").setup()]],
      require = {
        'nvim-lua/plenary.nvim',
      }
    },
    'kevinhwang91/nvim-bqf', -- better quickfix
    'ray-x/lsp_signature.nvim',
  }

  -- dap
  use {
    'mfussenegger/nvim-dap',
    config = [[require("plugins.dap").setup()]],
  }

  -- scala metals
  use {
    {
      'scalameta/nvim-metals',
      config = [[require("plugins.metals").setup()]],
    },
    'derekwyatt/vim-scala',
  }

  use {
    'simrat39/rust-tools.nvim',
    config = [[require("plugins.rust").setup()]],
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require("plugins.treesister").setup()]],
  }

  -- git
  use {
    'rbong/vim-flog',
    requires = 'tpope/vim-fugitive',
  }

  -- Todo think away to make vim-fugitive lazy loading
  use 'rhysd/git-messenger.vim'
  use {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd [[nnoremap gdh :diffget //2<CR>]]
      vim.cmd [[nnoremap gdl :diffget //3<CR>]]
      vim.cmd [[nnoremap <leader>gd :Gvdiffsplit!<CR>]]
    end,
  }

  use 'ThePrimeagen/git-worktree.nvim'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require("plugins.indent").setup()]],
  }

  -- Writing focus mode
  use 'junegunn/goyo.vim'

  -- Destroy trailing whitespace
  use 'bronson/vim-trailing-whitespace'


  -- dictionary
  -- Add shortcut for vim motion
  use {
    'xfyuan/vim-mac-dictionary',
    requires = 'skywind3000/vim-quickui',
    config = function()
      vim.cmd [[nnoremap <leader>ww :MacDictPopup<CR>]]
      vim.cmd [[nnoremap <leader>wd :MacDictWord<CR>]]
      vim.cmd [[nnoremap <leader>wq :MacDictQuery<CR>]]
    end,
  }

  -- fades inactive buffers
  use {
    "TaDaa/vimade",
    config = function()
      vim.cmd [[nnoremap yot :VimadeToggle<CR>]]
    end,
  }

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'

  use {
    "windwp/nvim-autopairs",
    config = [[require('nvim-autopairs').setup({ })]],
  }

  use "kyazdani42/nvim-web-devicons"

  use {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd [[xmap ga <Plug>(EasyAlign)]]
      vim.cmd [[nmap ga <Plug>(EasyAlign)]]
    end,
  }

  -- Tmux
  use 'christoomey/vim-tmux-navigator'
  use {
    "AckslD/nvim-neoclip.lua",
    requires = 'nvim-telescope/telescope.nvim',
    config = [[require('neoclip').setup()]],
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' },
    config = [[require("plugins.tree").setup()]],
  }

  use 'mileszs/ack.vim'

  -- theme
  use {
    disable = false,
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  }

  use {
    disable = true,
    'joshdick/onedark.vim',
    config = function()
      vim.cmd('colorscheme onedark')
    end
  }

  use {
    disable = true,
    'ayu-theme/ayu-vim',
    config = function()
      vim.cmd('colorscheme ayu')
    end
  }

end)
