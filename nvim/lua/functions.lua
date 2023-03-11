local api = vim.api

local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< Dotfiles >",
    cwd = vim.env.DOTFILES,
    hidden = false,
  })
end

M.search_notes = function()
  require("telescope.builtin").find_files({
    prompt_title = "< Notes >",
    cwd = "~/git/personal/notes",
    hidden = false,
  })
end

return M
