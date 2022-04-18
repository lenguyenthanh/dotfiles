local M = {}

M.setup = function()

  vim.opt.list = true
  --vim.opt.listchars:append("space:⋅")
  --vim.opt.listchars:append("eol:↴")

  require("indent_blankline").setup {
    filetype_exclude = {
      "vim",
      "markdown",
      "man",
      "gitmessengerpopup",
      "diagnosticpopup",
      "lspinfo",
      "packer",
      "checkhealth",
      "TelescopePrompt",
      "TelescopeResults",
    },
    buftype_exclude = { "terminal" },
    show_end_of_line = true,
    char_list = {'|', '¦', '┆', '┊'},
    space_char_blankline = '⋅',
    show_foldtext = false,
    strict_tabs = true,
    disable_with_nolist = true,
    max_indent_increase = 1,
  }
end

return M
