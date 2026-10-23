-- File: lua/plugins/indent-blankline.lua
--
-- Configures indent-blankline.nvim (v3) to display vertical indentation guides.

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        'help',
        'lazy',
        'mason',
        'neo-tree',
        'notify',
        'toggleterm',
        'trouble',
      },
    },
  },
}
