local M = {}

local f = require("functions")
local map = f.map

M.setup = function()
  require("flutter-tools").setup {
    lsp = {
      on_attach = require("plugins.lsp").on_attach,
      debugger = {
        enabled = true,
        register_configurations = function(_)
          require("dap").configurations.dart = {}
        end,
      },
    },
  }
end

return M
