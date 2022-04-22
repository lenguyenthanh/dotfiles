-- https://oroques.dev/notes/neovim-init
local M = {}

local f = require("functions")
local map = f.map
local lsp = require("lspconfig")

M.on_attach = function(client, buffer)
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>lx', '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

  map("n", "<leader>lds", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
  map("n", "<leader>lws", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])
  map('n', '<leader>la', [[<cmd>lua require("telescope.builtin").lsp_code_action()<CR>]])

end

M.setup = function()

  lsp.elixirls.setup {
    cmd = { "/Users/thanhle/source/elixir/elixir-ls/release/language_server.sh" };
    on_attach = M.on_attach
  }

  --lsp.kotlin_language_server.setup{
  --cmd = { "/Users/thanhle/source/kotlin/kotlin-language-server/server/build/install/server/bin/kotlin-language-server" }
  --}

  lsp.sumneko_lua.setup {
    on_attach = M.on_attach,
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  lsp.util.default_config = vim.tbl_extend("force", lsp.util.default_config, {
    handlers = {
      ["textDocument/publishDiagnostics"] = shared_diagnostic_settings,
    },
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
  })

end

return M