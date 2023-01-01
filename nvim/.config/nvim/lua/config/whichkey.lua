local whichkey_ok, whichkey = pcall(require, "which-key")

if not whichkey_ok then
  return
end

whichkey.register({
  ["<leader>"] = {
    w = { "<cmd>w!<CR>", "Save" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer", },
    h = { "<cmd>nohlsearch<cr>", "Highlight" },
    n = { "<cmd>ene!<cr>", "New File" },
    f = {
      name = "+Find",
      c = { "<cmd>Telescope registers<cr>", "Clipboard" },
      f = { "<cmd>Telescope git_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files"},
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep Files"},
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      w = { "<cmd>Telescope grep_string<cr>", "Find Current Word" },
    },
    P = {
      name = "+Packer",
      i = { "<cmd>PackerInstall<cr>", "Install" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
    },
    g = {
      name = "+Git",
      s = { "<cmd>Git<cr>", "Git Status" },
      c = { "<cmd>Git commit<cr>", "Git Commit" },
    },
    b = {
      name = "+Buffers",
      b = { "<cmd>Telescope buffers<cr>", "List Open"},
      d = { "<cmd>Bdelete<cr>", "Close" },
      D = { "<cmd>BufferLinePickClose<cr>", "Close A Buffer"},
      g = { "<cmd>BufferLinePick<cr>", "Goto Buffer"},
      n = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
      p = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer"},
      N = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer Next"},
      P = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer Previous"},
    },
    c = {
      name = "+Nvim Config",
      r = { "<cmd>luafile %<cr>", "Reload Current File" },
      R = { "<cmd>luafile ~/.config/nvim/init.lua<cr>", "Reload Config" },
    },
    l = {
      name = "LSP",
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
      I = {
        "<cmd>lua vim.lsp.buf.implementation()<cr>",
        "Show implementations",
      },
      R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
      e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
      -- f = { "<cmd>lua require('functions').toggle_autoformat()<cr>", "Toggle format on save" },
      i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
      k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
      l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix Diagnostics" },
      r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
      w = {
        name = "workspaces",
        a = {
          "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
          "Add Workspace Folder",
        },
        d = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
          "List Workspace Folders",
        },
        r = {
          "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
          "Remove Workspace Folder",
        },
        s = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
    },
    t = {
      name = "+Terminal",
      t = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
    },
    T = {
      name = "+Toggles",
      c = { '<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80,100" : "")<CR>', "Color Column" },
    },
    y = {
      name = "+Yarn"
    }
  }
})
