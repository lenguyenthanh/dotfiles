local lsp = require "lspconfig"

local servers = {
    "rust_analyzer"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {}
end
