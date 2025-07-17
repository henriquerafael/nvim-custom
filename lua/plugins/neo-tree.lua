-- File: lua/plugins/neo-tree.lua
--
-- This file configures neo-tree.nvim, a modern and feature-rich
-- file explorer for Neovim.

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Recommended for icons
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- Set neo-tree as the default file explorer
    vim.g.neo_tree_remove_legacy_commands = 1

    require('neo-tree').setup({
      -- Close Neovim if the only window left is the neo-tree buffer
      close_if_last_window = true,
      -- Show a popup for confirmation on actions like delete
      popup_border_style = 'rounded',
      -- Show git status and diagnostic symbols in the tree
      enable_git_status = true,
      enable_diagnostics = true,
      -- Configuration for the window itself
      window = {
        position = 'left', -- Can be 'left', 'right', 'float', 'current'
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      -- Filesystem source configuration
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files and folders by default
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            '.git',
            '.DS_Store',
            'thumbs.db',
          },
          never_show = {},
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the tree
        },
        hijack_netrw_behavior = 'open_current', -- Or 'disabled'
      },
      -- Git status integration symbols
      git_status = {
        symbols = {
          -- Change type
          added     = '✚', -- or 'A'
          deleted   = '✖', -- or 'D'
          modified  = '', -- or 'M'
          renamed   = '➜', -- or 'R'
          -- Status type
          untracked = 'U',
          ignored   = 'i',
          unstaged  = 'u',
          staged    = 's',
          conflict  = 'c',
        },
      },
      -- Keymaps for interacting with the tree
      -- These are the default mappings, but listed here for clarity.
      mappings = {
        ['<cr>'] = 'open',
        ['o'] = 'open',
        ['<esc>'] = 'cancel', -- Close the tree
        ['P'] = { 'toggle_preview', config = { use_float = true } },
        ['a'] = 'add',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['c'] = 'copy',
        ['m'] = 'move',
        ['q'] = 'close_window',
        ['H'] = 'toggle_hidden',
        ['gI'] = 'toggle_gitignore',
        ['R'] = 'refresh',
        ['?'] = 'show_help',
        ['<'] = 'prev_source',
        ['>'] = 'next_source',
      },
    })

    -- Keymap to toggle neo-tree
    -- This is placed in `keymaps.lua` in our setup, but can be here as well.
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer' })
  end,
}

