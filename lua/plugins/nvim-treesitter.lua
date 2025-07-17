-- File: lua/plugins/nvim-treesitter.lua
--
-- This file configures nvim-treesitter, which provides advanced syntax
-- highlighting, indentation, and more based on a concrete syntax tree.

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all"
      -- These will be automatically installed and updated.
      ensure_installed = {
        'bash',
        'css',
        'html',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'terraform',
        'vim',
        'vimdoc',
        'yaml',
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering a buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- The core highlighting module
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      -- Treesitter-based indentation
      -- Provides more accurate indentation than Neovim's built-in logic.
      indent = {
        enable = true,
      },

      -- Incremental selection
      -- Allows you to incrementally select larger and larger syntax nodes.
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',   -- Start selection with <c-space>
          node_incremental = '<c-space>', -- Increment selection
          scope_incremental = '<c-s>',    -- Increment selection by scope
          node_decremental = '<M-space>', -- Decrement selection
        },
      },

      -- Optional: Textobjects based on Treesitter
      -- For this to work, you need to install 'nvim-treesitter-textobjects'
      -- See: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
      },
    })
  end,
}
