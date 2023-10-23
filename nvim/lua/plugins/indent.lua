local M = {}

M.setup = function()
  vim.opt.list = true
  --vim.opt.listchars:append("space:⋅")
  --vim.opt.listchars:append("eol:↴")

  require("ibl").overwrite {
    exclude = {
      filetypes = {
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
      buftypes = { "terminal" },
    },
    indent = {
      char = { '|', '¦', '┆', '┊' },
    },
    -- show_end_of_line = true,
    -- space_char_blankline = '⋅',
    -- show_foldtext = false,
    -- strict_tabs = true,
    -- disable_with_nolist = true,
    -- max_indent_increase = 1,
  }
end

return M
