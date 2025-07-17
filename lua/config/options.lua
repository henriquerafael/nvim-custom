-- options.lua
--
-- This file contains the core editor settings for Neovim.
-- It is structured to be easily readable and maintainable, with options
-- grouped by their function. Each option is commented to explain its purpose.

-- Get a local reference to the 'opt' object for brevity.
local opt = vim.opt

--------------------------------------------------------------------------------
--  Section 1: Basic Editor Functionality
--------------------------------------------------------------------------------

-- Set the leader key.
-- The leader key is a personal preference, but space is a common and ergonomic choice.
-- It must be set before any keymaps are defined.
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = '\\'

-- Line Numbers
opt.number = true         -- Show line numbers on the left.
opt.relativenumber = true -- Show relative line numbers for easier vertical navigation.

-- Case-Insensitive Searching
opt.ignorecase = true -- Ignore case when searching for patterns.
opt.smartcase = true  -- Override 'ignorecase' if the search pattern contains uppercase letters.

-- UI and Appearance
opt.termguicolors = true -- Enable 24-bit RGB color in the terminal. Essential for modern themes.
opt.cursorline = true    -- Highlight the current line the cursor is on.
opt.wrap = false         -- Do not wrap long lines; keep them on a single line.
opt.showmode = false     -- Don't show the current mode (e.g., -- INSERT --), as this is handled by status line plugins.

-- Command Line Height
opt.cmdheight = 1 -- Set the height of the command-line area to 1.

-- Prevent layout shifts from the sign column (used for git signs, diagnostics, etc.)
opt.signcolumn = "yes"

--------------------------------------------------------------------------------
--  Section 2: Indentation and Tabs
--------------------------------------------------------------------------------

opt.expandtab = true      -- Use spaces instead of tabs.
opt.tabstop = 2           -- Number of visual spaces per tab.
opt.softtabstop = 2       -- Number of spaces inserted when pressing <Tab>.
opt.shiftwidth = 2        -- Number of spaces to use for auto-indentation.
opt.smartindent = true    -- Enable smart auto-indenting for new lines.

--------------------------------------------------------------------------------
--  Section 3: File and Buffer Management
--------------------------------------------------------------------------------

-- Persistent Undo
-- This allows you to undo changes even after closing and reopening a file.
opt.undofile = true

-- Disable legacy backup files.
-- With version control (Git) and persistent undo, these are often unnecessary.
opt.backup = false
opt.swapfile = false
opt.writebackup = false

--------------------------------------------------------------------------------
--  Section 4: Window and Split Management
--------------------------------------------------------------------------------

-- Make splitting windows more intuitive.
opt.splitright = true -- When splitting vertically, the new window appears on the right.
opt.splitbelow = true -- When splitting horizontally, the new window appears below.

--------------------------------------------------------------------------------
--  Section 5: Performance and Behavior
--------------------------------------------------------------------------------

-- Update Time
-- Faster update time for plugins that use CursorHold events (e.g., LSP, GitSigns).
opt.updatetime = 300

-- Timeout Length
-- Shorter timeout for key sequences (e.g., for which-key).
opt.timeoutlen = 300

-- Scrolling Offset
-- Keep a certain number of lines visible above and below the cursor when scrolling.
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Search Behavior
opt.hlsearch = true  -- Highlight all matches of a search.
opt.incsearch = true -- Show search results incrementally as you type.

-- Completion Options
-- Configure the behavior of the built-in completion menu.
opt.completeopt = { "menuone", "noselect" }

--------------------------------------------------------------------------------
--  Section 6: Advanced and Aesthetic Options
--------------------------------------------------------------------------------

-- Message and Status Line
opt.laststatus = 3 -- Use a global status line instead of one per window.
-- Clean up messaging. Appends 'c' to shortmess to avoid "match 1 of 3" messages.
vim.opt.shortmess:append "c"

-- Folding
opt.foldmethod = "manual" -- Default to manual folding.
opt.foldenable = false    -- Do not automatically fold files when they are opened.
opt.foldlevel = 99        -- Start with all folds open.

-- Hide tilde (~) characters at the end of the buffer for a cleaner look.
opt.fillchars = { eob = " " }

-- Control how comments are handled.
-- This removes auto-wrapping and auto-insertion of comment leaders.
opt.formatoptions:remove { "c", "r", "o" }

