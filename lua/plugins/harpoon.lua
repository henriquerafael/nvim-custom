-- File: lua/plugins/harpoon.lua
--
-- This file configures harpoon, a plugin for managing and quickly
-- jumping to frequently used files.

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- For the UI
  },
  config = function()
    local harpoon = require('harpoon')

    -- Basic setup
    harpoon:setup()

    -- --- Keymaps ---
    -- These keymaps provide an intuitive way to manage your harpooned files.
    local keymap = vim.keymap

    -- Add the current file to the harpoon list
    keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
      vim.notify('File added to harpoon list', vim.log.levels.INFO)
    end, { desc = '[H]arpoon [A]dd file' })

    -- Toggle the main harpoon UI (Telescope integration)
    keymap.set('n', '<leader>he', function()
      local harpoon_ui = require('harpoon.ui')
      harpoon_ui.toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [E]dit list' })

    -- --- Navigation ---
    -- Quickly jump to your marked files.
    -- You can create as many of these as you like.
    keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon to file 1' })
    keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon to file 2' })
    keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon to file 3' })
    keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon to file 4' })

    -- You can also use Telescope to fuzzy find from your harpoon list
    keymap.set('n', '<leader>hf', function()
      require('telescope').extensions.harpoon.marks()
    end, { desc = '[H]arpoon [F]ind file' })
  end,
}

