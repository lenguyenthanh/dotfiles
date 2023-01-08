local M = {}

M.setup = function()
  -- for merge conflict
  vim.cmd [[nnoremap <leader>gv :Gvdiffsplit!<CR>]]
  vim.cmd [[nnoremap gdh :diffget //2<CR>]]
  vim.cmd [[nnoremap gdl :diffget //3<CR>]]
  vim.cmd [[nnoremap gq :Git<CR>]]
  vim.cmd [[nnoremap <leader>gs :Git ss<CR>]]
  vim.cmd [[nnoremap <leader>gd :Git diff<CR>]]
  vim.cmd [[nnoremap <leader>gc :Git commit<CR>]]
  vim.cmd [[nnoremap <leader>gw :Gwrite<CR>]]
  vim.cmd [[nnoremap <leader>gp :Git push<CR>]]
  vim.cmd [[noremap <leader>gb :GBrowse<CR>]]
end

return M
