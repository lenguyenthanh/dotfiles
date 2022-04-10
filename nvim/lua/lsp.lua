-- https://oroques.dev/notes/neovim-init
-- https://github.com/scalameta/nvim-metals/discussions/39
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local lsp = require 'lspconfig'
local telescope = require 'telescope'

telescope.load_extension('fzf')
telescope.load_extension('scaladex')
telescope.load_extension('metals')

map('n', '<leader>si', '<cmd>lua require("telescope").extensions.scaladex.scaladex.search()<cr>')

lsp.rust_analyzer.setup{}
lsp.elixirls.setup{
    cmd = { "/Users/thanhle/source/elixir/elixir-ls/release/language_server.sh" };
}

map('n', '<leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>lx', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map("n", "<leader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
map("n", "<leader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])

map("n", "<leader>lds", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
map("n", "<leader>lws", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])

-- nvim-metals
vim.opt_global.shortmess:remove("F") -- nvim-metals

-- COMMANDS ----------------------

cmd [[augroup lsp]]
cmd [[au!]]
cmd([[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd [[augroup end]]

-- Need for symbol highlights to work correctly
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

---- LSP Setup ---------------------

metals_config = require("metals").bare_config()

metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- Example if you are including snippets
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

metals_config.capabilities = capabilities

lsp.util.default_config = vim.tbl_extend("force", lsp.util.default_config, {
    handlers = {
      ["textDocument/publishDiagnostics"] = shared_diagnostic_settings,
    },
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
  })
