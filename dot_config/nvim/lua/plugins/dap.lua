return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },

  -- stylua: ignore
  keys = {
    { "<C-F8>", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition (C-F8)" },
    { "<F8>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F8)" },
    { "<F5>", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue (F5)" },
    { "<F9>", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor (F9)" },
    { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into (F11)" },
    { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over (F10)" },
    { "<C-F5>", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate (C-F5)" },
  },
  },
}
