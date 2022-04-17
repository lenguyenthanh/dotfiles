local f = require("functions")
local map = f.map

local M = {}

M.setup = function()
  map('n', '<leader>sd', [[<cmd>lua require("functions").search_dotfiles()<CR>]])
  map('n', '<leader>sn', [[<cmd>lua require("functions").search_notes()<CR>]])
end

return M
