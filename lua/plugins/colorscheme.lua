-- File: lua/plugins/colorscheme.lua
--
-- This file configures the Catppuccin theme. It's designed to be
-- placed in your plugins directory and loaded by lazy.nvim.

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,    -- Make sure the colorscheme is loaded at startup
  priority = 1000, -- Make sure it loads before other plugins
  config = function()
    -- Configure Catppuccin
    require('catppuccin').setup({
      flavour = 'macchiato', -- A popular dark variant
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- Set to true for a transparent background
      show_end_of_buffer = false,     -- Shows the '~' characters at the end of the buffer
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = false,    -- If you don't have a font with italics
      no_bold = false,      -- If you don't have a font with bold
      no_underline = false, -- If you don't have a font with underline
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      -- Integrations with other plugins
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more integrations, see the Catppuccin documentation
      },
    })

    -- Set the colorscheme
    vim.cmd.colorscheme 'catppuccin'
  end,
}
