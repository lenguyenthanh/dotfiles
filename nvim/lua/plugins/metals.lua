local M = {}

-- https://github.com/scalameta/nvim-metals/discussions/39
local lsp = require("lspconfig")

M.setup = function()
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
end

return M
