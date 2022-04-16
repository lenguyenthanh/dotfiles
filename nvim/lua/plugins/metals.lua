local M = {}

local f = require("functions")
local map = f.map
local cmd = vim.cmd

-- https://github.com/scalameta/nvim-metals/discussions/39
local lsp = require("lspconfig")

M.setup = function()
  metals_config = require("metals").bare_config()

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

  -- nvim-dap
  -- I only use nvim-dap with Scala, so we keep it all in here
  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "runOrTestFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "RunWithArgs",
      metals = {
        runType = "runOrTestFile",
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, " +")
        end
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  map("n", "<leader>dc", [[<cmd>lua require("dap").continue()<CR>]])
  map("n", "<leader>dt", [[<cmd>lua require("dap").repl.toggle({}, 'vsplit')<CR>]])
  map("n", "<leader>dK", [[<cmd>lua require("dap.ui.widgets").hover()<CR>]])
  map("n", "<leader>db", [[<cmd>lua require("dap").toggle_breakpoint()<CR>]])
  map("n", "<leader>dso", [[<cmd>lua require("dap").step_over()<CR>]])
  map("n", "<leader>dsi", [[<cmd>lua require("dap").step_into()<CR>]])
  map("n", "<leader>dl", [[<cmd>lua require("dap").run_last()<CR>]])
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
