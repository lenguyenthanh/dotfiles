local M = {}

M.setup = function()
  local cmp = require("cmp")
  cmp.setup({
    sources = {
      { name = "nvim_lsp", priority = 10 },
      { name = "buffer" },
      { name = "path" },
      { name = "ultisnips" },
      { name = "nvim_lua" },
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
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      -- None of this made sense to me when first looking into this since there
      -- is no vim docs, but you can't have select = true here _unless_ you are
      -- also using the snippet stuff. So keep in mind that if you remove
      -- snippets you need to remove this select
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      ['<C-e>'] = cmp.mapping.close(),
    }),
  })
end

return M
