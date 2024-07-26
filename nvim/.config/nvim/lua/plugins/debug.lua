return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require("nvim-dap-virtual-text").setup()

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'php',
      },
    }

    dap.adapters.php = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/bin/php-debug-adapter',
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug - Sail',
        port = '9003',
        log = true,
        pathmappings = {
          ['/var/www/html/'] = '${workspaceFolder}',
        },
      },
    }

    vim.fn.sign_define('DapBreakpoint', { text = '󰯯', texthl = 'ErrorMsg', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '󰯲', texthl = 'WarningMsg', linehl = '', numhl = '' })

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '',
          play = '󰐊',
          step_into = '',
          step_over = '',
          step_out = '󰆸',
          step_back = '',
          run_last = '󰐊󰐊',
          terminate = '',
        },
      },
    }

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

    -- Keymaps for Debugging
    vim.keymap.set('n', '<space>d?', function()
      dapui.eval(nil, { enter = true })
    end, { desc = 'Eval Under Cursor' })

    vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debugger: Start' })
    vim.keymap.set('n', '<F17>', function() dap.terminate() end, { desc = 'Debugger: Stop' })
    vim.keymap.set('n', '<F29>', function() dap.restart_frame() end, { desc = 'Debugger: Restart' })
    vim.keymap.set('n', '<F6>', function() dap.pause() end, { desc = 'Debugger: Pause' })
    vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Debugger: Step Over' })
    vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Debugger: Step Into' })
    vim.keymap.set('n', '<F23>', function() dap.step_out() end, { desc = 'Debugger: Step Out' })
    vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end,
      { desc = 'Debugger: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end,
      { desc = 'Toggle Breakpoint (F9)' })
    vim.keymap.set('n', '<leader>dB', function() dap.clear_breakpoints() end, { desc = 'Clear Breakpoints' })
    vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'Start/Continue (F5)' })
    vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = 'Step Into (F11)' })
    vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = 'Step Over (F10)' })
    vim.keymap.set('n', '<leader>dO', function() dap.step_out() end, { desc = 'Step Out (S-F11)' })
    vim.keymap.set('n', '<leader>dq', function() dap.close() end, { desc = 'Close Session' })
    vim.keymap.set('n', '<leader>dQ', function() dap.terminate() end, { desc = 'Terminate Session (S-F5)' })
    vim.keymap.set('n', '<leader>dp', function() dap.pause() end, { desc = 'Pause (F6)' })
    vim.keymap.set('n', '<leader>dr', function() dap.restart_frame() end, { desc = 'Restart (C-F5)' })
    vim.keymap.set('n', '<leader>dR', function() dap.repl.toggle() end, { desc = 'Toggle REPL' })
    vim.keymap.set('n', '<leader>du', function() dapui.toggle() end, { desc = 'Toggle Debugger UI' })
    vim.keymap.set('n', '<leader>dh', function() require('dap.ui.widgets').hover() end, { desc = 'Debugger Hover' })
  end
  -- d prefix ( Debug Stuff )
}
