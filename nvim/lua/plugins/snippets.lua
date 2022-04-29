local M = {}

M.setup = function()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return M
