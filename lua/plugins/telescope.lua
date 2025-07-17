-- File: lua/plugins/telescope.lua
--
-- This file configures telescope.nvim, the highly extendable fuzzy finder.
-- It includes keymaps, UI customizations, and performance enhancements.

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6', -- Pin to a specific version for stability
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim', -- Added for UI selection
    -- Optional but recommended for performance:
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      -- run the following command and restart Neovim:
      -- `git clone --depth 1 https://github.com/nvim-telescope/telescope-fzf-native.nvim.git ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make -C ~/.local/share/nvim/lazy/telescope-fzf-native.nvim`
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- Optional but recommended for icons:
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        -- Default layout is a floating window in the center.
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        -- Customize the prompt mappings to feel more like Vim.
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<esc>'] = actions.close,
          },
        },

        -- Other default settings
        file_ignore_patterns = { 'node_modules', '.git' },
        prompt_prefix = '  ', -- Nerd Font icon for search
        selection_caret = ' ', -- Nerd Font icon for the selected item
      },
      pickers = {
        -- Configuration for specific pickers can go here.
        -- For example, for the `live_grep` picker:
        live_grep = {
          -- `rg` is a faster alternative to `grep`.
          -- Make sure you have `ripgrep` installed.
          -- `brew install ripgrep` or `sudo apt-get install ripgrep`
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden', -- Search hidden files
          },
        },
      },
      extensions = {
        -- Load the fzf-native extension for faster sorting.
        fzf = {
          fuzzy = true,                   -- Enable fuzzy finding
          override_generic_sorter = true, -- Override the generic sorter
          override_file_sorter = true,    -- Override the file sorter
          case_mode = 'smart_case',       -- 'smart_case', 'ignore_case', 'respect_case'
        },
        -- Configure the UI select extension
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    })

    -- Load the extensions.
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    -- --- Keymaps ---
    -- Define keymaps for the most common Telescope commands.
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap

    -- Find files
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    keymap.set('n', '<leader>fs', builtin.live_grep, { desc = '[F]ind by [S]tring' })
    keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[F]ind by [C]ursor word' })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld Files' })

    -- Git related
    keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
    keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
    keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
    keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })
  end,
}
