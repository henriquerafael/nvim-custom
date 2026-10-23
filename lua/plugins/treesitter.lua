-- File: lua/plugins/treesitter.lua
--
-- Configures nvim-treesitter for advanced syntax highlighting and indentation.

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSInstall', 'TSInstallSync', 'TSUpdate', 'TSUpdateSync', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
  config = function()
    local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not status_ok then
      return
    end

    configs.setup({
      ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'gitignore',
        'hcl',
        'html',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'terraform',
        'vim',
        'vimdoc',
        'yaml',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    })
  end,
}
