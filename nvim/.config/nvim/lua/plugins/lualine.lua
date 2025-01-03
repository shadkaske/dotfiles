return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = function()
    local icons = require 'util.icons'

    local function fg(name)
      return function()
        local hl = vim.api.nvim_get_hl(0, { name = name })
        return hl and hl.foreground and { fg = string.format('#%06x', hl.foreground) }
      end
    end

    return {
      sections = {
        lualine_a = { {
          'mode',
          fmt = function(res)
            return res:sub(1, 1)
          end,
        } },
        lualine_b = {
          {
            'branch',
            icon = icons.GitBranch,
          },
        },
        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = icons.DiagnosticError,
              warn = icons.DiagnosticWarn,
              info = icons.DiagnosticInfo,
              hint = icons.DiagnosticHint,
            },
          },
          {
            'filetype',
            icon_only = true,
            separator = '',
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            'filename',
            path = 1,
            symbols = {
              modified = '  ',
              readonly = '',
              unnamed = '',
            },
          },
        },
        lualine_x = {
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              end
              return 'recording to @' .. reg
            end,
            color = fg 'Character',
          },
          {
            require('util.lualine.components').lsp_active,
            color = fg 'Statement',
            cond = require('util.lualine.condition').hide_in_width,
          },
          {
            'diff',
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          {
            'location',
            padding = { left = 1, right = 1 },
            cond = require('util.lualine.condition').buffer_empty,
          },
        },
        lualine_z = {
          {
            require('util.lualine.components').progess_icon,
            separator = ' ',
            padding = { left = 1, right = 1 },
            cond = require('util.lualine.condition').buffer_empty,
          },
        },
      },
      options = {
        globalstatus = false,
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = ' ', right = ' ' },
      },
      extensions = {
        'lazy',
        'nvim-dap-ui',
        'quickfix',
        'toggleterm',
        'trouble',
        'oil',
      },
    }
  end,
}
