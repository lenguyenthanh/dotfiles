local M = {}

M.setup = function()
  require 'nvim-tree'.setup {
    disable_netrw = false,
  }
end

return M
