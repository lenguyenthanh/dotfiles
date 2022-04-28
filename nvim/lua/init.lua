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
local opt = vim.opt
local global_opt = vim.opt_global
local wo = vim.wo -- Gets or sets window-scoped options.
local bo = vim.bo -- Gets or sets buffer-scoped options.

-- Load all plugins with packer
require("plugins")

-- setup highlight on yank
local lua_highlight = api.nvim_create_augroup("lua_highlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = lua_highlight,
})

-- Mappings for UltiSnips
g['UltiSnipsJumpForwardTrigger'] = '<c-b>'
g['UltiSnipsJumpBackwardTrigger'] = '<c-z>'
g['UltiSnipsEditSplit'] = 'vertical'
g["UltiSnipsSnippetDirectories"] = { "~/.dotfiles/UltiSnips" }

--================================
-- OPTIONS -----------------------
--================================
local indent = 2

-- nvim-metals needs this
global_opt.shortmess:remove("F"):append("c")

global_opt.termguicolors = true
global_opt.background = "dark"
global_opt.hidden = true
global_opt.showtabline = 1
global_opt.updatetime = 300
global_opt.showmatch = true
global_opt.wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".bloop" }
global_opt.ignorecase = true
global_opt.smartcase = true
global_opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
global_opt.scrolloff = 5
global_opt.laststatus = 3
global_opt.pastetoggle = '<F2>'
global_opt.inccommand = 'split'
global_opt.shiftround = true
global_opt.incsearch = true
global_opt.ignorecase = true
global_opt.smartcase = true
global_opt.backup = false
global_opt.splitbelow = true
global_opt.splitright = true
global_opt.diffopt = global_opt.diffopt + "vertical"

wo.relativenumber = true
wo.number = true
wo.cursorline = true

bo.fixendofline = false
