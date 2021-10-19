local o = vim.o -- Gets or sets general settings.
local g = vim.g -- Gets or sets global variables.
local wo = vim.wo -- Gets or sets window-scoped options.
local bo = vim.bo -- Gets or sets buffer-scoped options.

-- Change the leader key
g.mapleader = ','

require("nvim-treesitter.configs").setup({
  playground = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { "scala" },
  },
})
