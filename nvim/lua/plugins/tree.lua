local M = {}

M.setup = function()
  require 'nvim-tree'.setup {
    disable_netrw = true,
    filters = {
      custom = {
        ".git",
        "node_modules",
        "elm-stuff",
        "dist",
      },
    }
  }
end

return M
