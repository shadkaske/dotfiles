local theme = require('telescope.themes').get_ivy()
local builtin = require('telescope.builtin')

return {
  'nvim-telescope/telescope.nvim',
  lazy = 'VeryLazy',
  cmd = { 'Telescope' },
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
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
          ['<C-c>'] = require("telescope.actions").close,
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
  },
  keys = {
    { '<C-g>',           function() builtin.live_grep(theme) end,                                       desc = 'Telescope Live Grep' },
    { '<leader>bf',      function() builtin.buffers(theme) end,                                         desc = 'Buffers' },
    { '<leader>cS',      function() builtin.lsp_dynamic_workspace_symbols(theme) end,                   desc = 'Workspace Symbols' },
    { '<leader>cd',      function() builtin.diagnostics(theme) end,                                     desc = 'Buffer Diagnostics' },
    { '<leader>cs',      function() builtin.lsp_document_symbols(theme) end,                            desc = 'Document Symbols' },
    { '<leader>cw',      function() builtin.diagnostics(theme) end,                                     desc = 'Diagnostics' },
    { '<leader>cu',      function() builtin.lsp_references(theme) end,                                  desc = 'References ( Usage )' },
    { '<leader>fa',      function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, desc = 'Find All Files' },
    { '<leader><Space>', function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, desc = 'Find All Files' },
    { '<leader>fb',      function() builtin.buffers(theme) end,                                         desc = 'Buffers' },
    { '<leader>fc',      function() builtin.registers(theme) end,                                       desc = 'Clipboard Registers' },
    { '<leader>fd',      function() builtin.diagnostics(theme) end,                                     desc = 'Diagnostics' },
    { '<leader>ff',      function() builtin.find_files(theme) end,                                      desc = 'Files' },
    { '<leader>fg',      function() builtin.live_grep(theme) end,                                       desc = 'Live Grep' },
    { '<leader>fh',      function() builtin.help_tags(theme) end,                                       desc = 'Help' },
    { '<leader>fk',      function() builtin.keymaps(theme) end,                                         desc = 'Keymaps' },
    { '<leader>fr',      function() builtin.oldfiles(theme) end,                                        desc = 'Recent Files' },
    { '<leader>fw',      function() builtin.grep_string(theme) end,                                     mode = 'v',                                desc = 'Current Word' },
    { '<leader>gC',      function() builtin.git_bcommits(theme) end,                                    desc = 'Checkout commit(for current file)' },
    { '<leader>gb',      function() builtin.git_branches(theme) end,                                    desc = 'Checkout Branch' },
    { '<leader>go',      function() builtin.git_status(theme) end,                                      desc = 'Open changed file' },
    {
      '<leader>fi',
      function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
          previewer = true,
        })
      end,
      desc = 'In Current Buffer',
    },
  },
}
