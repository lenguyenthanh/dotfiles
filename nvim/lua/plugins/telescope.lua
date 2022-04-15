local M = {}

local f = require("functions")
local map = f.map

M.setup = function()
  local telescope = require('telescope')

  telescope.load_extension('fzf')
  telescope.load_extension('scaladex')
  telescope.load_extension('metals')
  telescope.load_extension('gradle')

  map('n', '<leader>si', '<cmd>lua require("telescope").extensions.scaladex.scaladex.search()<cr>')
  map('n', '<leader>fy', '<cmd>lua require("telescope.builtin").find_files( { cwd = vim.fn.expand("%:p:h") })<cr>')

  telescope.setup({
    pickers = {
      buffers = {
        sort_lastused = true
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
      }
    }
  })

end

return M
