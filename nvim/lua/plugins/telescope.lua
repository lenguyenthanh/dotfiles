local M = {}

local f = require("functions")
local map = f.map

M.setup = function()
  local telescope = require('telescope')

  telescope.load_extension('fzf')
  telescope.load_extension('scaladex')
  telescope.load_extension('metals')
  telescope.load_extension('gradle')
  telescope.load_extension('heading')
  telescope.load_extension('frecency')
  telescope.load_extension('luasnip')
  telescope.load_extension('neoclip')

  map('n', '<leader>fp', [[<cmd>lua require("telescope.builtin").find_files()<cr>]])
  map('n', '<leader>fy', [[<cmd>lua require("telescope.builtin").find_files( { cwd = vim.fn.expand("%:p:h") })<cr>]])
  map('n', '<leader>fb', [[<cmd>lua require("telescope.builtin").buffers()<cr>]])
  map('n', '<leader>fr', [[<cmd>lua require("telescope.builtin").live_grep()<cr>]])
  map('n', '<leader>fc', [[<cmd>lua require("telescope.builtin").commands()<cr>]])
  map('n', '<leader>fq', [[<cmd>lua require("telescope.builtin").quickfix()<cr>]])
  map('n', '<leader>fm', [[<cmd>lua require("telescope.builtin").keymaps()<cr>]])
  map('n', '<leader>fsp', [[<cmd>lua require("telescope.builtin").spell_suggest()<cr>]])

  map('n', '<leader>rl', [[<cmd>lua require("telescope.builtin").reloader()<cr>]])
  map('n', '<leader>fh', [[<cmd>lua require("telescope").extensions.heading.heading()<cr>]])
  -- map('n', '<leader>ff', [[<cmd>lua require("telescope").extensions.frecency.frecency()<cr>]])

  map('n', '<leader>sd', [[<cmd>lua require("functions").search_dotfiles()<CR>]])
  map('n', '<leader>sn', [[<cmd>lua require("functions").search_notes()<CR>]])

  map('n', '<leader>f"', [[<cmd>lua require("telescope").extensions.neoclip.neoclip()<cr>]])

  map('n', '<leader>gc', [[<cmd>lua require("telescope.builtin").git_commits()<cr>]])
  map('n', '<leader>gb', [[<cmd>lua require("telescope.builtin").git_bcommits()<cr>]])

  telescope.setup({
    pickers = {
      buffers = {
        sort_lastused = true
      }
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "groovy" },
    callback = function()
      map('n', '<leader>gr', [[<cmd>lua require("telescope").extensions.gradle.tasks()<cr>]])
    end,
  })

end

return M
