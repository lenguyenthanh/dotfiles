local M = {}

local vim = vim
local opt = vim.opt

M.setup = function()

  require("nvim-treesitter.configs").setup({
    playground = { enable = true },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    ensure_installed = { "scala", "lua", "rust", "kotlin", "markdown" },
    highlight = {
      enable = true,
      disable = { "scala" },
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

  --opt.foldmethod = "expr"
  --opt.foldexpr = "nvim_treesitter#foldexpr()"

end

return M
