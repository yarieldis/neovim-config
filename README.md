# Neovim Config

A modular [Neovim](https://neovim.io/) configuration powered by
[`lazy.nvim`](https://github.com/folke/lazy.nvim). Built around a modern Lua
setup with a focus on Go, TypeScript/JavaScript, and web development.

## Features

- ⚡ **Lazy loading** via `lazy.nvim` with locked plugin versions
  (`lazy-lock.json`)
- 🎨 **Catppuccin** colorscheme (Mocha variant)
- 🖥️ **LSP** setup via `mason.nvim` + `nvim-lspconfig` (automatic server
  install) with completion powered by `nvim-cmp`
- 🌳 **Treesitter** syntax highlighting and indentation
- 🔍 **Telescope** fuzzy finding with `ui-select`
- 📁 **Neo-tree** file explorer and **Oil** floating file manager
- 🧪 **vim-test** test runner using the `vimux` strategy
- 🐙 **Git** integration with `vim-fugitive` and `gitsigns`
- 🧹 **Formatting & linting** via `none-ls.nvim`
  (stylua, prettier, gofumpt, goimports, golangci-lint, staticcheck)
- 🪟 **Tmux** pane navigation with `nvim-tmux-navigation`
- 🚀 **Alpha** dashboard with a custom ASCII banner
- 📄 **Swagger** OpenAPI preview

## Requirements

- [Neovim](https://github.com/neovim/neovim/releases) **0.9+** (0.10+
  recommended)
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- [Node.js](https://nodejs.org/) & `npm` (required by `swagger-preview.nvim`,
  which installs `swagger-ui-watcher` globally)
- [Go](https://go.dev/) toolchain with `$(go env GOPATH)/bin` on your `PATH`
  (for `gopls`, `gofumpt`, `goimports`, etc.)
- [tmux](https://github.com/tmux/tmux) (optional, for tmux navigation)
- `ripgrep` (recommended, for Telescope's `live_grep`)

## Installation

1. Back up any existing configuration:

   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:

   ```sh
   git clone https://github.com/yarieldis/neovim-config.git ~/.config/nvim
   ```

   > **Windows** users should clone to `~/AppData/Local/nvim`.

3. Start Neovim. `lazy.nvim` and all plugins will be installed
   automatically on first launch:

   ```sh
   nvim
   ```

4. Install LSP servers, formatters, and linters:

   ```sh
   :Mason
   ```

   LSP servers are configured to auto-install, but you can also manage them
   manually through the Mason UI.

## Project Structure

```
.
├── init.lua                      # Bootstrap: installs lazy.nvim and loads config
├── lazy-lock.json                # Locked plugin versions
└── lua/
    ├── vim-options.lua           # General settings and keymaps
    ├── plugins.lua               # Plugin module aggregator (currently empty)
    ├── .luarc.json               # Lua language server settings
    └── plugins/
        ├── alpha.lua             # Dashboard (alpha-nvim)
        ├── catppuccin.lua        # Colorscheme
        ├── completions.lua       # nvim-cmp + LuaSnip + snippets
        ├── git-stuff.lua         # fugitive + gitsigns
        ├── gitsigns.lua          # gitsigns (standalone)
        ├── go.lua                # Go toolkit (go.nvim)
        ├── lsp-config.lua        # Mason + lspconfig
        ├── neo-tree.lua          # File explorer
        ├── none-ls.lua           # Formatting & diagnostics
        ├── nvim-tmux-navigation.lua
        ├── oil.lua               # Floating file manager
        ├── swagger-preview.lua   # OpenAPI preview
        ├── telescope.lua         # Fuzzy finder
        ├── treesitter.lua        # Syntax highlighting
        └── vim-test.lua          # Test runner
```

## Plugins

| Category      | Plugins |
| ------------- | ------- |
| Plugin manager| [lazy.nvim](https://github.com/folke/lazy.nvim) |
| Colorscheme   | [catppuccin](https://github.com/catppuccin/nvim) |
| Dashboard     | [alpha-nvim](https://github.com/goolord/alpha-nvim) |
| Completion    | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) |
| LSP           | [mason.nvim](https://github.com/williamboman/mason.nvim), [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) |
| Go            | [go.nvim](https://github.com/ray-x/go.nvim) |
| Format/Lint   | [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) |
| Syntax        | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| Fuzzy finder  | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim), [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) |
| File explorer | [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim), [oil.nvim](https://github.com/stevearc/oil.nvim) |
| Git           | [vim-fugitive](https://github.com/tpope/vim-fugitive), [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| Testing       | [vim-test](https://github.com/vim-test/vim-test), [vimux](https://github.com/preservim/vimux) |
| Tmux          | [nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation) |
| Swagger       | [swagger-preview.nvim](https://github.com/vinnymeller/swagger-preview.nvim) |

## Keybindings

The leader key is set to `<Space>`.

### General

| Key | Action |
| --- | ------ |
| `<Space>` | Leader |
| `<C-h/j/k/l>` | Navigate windows (also crosses tmux panes) |
| `<Space>h` | Clear search highlight |

### File & Search

| Key | Action |
| --- | ------ |
| `<C-p>` | Telescope: find files |
| `<C-n>` | Neo-tree: reveal in left sidebar |
| `<Space>bf` | Neo-tree: buffers (floating) |
| `-` | Oil: floating file manager |
| `<Space>fg` | Telescope: live grep |
| `<Space><Space>` | Telescope: recent files |

### LSP

| Key | Action |
| --- | ------ |
| `K` | Hover documentation |
| `<Space>gd` | Go to definition |
| `<Space>gr` | References |
| `<Space>ca` | Code action |
| `<Space>gf` | Format buffer |

### Git

| Key | Action |
| --- | ------ |
| `<Space>gp` | Preview hunk (gitsigns) |
| `<Space>gt` | Toggle current line blame (gitsigns) |

### Testing

| Key | Action |
| --- | ------ |
| `<Space>t` | Run nearest test |
| `<Space>T` | Run current test file |
| `<Space>a` | Run entire test suite |
| `<Space>l` | Run last test |
| `<Space>g` | Visit test file |

## Language Servers & Tools

The following servers, formatters, and linters are wired up by default
(auto-installed through Mason):

- **Go** — `gopls` (LSP), `gofumpt`/`goimports` (formatting), `staticcheck`/`golangci-lint` (linting)
- **TypeScript/JavaScript** — `tsserver`, `prettier`
- **HTML** — `html`
- **Lua** — `lua_ls`, `stylua`

## Notes

- `lua/plugins/gitsigns.lua` is a standalone duplicate of the gitsigns config
  also present in `lua/plugins/git-stuff.lua` — both load the same plugin, so
  keybindings from `git-stuff.lua` take effect.
- `lua/plugins.lua` currently returns an empty table; all plugins are defined
  in the `lua/plugins/` directory.
