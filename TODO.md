# Neovim Configuration TODO

This document outlines suggested improvements and enhancements for the current Neovim configuration.

## Plugins to add
- `trouble.nvim`
- `chainsaw.nvim`
- todo highlighting

## General enhancements

### Add copy and paste to clipboard management
- Keep yank and paste register from vim separate from system clipboard
- Add special keymaps specific to the system register

### Make lazygit "e" not open "pane?"
- It should simply open the buffer






### Diagnose Why Lazy Starts Unfocused
**Problem**: When opening neovim and lazy auto installs new packages
the cursor starts in the background.

**Suggestions**:
- Search the web for similar reports

### Allow "Scrolling" With Cursor off screen
**Problem**: Scrolling w/ <C-e> and <C-y> moves the cursor as
it reaches the boundaries. Because of `vim.scrolloff = 8`

### Enable hidden files in file picker
- Currently doesn't include hidden files
- Enable gitignored files

### Enable gitignored files in explorer

### Fix Window Clash Issues
**Problem**: Opening terminal clashes with opening explorer.

**Suggestions**:
- Both terminal and explorer are from snacks modules, so there
should be a way to make them not clash.

### Improve `<leader>Q` to quit everything
**Problem**: If on terminal, only closes terminal

### Extra keybinding
- Add keybinding for copying (to system) buffer file path (relative to project root)
- Better buffer/window management
    - Keymap for closing other buffers
    - Keymap for closing other windows
- Save without formatting <C-S-s>

### Add floating help
- Research best options
- If no good ones, implement with Snack.win
- Ask to "hijack" traditional help window

### Swap `ts_ls` for `typescript-tools`
- Check Claude for benefits and interoperability with Biome

### Configuration Validation
**Missing**: Validation of configuration settings

**Suggestions**:
- Add checks for required tools/binaries
- Validate plugin configurations on startup
- Add health checks for custom configurations

### Add Configuration Documentation
**Missing**: Documentation for custom configurations and keymaps

**Suggestions**:
- Create `KEYMAPS.md` documenting all custom keymaps
- Add inline documentation for complex configurations
- Document custom functions and their purposes

## Completed ✅

- ✅ Complete Mini.lua Configuration (added autopairs, surround, textobjects, bracketed navigation, and icons)
- ✅ Fix Directory Path Configuration (backup/undo paths corrected with auto-creation)
- ✅ LSP Configuration (migrated to nvim-lspconfig with proper root_markers format)
- ✅ Treesitter Configuration (syntax highlighting and indentation)
- ✅ Keymap duplication cleanup
- ✅ Plugin architecture modernization
- ✅ Custom LSP configuration integration

## Learn
- How to fold in neovim
