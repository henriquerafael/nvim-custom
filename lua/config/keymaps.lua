-- File: lua/keymaps.lua
--
-- This file contains custom keymappings for Neovim to enhance productivity.
-- Mappings are organized by mode for clarity.

-- A helper function to make setting keymaps more concise.
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- --- Global Settings ---
-- Set the leader key.
-- The leader key is a personal preference, but space is a common and ergonomic choice.
-- It must be set before any keymaps are defined.
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- --- My Personal keymaps
-- Witre (:w) keymap
map('n', '<leader>w', ':w<CR>', {desc = 'Write file in normal mode'})
map('i', '<leader>w', '<Esc>:w<CR>', {desc = 'Write file in insert mode'})

-- Refreshenv (:source)
map('n', '<leader>sc', ':so<CR>', {desc = 'Refresh env in normal mode'})
map('i', '<leader>sc', '<Esc>:so<CR>', {desc = 'Refresh env in insert mode'})

-- --- Normal Mode Keymaps ---

-- Window Navigation: Use Ctrl + hjkl to navigate between windows, similar to tmux.
map('n', '<C-h>', '<C-w>h', { desc = 'Navigate window left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Navigate window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Navigate window up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Navigate window right' })

-- Window Management
map('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertically' })
map('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontally' })
map('n', '<leader>se', '<C-w>=', { desc = '[S]plit [E]qualize' })
map('n', '<leader>sx', '<cmd>close<CR>', { desc = '[S]plit close [X]' })

-- Buffer Navigation
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', 'H', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })

-- Clear search highlight
map('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = '[N]o [H]ighlight' })

-- Fast saving
map('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite file' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit' })

-- Resize windows with arrow keys
map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- --- Visual Mode Keymaps ---

-- Move selected lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Stay in indent mode
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })


-- --- Insert Mode Keymaps ---

-- Fast exit from insert mode
map('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })


-- --- Terminal Mode Keymaps ---

-- Exit terminal mode with <esc>
map('t', '<esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- --- Plugin Keymaps ---
-- This is where you would put keymaps for your plugins.
-- For example, for a file explorer like neo-tree:
-- map('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer' })

