-- File: lua/plugins/trouble.lua
--
-- This file configures trouble.nvim, which provides a pretty list for
-- diagnostics, references, and more.

return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup({
      -- Automatically close the trouble list when there are no more diagnostics
      auto_close = false,
      -- Automatically preview the location of the diagnostic
      auto_preview = true,
      -- Focus the trouble window when opened
      focus = true,
    })

    -- --- Keymaps for Trouble (v3 API) ---
    local keymap = vim.keymap

    -- Toggle the trouble list
    keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Toggle Trouble' })
    -- Toggle workspace diagnostics
    keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Workspace Diagnostics' })
    -- Toggle document diagnostics
    keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Document Diagnostics' })
    -- Toggle quickfix list in Trouble
    keymap.set('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List' })
    -- Toggle location list in Trouble
    keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List' })
    -- Toggle LSP references in Trouble
    keymap.set('n', '<leader>xr', '<cmd>Trouble lsp_references toggle<cr>', { desc = 'LSP References' })
  end,
}

