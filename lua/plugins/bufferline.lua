-- File: lua/plugins/bufferline.lua
--
-- Configures bufferline.nvim to display open buffers at the top of the editor.

return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = '[B]uffer [P]in Toggle' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = '[B]uffer Close [O]thers' },
  },
  opts = {
    options = {
      mode = 'buffers',
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = 'thin',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
}
