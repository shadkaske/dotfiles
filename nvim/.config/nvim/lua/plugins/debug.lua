return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "nvim-neotest/nvim-nio" },
      { "rcarriga/nvim-dap-ui" },
      { "theHamsta/nvim-dap-virtual-text" },
      { "williamboman/mason.nvim" },
      { "jay-babu/mason-nvim-dap.nvim" },
    },
    keys = {
      {
        "<space>d?",
        function()
          require("dapui").eval(nil, { enter = true })
        end,
        desc = "Eval Under Cursor",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Debugger: Start",
      },
      {
        "<F17>",
        function()
          require("dap").terminate()
        end,
        desc = "Debugger: Stop",
      },
      {
        "<F29>",
        function()
          require("dap").restart_frame()
        end,
        desc = "Debugger: Restart",
      },
      {
        "<F6>",
        function()
          require("dap").pause()
        end,
        desc = "Debugger: Pause",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debugger: Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Debugger: Step Into",
      },
      {
        "<F23>",
        function()
          require("dap").step_out()
        end,
        desc = "Debugger: Step Out",
      },
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debugger: Toggle Breakpoint",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint (F9)",
      },
      {
        "<leader>dB",
        function()
          require("dap").clear_breakpoints()
        end,
        desc = "Clear Breakpoints",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue (F5)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into (F11)",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over (F10)",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out (S-F11)",
      },
      {
        "<leader>dq",
        function()
          require("dap").close()
        end,
        desc = "Close Session",
      },
      {
        "<leader>dQ",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate Session (S-F5)",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause (F6)",
      },
      {
        "<leader>dr",
        function()
          require("dap").restart_frame()
        end,
        desc = "Restart (C-F5)",
      },
      {
        "<leader>dR",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle Debugger UI",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Debugger Hover",
      },
    },
    init = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("nvim-dap-virtual-text").setup({})

      require("mason-nvim-dap").setup({
        automatic_setup = true,
        handlers = {},
        ensure_installed = {
          "php",
        },
      })

      dap.adapters.php = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/php-debug-adapter",
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug - Sail",
          port = "9003",
          log = true,
          pathmappings = {
            ["/var/www/html/"] = "${workspaceFolder}",
          },
        },
      }

      vim.fn.sign_define("DapBreakpoint", { text = "󰯯", texthl = "ErrorMsg", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "󰯲", texthl = "WarningMsg", linehl = "", numhl = "" })

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "",
            play = "󰐊",
            step_into = "",
            step_over = "",
            step_out = "󰆸",
            step_back = "",
            run_last = "󰐊󰐊",
            terminate = "",
          },
        },
      })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    -- d prefix ( Debug Stuff )
  },
}
