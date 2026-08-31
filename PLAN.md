# Project Plan

This plan outlines improvements and enhancements for the Neovim configuration,
including new plugins, clipboard management, UI improvements, keybindings, and
configuration quality enhancements.

## Tasks

- [ ] 0: Markdown
  - [x] 0.1: Add a renderer to show _italics_
  - [ ] 0.2: Enable codeblock syntax highlighting
  - [x] 0.3: Fix 4 space tab
  - [x] 0.4: Add formatter

- [x] 1: Add new plugins
  - [x] 1.2: Install and configure `chainsaw.nvim`
  - [x] 1.3: Install and configure `folke/todo-comments.nvim`
  - [x] 1.4: Install and configure `norcalli/nvim-colorizer`
    - [x] 1.4.1: Add toggle keybinding `<leader>uC` -> `[U]I [*C*]olourise`
  - [x] 1.5: Setup `romgrk/barbar.nvim`

- [x] 2: Implement clipboard management system
  - [x] 2.1: Configure separate yank/paste registers from system clipboard
  - [x] 2.2: Create special keymaps for system clipboard operations

- [x] 3: Fix lazygit "e" behavior
  - [x] 3.1: Configure lazygit to open buffers directly instead of panes

- [x] 4: Auto-close Lazy view after startup install (User VeryLazy hook)

- [x] 6: Enable hidden files in file picker
  - [x] 6.1: Configure file picker to include hidden files
  - [x] 6.2: Enable gitignored files in file picker

- [x] 7: Enable gitignored files in explorer

- [x] 8: Reconfigure Snacks.explorer — center float, open on startup, auto-close
      on selection

- [x] 10: Add additional keybindings
  - [x] 10.1: Add keybinding for copying buffer file path (relative to project
        root) to system clipboard
  - [x] 10.2: Add keymap for closing other buffers
  - [x] 10.3: Add keymap for closing other windows

- [x] 11: Implement floating help window (right-side, 40% width)

- [x] 12: Swap `ts_ls` for `tsgo` (requires
      `npm i -g @typescript/native-preview`)

- [x] 13: Add configuration validation
  - [x] 13.1: Add checks for required tools/binaries
  - [ ] 13.2: Add validation for plugin configurations on startup

- [x] 16: Configure dprint for markdown formatting

- [x] 18: Save without formatting keybinding
  - [x] 18.1: `<C-S-s>` unless this conflicts with some existing behaviour

- [x] 19: Choose a markdown preview plugin (subsumed by render-markdown.nvim)

- [ ] 20: Test how centering page jumps feels
  - [x] 20.1: Add `zz` to `<C-d>` & `<C-u>`

- [x] 21: Find plugin that improves "f" and "t" (covered by `mini.jump`)

- [ ] 22: Parse differences between new and old maidiyi
  - [ ] 22.1: Create a list of the differences
  - [ ] 22.2: Pick ones to copy over

- [x] 23: Add UI toggles
  - [x] 23.1: Relative line numbers
  - [x] 23.2: Dark vs light colourscheme mode

- [x] 24: Fix editing file in lazygit exiting with error

## Carried over from `main` (pre-rebase todo list)

<!-- Kept with their original numbers for traceability. Dropped from `main`'s
     list as already covered: 25 (lazygit editing → task "24: Fix editing file
     in lazygit exiting with error" above, done), 26 (treesitter folding →
     implemented in the rebased config: lua/plugins/nvim-treesitter.lua). -->

- [ ] 24: Make barbar sync on commit

- [ ] 27: Investigate why Snacks.explorer can't create a directory with the same name as an existing file

- [ ] 28: Fix chainsaw markers not disappearing

- [ ] 29: Fix gitsigns not updating "sidebar" highlights

- [ ] 30: Refactor UI/Toggle keybindings
    - [ ] 30.1: Add toggle for diagnostics + spell check

- [ ] 31: Configure scratch buffer to be 80vh/vw

## To do

- [ ] 1: Learn
  - [ ] How to fold in Neovim
- [ ] 2: Star every plugin

- Some items require research before implementation (tasks 4, 11, 12)
- Consider dependencies: clipboard management (task 2) should be done before
  related keybindings (task 10.1)
- Configuration validation (task 13) can be done once core features are stable

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
