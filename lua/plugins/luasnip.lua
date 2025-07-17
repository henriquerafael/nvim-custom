-- File: lua/plugins/luasnip.lua
--
-- This file configures LuaSnip, the snippet engine.

return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    -- A collection of common snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- Load friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}

