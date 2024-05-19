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
-- go.pastetoggle = '<F2>'
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

vim.opt_local.spelllang = "en"

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
map("n", "\"P", "\"+P")

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

-- keep things where they're
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- say the word under the cursor
map("n", "<leader>ws", "\"ryiw:!say <C-r>r<CR><CR>")

-- Load all plugins with packer
require("plugins")

-- sane default for diagnostics
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

-- PLUGIN MAPPINGS -----------------------

-- nvim-tree
map("n", "<leader>to", ":NvimTreeToggle<CR>")
map("n", "<leader>tf", ":NvimTreeFindFile<CR>")

-- Ack
g["ackprg"] = "rg --vimgrep --no-heading"

map("n", "<leader>sw", "\"ryiw:Ack! <C-r>r<CR>")
map("n", "<leader>sW", "\"ryiW:Ack! <C-r>r<CR>")
map("n", "<leader>si", "T*\"ryt*:Ack! \'<C-r>r\'<CR>")
map("n", "<leader>s\"", "\"ryi\":Ack! <C-r>r<CR>")
map("n", "<leader>sp", ":Ack! \'<C-r>\"\'<CR>")
map("n", "<leader>ss", ":Ack! ")

-- Fterm
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

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

-- set smithy filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.smithy" },
  callback = function() vim.cmd("setfiletype smithy") end
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.smithy = {
  install_info = {
    url = "https://github.com/indoorvivants/tree-sitter-smithy",
    files = {"src/parser.c"},
    branch = "main",
    generate_requires_npm = true,
    requires_generate_from_grammar = true,
  },
  filetype = "smithy"
}


vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'open', opts.fargs[1] }
  end,
  { nargs = 1 }
)

