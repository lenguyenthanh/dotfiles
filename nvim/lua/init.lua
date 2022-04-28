-- We first make sure we have packer before we do anything
if require("pre")() then
  return
end


local api = vim.api
local cmd = vim.cmd
local g = vim.g

-- Change the leader key
g.mapleader = ','

local f = require("functions")
local map = f.map
local set = vim.opt
local go = vim.opt_global

--================================
-- OPTIONS -----------------------
--================================

local indent = 2

-- nvim-metals needs this
go.shortmess:remove("F"):append("c")

go.termguicolors = true
go.background = "dark"
go.hidden = true
go.showtabline = 1
go.updatetime = 300
go.showmatch = true
go.wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".bloop" }
go.ignorecase = true
go.smartcase = true
go.completeopt = { "menu", "menuone", "noinsert", "noselect" }
go.scrolloff = 5
go.laststatus = 3
go.pastetoggle = '<F2>'
go.inccommand = 'split'
go.shiftround = true
go.incsearch = true
go.ignorecase = true
go.smartcase = true
go.backup = false
go.splitbelow = true
go.splitright = true

set.diffopt:append("vertical")
set.relativenumber = true
set.number = true
set.cursorline = true
set.fixendofline = false
set.swapfile = false

set.tabstop = indent
set.shiftwidth = indent
set.softtabstop = indent
set.expandtab = true
set.fileformat = "unix"
set.modeline = false

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
set.signcolumn = "yes"

-- MAPPINGS -----------------------
map("i", "jk", "<ESC>")

-- Re-map move around for wrapping line
map("n", "j", "gj")
map("n", "k", "gk")

-- switch : ;
map("n", ";", ":")
map("n", ":", ";")
map("t", ";", ":")
map("t", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- reverse search
-- map("n", ">", ",")

-- Setting for quick copy & paste
map("n", "\"y", "\"+y")
map("n", "\"yy", "\"+yy")
map("n", "\"p", "\"+p")
map("n", "\"pp", "\"+pp")

-- Easy exit from terminal mode
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
map("t", "<C-v><Esc>", "<Esc>")

-- quick vim help
map("n", "<leader>vh", "viw\"ry:help <C-r>r<CR>")

-- Increase, decrease width of a window by 30 pixels with option key
map("", "<M-l>", "30<C-w>>")
map("", "<M-h>", "30<C-w><")

-- format json
map("n", "<leader>js", ":%!jq '.'<CR>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Load all plugins with packer
require("plugins")

-- PLUGIN MAPPINGS -----------------------

-- nvim-tree
map("n", "<leader>tm", ":NvimTreeToggle<CR>")
map("n", "<leader>tf", ":NvimTreeFindFile<CR>")
-- UltiSnips
g['UltiSnipsJumpForwardTrigger'] = '<c-b>'
g['UltiSnipsJumpBackwardTrigger'] = '<c-z>'
g['UltiSnipsEditSplit'] = 'vertical'
g["UltiSnipsSnippetDirectories"] = { "~/.dotfiles/UltiSnips" }

-- Ack
g["ackprg"] = "rg --vimgrep --no-heading"
map("n", "<leader>A", "viw\"ry:Ack <C-r>r<CR>")

-- COMMANDS -----------------------

-- setup highlight on yank
local lua_highlight = api.nvim_create_augroup("lua_highlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = lua_highlight,
})


cmd([[hi! link StatusLineNC Comment]])
cmd([[hi! link StatusError DiagnosticError]])
cmd([[hi! link StatusWarn DiagnosticWarn]])
cmd([[hi! link WinSeparator Comment]])
