local M = {}

local f = require("functions")
local map = f.map

-- https://github.com/scalameta/nvim-metals/discussions/39
local lsp = require("lspconfig")

M.setup = function()
  local metals_config = require("metals").bare_config()

  metals_config.init_options.statusBarProvider = "on"
  metals_config.settings = {
    showImplicitArguments = true,
    showInferredType = true,
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

  require("metals").setup_dap()

  map("n", "<leader>mc", [[<cmd>lua require("telescope").extensions.metals.commands()<CR>]])

  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach({})
    end,
    group = nvim_metals_group,
  })

  -- Need for symbol highlights to work correctly
  vim.cmd([[hi! link LspReferenceText CursorColumn]])
  vim.cmd([[hi! link LspReferenceRead CursorColumn]])
  vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

end

return M
