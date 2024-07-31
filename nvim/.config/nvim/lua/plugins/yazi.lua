return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      '<leader>y',
      function()
        require('yazi').yazi()
      end,
      desc = 'Open the file manager',
    },
  },
  opts = {
    open_for_directories = false,
  },
}
