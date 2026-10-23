-- ~/.config/nvim/lua/plugins/gruvbox.lua
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,   -- load before other plugins (colourscheme should come early)
  lazy = false,      -- load immediately so the theme is applied on startup
  config = function()
    -- Essential: enable true color support
    vim.opt.termguicolors = true

    -- Optional: configure the theme before loading it
    require("gruvbox").setup({
      contrast = "hard",         -- "hard" | "soft" (default) | ""
      transparent_mode = false,  -- true for transparent background
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      overrides = {
        -- Example: customise the sign column background
        SignColumn = { bg = "#282828" },
      },
    })

    -- Apply the colourscheme
    vim.cmd.colorscheme("gruvbox")
  end,
}
