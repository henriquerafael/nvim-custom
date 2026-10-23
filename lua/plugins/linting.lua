-- File: lua/plugins/linting.lua
--
-- Configures nvim-lint for asynchronous linting across DevOps and backend languages.

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      ansible = { 'ansible_lint' },
      bash = { 'shellcheck' },
      sh = { 'shellcheck' },
      python = { 'ruff' },
      terraform = { 'tflint' },
      tf = { 'tflint' },
      yaml = { 'yamllint' },
    }

    -- Only run linters whose binary is installed on the system to avoid ENOENT errors
    local function try_available_linters()
      local names = lint._resolve_linter_by_ft(vim.bo.filetype)
      local available = {}
      for _, name in ipairs(names) do
        local linter = lint.linters[name]
        if linter then
          local cmd = type(linter.cmd) == 'function' and linter.cmd() or linter.cmd
          if cmd and vim.fn.executable(cmd) == 1 then
            table.insert(available, name)
          end
        end
      end
      if #available > 0 then
        lint.try_lint(available)
      end
    end

    local lint_augroup = vim.api.nvim_create_augroup('nvim_lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = try_available_linters,
    })

    vim.keymap.set('n', '<leader>cl', try_available_linters, { desc = '[C]ode [L]int' })
  end,
}
