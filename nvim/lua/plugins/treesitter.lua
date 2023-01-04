-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
local M = {}

local vim = vim
local opt = vim.opt

M.setup = function()

  local installed = { "lua", "rust", "kotlin", "markdown", "markdown_inline", "java", "haskell" }
  require("nvim-treesitter.configs").setup({
    playground = { enable = true },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    ensure_installed = installed,
    highlight = {
      enable = true,
      -- disable = { "scala", "markdown", "markdown_inline" },
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    },

    --incremental_selection = {
    --enable = true,
    --keymaps = {
    --init_selection = "gnn",
    --node_incremental = "grn",
    --scnpe_incremental = "grc",
    --node_decremental = "grm",
    --},
    --},

  })

  -- -- use treesister fold for installed languages only
  -- local treesister_fold = vim.api.nvim_create_augroup("treesister_fold", { clear = true })
  -- vim.api.nvim_create_autocmd("FileType", {
  --   pattern = table.insert(installed, 'scala'),
  --   callback = function()
  --     opt.foldmethod = "expr"
  --     opt.foldexpr = "nvim_treesitter#foldexpr()"
  --   end,
  --   group = treesister_fold,
  -- })

  -- -- hack to enable fold when enter a file
  -- -- waiting for Telescope to fix this
  -- vim.api.nvim_create_autocmd('BufRead', {
  --   callback = function()
  --     vim.api.nvim_create_autocmd('BufWinEnter', {
  --       once = true,
  --       command = 'normal! zx zR'
  --     })
  --   end
  -- })

end

return M
