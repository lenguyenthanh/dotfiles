-- https://oroques.dev/notes/neovim-init
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- We use the default settings for ccls and pylsp: the option table can stay empty
lsp.ccls.setup {}
lsp.pylsp.setup {}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

--map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
--map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>lx', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- nvim-metals
vim.opt_global.shortmess:remove("F") -- nvim-metals

cmd [[augroup lsp]]
cmd [[au!]]
cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach({})]]
cmd [[augroup end]]
