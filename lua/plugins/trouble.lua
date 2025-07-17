-- File: lua/plugins/trouble.lua
--
-- This file configures trouble.nvim, which provides a pretty list for
-- diagnostics, references, and more.

return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup({
      -- Use a smaller size for the trouble list
      height = 10,
      -- Icons for different diagnostic levels
      icons = true,
      -- The default mode to open in
      mode = 'workspace_diagnostics',
      -- Position of the list
      position = 'bottom',
      -- Add signs to the trouble list
      signs = {
        error = '',
        warning = '',
        hint = '',
        information = '',
      },
      -- Automatically open the trouble list when diagnostics are found
      auto_open = false,
      -- Automatically close the trouble list when there are no more diagnostics
      auto_close = false,
      -- Automatically jump to the first diagnostic when opening the list
      auto_jump = true,
      -- Automatically preview the location of the diagnostic
      auto_preview = true,
    })

    -- --- Keymaps for Trouble ---
    local keymap = vim.keymap

    -- Toggle the trouble list
    keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle Trouble' })
    -- Toggle workspace diagnostics
    keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { desc = 'Workspace Diagnostics' })
    -- Toggle document diagnostics
    keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { desc = 'Document Diagnostics' })
    -- Toggle quickfix list in Trouble
    keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { desc = 'Quickfix List' })
    -- Toggle location list in Trouble
    keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { desc = 'Location List' })
    -- Toggle LSP references in Trouble
    keymap.set('n', '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', { desc = 'LSP References' })
  end,
}

