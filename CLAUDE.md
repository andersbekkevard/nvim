# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a **dynamic Neovim configuration** that adapts based on the environment:

### Environment Detection
- Uses `vim.g.vscode` to detect VS Code/Cursor environment
- Loads different plugin sets based on detection in `lua/anders/lazy/init.lua`

### Directory Structure
```
lua/anders/
├── init.lua              # Main entry point
├── set.lua              # Neovim preferences and options
├── remap.lua            # Core keybindings
├── autocmds.lua         # Autocommands (highlight on yank)
├── lazy_init.lua        # Lazy.nvim setup
└── lazy/
    ├── init.lua         # Dynamic plugin loader
    ├── shared/          # Configs used in both environments
    │   └── flash.lua   # Flash.nvim (motion plugin)
    ├── full/           # Full Neovim only
    │   ├── telescope.lua
    │   ├── theme.lua
    │   ├── lsp.lua
    │   └── completion.lua
    └── vscode/         # VS Code/Cursor specific
        ├── keybinds.lua # H/L line navigation
        └── highlight.lua # Highlight on yank for VS Code
```

### Configuration Logic
- **VS Code/Cursor**: Minimal setup with flash.nvim, H/L keybinds, and highlight on yank
- **Regular Neovim**: Full feature set including LSP, telescope, themes, completion
- **Shared configs**: Flash configuration is shared between both environments

## Key Configurations

### Leader Key
Space is set as the leader key (`vim.g.mapleader = " "`)

### Core Keybindings (always loaded)
- `H` / `L` - Jump to line start/end (instead of `^` / `$`)
- `<leader>w` - Quick save
- `<leader>y` / `<leader>Y` - Copy to system clipboard
- `<leader>p` / `<leader>P` - Paste from system clipboard
- `<leader>m` / `<leader>M` - Replace to next/previous underscore
- `n` / `N` - Centered search navigation
- `j` / `k` - Visual line movement (soft-wrapped text)

### Environment-Specific Features
- **Flash.nvim**: Available in both environments with `s` for jump, `<leader>s` for treesitter
- **VS Code only**: Simplified keybind set, relies on VS Code for most functionality
- **Regular Neovim only**: Full LSP, telescope, themes, and completion plugins

## Development Notes

### Adding New Plugins
- **Shared between both**: Add to `lua/anders/lazy/shared/`
- **Full Neovim only**: Add to `lua/anders/lazy/full/`
- **VS Code only**: Add to `lua/anders/lazy/vscode/`

### Shell Configuration
- Uses zsh with interactive mode (`-i -c`) for shell commands
- Colorcolumn at 80 characters (100 for Rust files)

### Plugin Management
Uses lazy.nvim with automatic installation. Plugin configs are modular and environment-aware.