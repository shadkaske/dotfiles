local theme = require('telescope.themes').get_ivy()
local theme_string = 'ivy'
local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
      prompt_prefix = ' 󰭎  ',
      selection_caret = '  ',
      -- sorting_strategy = 'descending',
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          width = 0.4,
          height = 0.35,
        },
      },
      file_ignore_patterns = { 'node_modules' },
      path_display = { 'truncate' },
      set_env = { ['COLORTERM'] = 'truecolor' },
      mappings = {
        n = {
          ['<M-p>'] = require('telescope.actions.layout').toggle_preview,
        },
        i = {
          ['<M-p>'] = require('telescope.actions.layout').toggle_preview,
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { 'rg', '--files', '--iglob', '!.git', '--iglob', '!node_modules', '--iglob', '!vendor', '--hidden' },
      },
      grep_string = {
        additional_args = { '--hidden' },
      },
      live_grep = {
        additional_args = { '--hidden' },
      },
      buffers = {
        mappings = {
          i = {
            ['<M-d>'] = require('telescope.actions').delete_buffer + require('telescope.actions').move_to_top,
          },
        },
      },
    },
})

-- Telescope Keymaps
vim.keymap.set('n', '<C-g>',function() builtin.live_grep(theme) end, { desc = 'Telescope Live Grep'  })
vim.keymap.set('n', '<leader>bf',function() builtin.buffers(theme) end, { desc = 'Buffers'  })
vim.keymap.set('n', '<leader>cS',function() builtin.lsp_dynamic_workspace_symbols(theme) end, { desc = 'Workspace Symbols'  })
vim.keymap.set('n', '<leader>cd',function() builtin.diagnostics(theme) end, { desc = 'Buffer Diagnostics'  })
vim.keymap.set('n', '<leader>cs',function() builtin.lsp_document_symbols(theme) end, { desc = 'Document Symbols'  })
vim.keymap.set('n', '<leader>cw',function() builtin.diagnostics(theme) end, { desc = 'Diagnostics'  })
vim.keymap.set('n', '<leader>cu',function() builtin.lsp_references(theme) end, { desc = 'References ( Usage )'  })
vim.keymap.set('n', '<leader>fa',function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, { desc = 'Find All Files'  })
vim.keymap.set('n', '<leader><Space>',function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, { desc = 'Find All Files'  })
vim.keymap.set('n', '<leader>fb',function() builtin.buffers(theme) end, { desc = 'Buffers'  })
vim.keymap.set('n', '<leader>fc',function() builtin.registers(theme) end, { desc = 'Clipboard Registers'  })
vim.keymap.set('n', '<leader>fd',function() builtin.diagnostics(theme) end, { desc = 'Diagnostics'  })
vim.keymap.set('n', '<leader>ff',function() builtin.find_files(theme) end, { desc = 'Files'  })
vim.keymap.set('n', '<leader>fg',function() builtin.live_grep(theme) end, { desc = 'Live Grep'  })
vim.keymap.set('n', '<leader>fh',function() builtin.help_tags(theme) end, { desc = 'Help'  })
vim.keymap.set('n', '<leader>fk',function() builtin.keymaps(theme) end, { desc = 'Keymaps'  })
vim.keymap.set('n', '<leader>fr',function() builtin.oldfiles(theme) end, { desc = 'Recent Files'  })
vim.keymap.set('v', '<leader>fw',function() builtin.grep_string(theme) end, { desc = 'Current Word'  })
vim.keymap.set('n', '<leader>gC',function() builtin.git_bcommits(theme) end, { desc = 'Checkout commit(for current file)'  })
vim.keymap.set('n', '<leader>gb',function() builtin.git_branches(theme) end, { desc = 'Checkout Branch'  })
vim.keymap.set('n', '<leader>go',function() builtin.git_status(theme) end, { desc = 'Open changed file'  })
vim.keymap.set('n', '<leader>fi', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy { previewer = true, }) end, { desc = 'In Current Buffer' })

