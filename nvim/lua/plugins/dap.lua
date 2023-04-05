local M = {}

local f = require("functions")
local map = f.map

M.setup = function()
  local dap = require("dap")

  dap.listeners.after["event_terminated"]["nvim-metals"] = function(session, body)
    vim.notify("Tests have finished!")
    dap.repl.open({}, 'vsplit')
  end

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "runOrTestFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "RunWithArgs",
      metals = {
        runType = "runOrTestFile",
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, " +")
        end
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  local nvim_dap_group = vim.api.nvim_create_augroup("nvim-dap", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "sc", "yml", "dart" },
    callback = function()
      map("n", "<leader>dc", [[<cmd>lua require("dap").continue()<CR>]])
      map("n", "<leader>dl", [[<cmd>lua require("dap").run_last()<CR>]])
      map("n", "<leader>dt", [[<cmd>lua require("dap").repl.toggle({}, 'vsplit')<CR>]])
      map("n", "<leader>dK", [[<cmd>lua require("dap.ui.widgets").hover()<CR>]])
      map("n", "<leader>db", [[<cmd>lua require("dap").toggle_breakpoint()<CR>]])
      map("n", "<leader>dso", [[<cmd>lua require("dap").step_over()<CR>]])
      map("n", "<leader>dsi", [[<cmd>lua require("dap").step_into()<CR>]])
    end,
    group = nvim_dap_group,
  })
end

return M
