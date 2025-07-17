-- File: ~/.config/nvim/lua/config/lazy.lua
--
-- This file bootstraps and configures the lazy.nvim plugin manager.

-- --- Bootstrap lazy.nvim ---
-- This section ensures that lazy.nvim is installed.
-- It checks if the lazy.nvim directory exists and, if not, clones it from GitHub.
-- This makes your configuration portable and easy to set up on a new machine.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Use the latest stable branch
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- --- Configure lazy.nvim ---
-- This is the main configuration block for lazy.nvim.
require("lazy").setup({
  -- The most important setting: `spec` tells lazy.nvim where to find your plugin specifications.
  -- By using `import = "plugins"`, lazy.nvim will automatically load every .lua file
  -- in the `lua/plugins/` directory. This keeps your configuration modular and clean.
  spec = {
    { import = "plugins" },
  },

  -- Configure lazy.nvim's UI and behavior.
  -- These are recommended settings for a good user experience.
  checker = {
    enabled = true, -- Automatically check for plugin updates on startup.
    notify = true,  -- Notify when new updates are available.
  },
  change_detection = {
    enabled = true,
    notify = true, -- Notify when a change is detected and prompt to reload Neovim.
  },

  -- Optional: Add some performance optimizations.
--   performance = {
--     rtp = {
--       -- Disable some built-in plugins that are often replaced by more modern alternatives.
--       -- This can slightly speed up startup time.
--       disabled_plugins = {
--         "gzip",
--         "matchit",
--         "matchparen",
--         "netrwPlugin",
--         "tarPlugin",
--         "tohtml",
--         "tutor",
--         "zipPlugin",
--       },
--     },
--   },
})
