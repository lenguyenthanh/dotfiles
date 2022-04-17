local M = {}

M.setup = function()

  vim.opt.list = true
  vim.opt.listchars:append("space:⋅")
  vim.opt.listchars:append("eol:↴")

  vim.g.indent_blankline_char = '┊'
  vim.g.indent_blankline_filetype_exclude = { 'help' }
  vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
  vim.g.indent_blankline_show_trailing_blankline_indent = false

  require("indent_blankline").setup {
      show_end_of_line = true,
      space_char_blankline = " ",
  }
end

return M
