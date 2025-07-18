# Nvim-Custom: A Modern Neovim IDE

Welcome to `nvim-custom`, a thoughtfully crafted Neovim configuration designed to provide a fast, beautiful, and productive IDE-like experience. This setup is built from the ground up using modern Lua-based plugins and best practices, focusing on performance and ease of use.

Whether you're a seasoned developer or just starting your journey with Neovim, this configuration provides a powerful and extensible foundation.

-----

### ✨ Features

This configuration is packed with features to supercharge your workflow:

  - **⚡ Fast & Lazy-Loaded:** Powered by `lazy.nvim` for lightning-fast startup times. Plugins are loaded only when you need them.
  - **🔭 Powerful Fuzzy Finding:** `Telescope` is at the core of our navigation, allowing you to find files, text, buffers, and Git commits in an instant.
  - **🧠 Full IDE Experience:** Get intelligent autocompletion, diagnostics, and code actions with `nvim-lspconfig`, `nvim-cmp`, and `LuaSnip`.
  - **🌳 Advanced Syntax Highlighting:** `nvim-treesitter` provides more accurate and detailed syntax highlighting and code structure analysis.
  - **🎨 Beautiful & Informative UI:** A stunning and cohesive look with themes like `Gruvbox` or `Catppuccin`, a feature-rich `lualine` status bar, and file icons.
  - **📁 Seamless File Navigation:** A modern file explorer with `neo-tree.nvim` and lightning-fast file marking and jumping with `harpoon`.
  - **🔧 Effortless Git Integration:** Manage your Git workflow without leaving the editor, thanks to `gitsigns.nvim` and a `lazygit` terminal integration.
  - **📟 Integrated Terminal:** A powerful and easy-to-use terminal with `toggleterm.nvim`.
  - **🛠️ Pretty Diagnostics:** A clean and navigable UI for errors and warnings with `trouble.nvim`.

-----

### 📋 Prerequisites

Before you begin, make sure you have the following installed on your system:

  - **Neovim v0.9+**
  - **Git**
  - **A C Compiler** (for Treesitter and other native extensions)
  - **A Nerd Font** (e.g., [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads), [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads))
  - **ripgrep** (for Telescope's live grep)
  - **fd** (for faster file searching in Telescope)

-----

### 🚀 Installation

#### Clone the Repository

> [\!NOTE]
> These instructions will clone this specific configuration into your Neovim config directory.

<details><summary> Linux and Mac (WSL/Ubuntu) </summary>

```sh
git clone https://github.com/henriquerafael/nvim-custom.git "${XDG\_CONFIG\_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```sh
git clone https://github.com/henriquerafael/nvim-custom.git "%localappdata%\\nvim"
```

If you're using `powershell.exe`:

```sh
git clone https://github.com/henriquerafael/nvim-custom.git "${env:LOCALAPPDATA}\\nvim"
```

</details>

### Post Installation

Start Neovim:

```sh
nvim
```

That's it\! `lazy.nvim` will automatically install all the plugins. You can use the `:Lazy` command to view the current plugin status. Hit `q` to close the window.

-----

### ⌨️ Keybindings

Here are some of the most important keybindings to get you started. The leader key is set to `<Space>`.

| Keybinding          | Description                               |
| ------------------- | ----------------------------------------- |
| **General** |                                           |
| `<leader>e`         | Toggle file explorer (`neo-tree`)         |
| `<leader>w`         | Write (save) the current file             |
| `<leader>q`         | Quit the current window                   |
| `<C-h/j/k/l>`       | Navigate between windows                  |
| **Telescope** |                                           |
| `<leader>ff`        | Find files                                |
| `<leader>fs`        | Find string in files (live grep)          |
| `<leader>fb`        | Find open buffers                         |
| `<leader>gs`        | Git status                                |
| **Harpoon** |                                           |
| `<leader>ha`        | Add current file to Harpoon list          |
| `<leader>he`        | Edit Harpoon list                         |
| `<leader>1` - `4`   | Jump to Harpoon file 1-4                  |
| **Trouble** |                                           |
| `<leader>xx`        | Toggle Trouble panel                      |
| `<leader>xw`        | Show workspace diagnostics                |
| `<leader>xr`        | Show LSP references in Trouble            |
| **LSP** |                                           |
| `gd`                | Go to definition                          |
| `gr`                | Go to references                          |
| `K`                 | Hover to show documentation               |
| `<leader>ca`        | Show code actions                         |
| **Toggleterm** |                                           |
| `<C-\>`             | Toggle floating terminal                  |
| `<leader>gg`        | Toggle `lazygit` terminal                 |
| `<leader>tv`        | Toggle vertical terminal                  |

-----

### 📁 Project Structure

The configuration is organized logically to make it easy to customize:

```
\~/.config/nvim
├── lua/
│   ├── config/
│   │   └── lazy.lua      -- lazy.nvim plugin manager setup
│   ├── plugins/
│   │   ├── ...           -- Each file is a plugin configuration
│   │   └── ...
│   ├── keymaps.lua       -- Global keymappings
│   └── options.lua       -- Core Neovim settings
└── init.lua              -- The main entry point
```

To add a new plugin, simply create a new `.lua` file in the `lua/plugins/` directory. `lazy.nvim` will automatically load it.

-----

### ❤️ Acknowledgements

This configuration wouldn't be possible without the incredible work of the Neovim community and the authors of all the amazing plugins used here.
