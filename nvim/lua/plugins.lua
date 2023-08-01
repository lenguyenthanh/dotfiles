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

  use "folke/neodev.nvim"

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
    'crispgm/telescope-heading.nvim',
    'softinio/scaladex.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-symbols.nvim',
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

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = [[require("lsp_lines").setup()]],
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
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = [[require("plugins.flutter").setup()]],
    ft = "dart",
    event = "BufRead pubspec.yaml",
    module = "flutter-tools",
  }

  use 'github/copilot.vim'

  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require("plugins.treesitter").setup()]],
    },
    'nvim-treesitter/playground'
  }

  --  Move mapping out
  use 'rhysd/git-messenger.vim'
  -- GitHub extension for fugitive.vim
  use 'tpope/vim-rhubarb'
  use {
    'tpope/vim-fugitive',
    config = [[require("plugins.git").setup()]],
  }
  use "sindrets/diffview.nvim"

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require("plugins.indent").setup()]],
  }

  -- Writing focus mode
  use 'junegunn/goyo.vim'

  -- Destroy trailing whitespace
  use 'bronson/vim-trailing-whitespace'

  use { "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    config = function()
      vim.cmd [[nnoremap <leader>vm :MarkdownPreview<CR>]]
    end,
  }

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

  -- -- fades inactive buffers
  -- use {
  --   "TaDaa/vimade",
  --   config = function()
  --     vim.cmd [[nnoremap yot :VimadeToggle<CR>]]
  --   end,
  -- }

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

  use 'numToStr/FTerm.nvim'

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
