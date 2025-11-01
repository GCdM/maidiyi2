# Project Plan

This plan outlines improvements and enhancements for the Neovim configuration,
including new plugins, clipboard management, UI improvements, keybindings, and
configuration quality enhancements.

## Tasks

- [ ] 1: Add new plugins
  - [ ] 1.1: Install and configure `trouble.nvim`
  - [ ] 1.2: Install and configure `chainsaw.nvim`
  - [ ] 1.3: Install and configure `folke/todo-comments.nvim`
  - [ ] 1.4: Install and configure `norcalli/nvim-colorizer`
    - [ ] 1.4.1: Add toggle keybinding `<leader>uC` -> `[U]I [*C*]olourise`

- [x] 2: Implement clipboard management system
  - [x] 2.1: Configure separate yank/paste registers from system clipboard
  - [x] 2.2: Create special keymaps for system clipboard operations

- [x] 3: Fix lazygit "e" behavior
  - [x] 3.1: Configure lazygit to open buffers directly instead of panes

- [ ] 4: Diagnose and fix Lazy startup focus issue
  - [ ] 4.1: Research similar reports about Lazy package manager cursor focus
  - [ ] 4.2: Implement fix for cursor starting in background during auto-install

- [x] 6: Enable hidden files in file picker
  - [x] 6.1: Configure file picker to include hidden files
  - [x] 6.2: Enable gitignored files in file picker

- [x] 7: Enable gitignored files in explorer

- [ ] 8: Fix window clash between terminal and explorer
  - [ ] 8.1: Research snacks module configuration options
  - [ ] 8.2: Implement solution to prevent terminal/explorer conflicts

- [ ] 10: Add additional keybindings
  - [x] 10.1: Add keybinding for copying buffer file path (relative to project
        root) to system clipboard
  - [ ] 10.2: Add keymap for closing other buffers
  - [ ] 10.3: Add keymap for closing other windows

- [ ] 11: Implement floating help window
  - [ ] 11.1: Research best options for floating help
  - [ ] 11.2: Implement solution (either existing plugin or custom with
        Snack.win)
  - [ ] 11.3: Configure to hijack traditional help window

- [ ] 12: Swap `ts_ls` for `typescript-tools`
  - [ ] 12.1: Research benefits and interoperability with Biome
  - [ ] 12.2: Implement replacement configuration

- [ ] 13: Add configuration validation
  - [ ] 13.1: Add checks for required tools/binaries
  - [ ] 13.2: Add validation for plugin configurations on startup
  - [ ] 13.3: Add health checks for custom configurations

- [ ] 14: Create configuration documentation
  - [ ] 14.1: Create `KEYMAPS.md` documenting all custom keymaps
  - [ ] 14.2: Add inline documentation for complex configurations
  - [ ] 14.3: Document custom functions and their purposes

- [ ] 15: Choose a "bufferline" style plugin for buffer management

- [x] 16: Configure dprint for markdown formatting

- [ ] 17: Configure explorer to "hijack" netrw (in fullscreen)
  - [ ] 17.1: When opening a directory with `nvim` e.g. `nvim .`, open explorer
        in fullscreen
  - [ ] 17.2: When opening explorer with keybinding `\` open on right-hand side

- [x] 18: Save without formatting keybinding
  - [x] 18.1: `<C-S-s>` unless this conflicts with some existing behaviour

- [ ] 19: Choose a markdown preview plugin

- [ ] 20: Test how centering page jumps feels
  - [ ] 20.1: Add `zz` to `<C-d>` & `<C-u>`
  - [ ] 20.1: Add `zz` to `<C-d>` & `<C-u>`

- [ ] 21: Find plugin that improves "f" and "t". They should be repeatable and
      multlined

- [ ] 22: Parse differences between new and old maidiyi
  - [ ] 22.1: Create a list of the differences
  - [ ] 22.2: Pick ones to copy over

## To do

- [ ] 1: Learn
  - [ ] How to fold in Neovim

## Notes

- Tasks 1-14 are enhancements and improvements
- Task 15 is a learning objective
- Several tasks involve the snacks module (terminal, explorer)
- Some items require research before implementation (tasks 4, 11, 12)
- Previously completed items are tracked in TODO.md Completed section
- Consider dependencies: clipboard management (task 2) should be done before
  related keybindings (task 10.1)
- Configuration validation (task 13) and documentation (task 14) can be done in
  parallel once core features are stable

---

<!-- SNAPSHOT: DO NOT EDIT BELOW THIS LINE -->

## Snapshot Metadata

**Source File:** TODO.md **Last Updated:** 2025-11-01

### Original Content

```
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
```
