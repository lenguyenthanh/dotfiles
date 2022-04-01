local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'neovim/nvim-lspconfig'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'nvim-lua/plenary.nvim'}
paq {'scalameta/nvim-metals'}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
