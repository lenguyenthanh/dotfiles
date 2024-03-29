local M = {}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local compare = require 'cmp.config.compare'

M.setup = function()
  cmp.setup({
    sources = {
      { name = "nvim_lsp", priority = 100 },
      { name = 'luasnip',  priority = 100 },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "buffer" },
      {
        name = 'look',
        keyword_length = 2,
        option = {
          convert_case = true,
          loud = true,
          dict = '/usr/share/dict/words',
        }
      },
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    -- https://github.com/scalameta/metals/issues/3559#issuecomment-1135073987
    sorting = {
      comparators = {
        compare.exact,
        compare.score,
        function(a, b)
          if a:get_kind() == 5 and b:get_kind() == 2 then
            return true
          elseif a:get_kind() == 2 and b:get_kind() == 5 then
            return false
          end
          return nil
        end,
        compare.kind,
        compare.recently_used,
        compare.locality,
        compare.offset,
        compare.sort_text,
        compare.length,
        compare.order
      }
    },
    mapping = cmp.mapping.preset.insert({
      -- None of this made sense to me when first looking into this since there
      -- is no vim docs, but you can't have select = true here _unless_ you are
      -- also using the snippet stuff. So keep in mind that if you remove
      -- snippets you need to remove this select
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-l>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
          ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
          ['<C-e>'] = cmp.mapping.abort(),
    }),
  })
end

return M
