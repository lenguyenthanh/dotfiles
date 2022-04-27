-- We first make sure we have packer before we do anything
if require("pre")() then
  return
end

require("plugins")
require("mappings").setup()
require("plugins.cmp").setup()
require("plugins.dap").setup()
require("plugins.indent").setup()
require("plugins.lsp").setup()
require("plugins.metals").setup()
require("plugins.rust").setup()
