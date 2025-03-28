local M = {}

local lsp = require("lspconfig")

local f = require("functions")
local map = f.map
local api = vim.api

M.on_attach = function(client, buffer)
  map('n', '[d', [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]])
  map('n', ']d', [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]])
  map('n', '<leader>la', [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
  map("n", "<leader>lc", [[<cmd>lua vim.lsp.codelens.run() <CR>]])
  map('n', '<leader>ld', [[<cmd>lua vim.lsp.buf.definition()<CR>]])
  map('n', '<leader>lD', [[<cmd>lua vim.lsp.buf.type_definition()<CR>]])
  map('n', '<leader>li', [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
  map('n', '<leader>lf', [[<cmd>lua vim.lsp.buf.format({ async = true })<CR>]])
  map('n', '<leader>lh', [[<cmd>lua vim.lsp.buf.hover()<CR>]])
  map('v', '<leader>lh', [[<cmd>lua vim.lsp.buf.hover()<CR>]])
  map('n', '<leader>lr', [[<cmd>lua vim.lsp.buf.rename()<CR>]])
  map('n', '<leader>lx', [[<cmd>lua vim.lsp.buf.references()<CR>]])
  map('n', '<leader>ls', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])

  map("n", "<leader>lds", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
  map("n", "<leader>lws", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])
  map("n", "<Leader>l", [[<cmd> lua require("lsp_lines").toggle()<CR>]]
  )
end

M.setup = function()

  lsp.lua_ls.setup {
    on_attach = M.on_attach,
  }

  lsp.hls.setup {
    on_attach = M.on_attach
  }

  lsp.smithy_ls.setup({
    on_attach = M.on_attach,
    cmd = { "cs", "launch", "com.disneystreaming.smithy:smithy-language-server:0.0.21", "--", "0" },
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lsp.util.default_config = vim.tbl_extend("force", lsp.util.default_config, {
    capabilities = capabilities,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

end

M.lsp_group = api.nvim_create_augroup("lsp", { clear = true })

return M
