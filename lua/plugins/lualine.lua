-- File: lua/plugins/lualine.lua
--
-- This file configures lualine.nvim, a fast and easy-to-configure statusline.

return {
  'nvim-lualine/lualine.nvim',
  -- Add dependencies for the extensions you want to use
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-neo-tree/neo-tree.nvim', -- Required for the neo-tree extension
    'akinsho/toggleterm.nvim',
    'folke/lazy.nvim',
  },
  config = function()
    require('lualine').setup({
      options = {
        -- The theme for the statusline.
        -- 'auto' will automatically use the colorscheme's lualine theme if it exists.
        theme = 'auto',
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      -- Make sure to list the extensions you want to use here
      extensions = { 'neo-tree', 'toggleterm', 'lazy' },
    })
  end,
}
