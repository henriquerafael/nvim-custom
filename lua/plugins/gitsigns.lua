-- File: lua/plugins/gitsigns.lua
--
-- Configures gitsigns.nvim for git decorations, hunk actions, and blame inline.

return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = 'Git: ' .. desc })
        end

        -- Navigation between hunks
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gs.nav_hunk('next')
          end
        end, 'Next Hunk')

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gs.nav_hunk('prev')
          end
        end, 'Prev Hunk')

        -- Hunk actions (under <leader>gh to avoid conflicts with Telescope <leader>g*)
        map('n', '<leader>ghs', gs.stage_hunk, '[G]it [H]unk [S]tage')
        map('n', '<leader>ghr', gs.reset_hunk, '[G]it [H]unk [R]eset')
        map('v', '<leader>ghs', function()
          gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, '[G]it [H]unk [S]tage (Visual)')
        map('v', '<leader>ghr', function()
          gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, '[G]it [H]unk [R]eset (Visual)')
        map('n', '<leader>ghS', gs.stage_buffer, '[G]it [H]unk [S]tage Buffer')
        map('n', '<leader>ghu', gs.undo_stage_hunk, '[G]it [H]unk [U]ndo Stage')
        map('n', '<leader>ghR', gs.reset_buffer, '[G]it [H]unk [R]eset Buffer')
        map('n', '<leader>ghp', gs.preview_hunk, '[G]it [H]unk [P]review')
        map('n', '<leader>ghb', function()
          gs.blame_line({ full = true })
        end, '[G]it [H]unk [B]lame Line')
        map('n', '<leader>ght', gs.toggle_current_line_blame, '[G]it [H]unk [T]oggle Line Blame')
        map('n', '<leader>ghd', gs.diffthis, '[G]it [H]unk [D]iff This')
      end,
    })
  end,
}
