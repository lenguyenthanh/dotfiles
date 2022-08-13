local M = {}

local api = vim.api
local f = require("functions")
local map = f.map

M.setup = function()
  local metals_config = require("metals").bare_config()

  metals_config.init_options.statusBarProvider = "on"
  metals_config.settings = {
    showImplicitArguments = true,
    showInferredType = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  metals_config.capabilities = capabilities

  local lsp_group = api.nvim_create_augroup("lsp_metals", { clear = true })

  metals_config.on_attach = function(client, bufnr)

    require("plugins.lsp").on_attach(client, bufnr)

    map("n", "<leader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
    map("n", "<leader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])
    map("n", "<leader>mc", [[<cmd>lua require("telescope").extensions.metals.commands()<CR>]])
    map('n', '<leader>si', [[<cmd>lua require("telescope").extensions.scaladex.scaladex.search()<cr>]])

    api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = lsp_group,
    })
    api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = lsp_group,
    })
    api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      callback = vim.lsp.codelens.refresh,
      buffer = bufnr,
      group = lsp_group,
    })
    api.nvim_create_autocmd("FileType", {
      pattern = { "dap-repl" },
      callback = function()
        require("dap.ext.autocompl").attach()
      end,
      group = lsp_group,
    })

    require("metals").setup_dap()

  end

  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java", "sc" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })

  -- Need for symbol highlights to work correctly
  vim.cmd([[hi! link LspReferenceText CursorColumn]])
  vim.cmd([[hi! link LspReferenceRead CursorColumn]])
  vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

end

return M
