-- File: lua/plugins/todo-comments.lua
--
-- Highlights and searches for TODO, FIXME, NOTE, HACK, and WARNING comments.

return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    {
      ']T',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next Todo Comment',
    },
    {
      '[T',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous Todo Comment',
    },
    { '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Todo List (Trouble)' },
    { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = '[F]ind [T]odos' },
  },
}
