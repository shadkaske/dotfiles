-- local theme = " theme=ivy"
local theme = ""

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    lazy = "VeryLazy",
    cmd = { "Telescope" },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            use_delta = true,
            use_custom_command = nil,
            side_by_side = false,
            vim_diff_opts = { ctxlen = 0 },
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            saved_only = false,
          },
          fzf = {},
        },
      })
      require("telescope").load_extension("undo")
      require("telescope").load_extension("fzf")
    end,
    keys = {
      {
        "<C-g>",
        "<cmd>Telescope live_grep" .. theme .. "<cr>",
        desc = "Telescope Live Grep",
      },
      {
        "<leader>fu",
        "<cmd>Telescope undo<cr>",
        desc = "Undo History",
      },
      {
        "<leader>bf",
        "<cmd>Telescope buffers" .. theme .. "<cr>",
        desc = "Buffers",
      },
      {
        "<leader>cS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols" .. theme .. "<cr>",
        desc = "Workspace Symbols",
      },
      {
        "<leader>cd",
        "<cmd>Telescope diagnostics" .. theme .. "<cr>",
        desc = "Buffer Diagnostics",
      },
      {
        "<leader>cs",
        "<cmd>Telescope lsp_document_symbols" .. theme .. "<cr>",
        desc = "Document Symbols",
      },
      {
        "<leader>cw",
        "<cmd>Telescope diagnostics" .. theme .. "<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>cu",
        "<cmd>Telescope lsp_references" .. theme .. "<cr>",
        desc = "References ( Usage )",
      },
      {
        "<leader>fa",
        "<cmd>Telescope find_files hidden=true no_ignore=true" .. theme .. "<cr>",
        desc = "Find All Files",
      },
      {
        "<leader><Space>",
        "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
        desc = "Find All Files",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers" .. theme .. "<cr>",
        desc = "Buffers",
      },
      {
        "<leader>fc",
        "<cmd>Telescope registers" .. theme .. "<cr>",
        desc = "Clipboard Registers",
      },
      { "<leader>fC", '<cmd>Telescope find_files search_dirs={"~/.config/nvim"}<cr>', desc = "Config Files" },
      {
        "<leader>fd",
        "<cmd>Telescope diagnostics" .. theme .. "<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files" .. theme .. "<cr>",
        desc = "Files",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep" .. theme .. "<cr>",
        desc = "Live Grep",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags" .. theme .. "<cr>",
        desc = "Help",
      },
      {
        "<leader>fk",
        "<cmd>Telescope keymaps" .. theme .. "<cr>",
        desc = "Keymaps",
      },
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles" .. theme .. "<cr>",
        desc = "Recent Files",
      },
      {
        "<leader>fw",
        "<cmd>Telescope grep_string" .. theme .. "<cr>",
        mode = "v",
        desc = "Current Word",
      },
      {
        "<leader>gC",
        "<cmd>Telescope git_bcommits" .. theme .. "<cr>",
        desc = "Checkout commit(for current file)",
      },
      {
        "<leader>gb",
        "<cmd>Telescope git_branches" .. theme .. "<cr>",
        desc = "Checkout Branch",
      },
      {
        "<leader>go",
        "<cmd>Telescope git_status" .. theme .. "<cr>",
        desc = "Open changed file",
      },
    },
  },
}
