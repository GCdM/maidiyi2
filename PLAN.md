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
  - [x] 13.2: Add validation for plugin configurations on startup

- [x] 16: Configure dprint for markdown formatting

- [x] 18: Save without formatting keybinding
  - [x] 18.1: `<C-S-s>` unless this conflicts with some existing behaviour

- [x] 19: Choose a markdown preview plugin (subsumed by render-markdown.nvim)

- [x] 20: Test how centering page jumps feels
  - [x] 20.1: Add `zz` to `<C-d>` & `<C-u>`

- [x] 21: Find plugin that improves "f" and "t" (covered by `mini.jump`)

- [x] 22: Parse differences between new and old maidiyi
  - [x] 22.1: Create a list of the differences
  - [x] 22.2: Pick ones to copy over

- [x] 23: Add UI toggles
  - [x] 23.1: Relative line numbers
  - [x] 23.2: Dark vs light colourscheme mode

- [x] 24: Fix editing file in lazygit exiting with error

- [x] 25: File search includes directories it shouldn't e.g. node_modules or
      .git/.worktrees

- [x] 26: Remove markdown renderer

- [x] 27: typescript language server needs to be configured correctly. Pick a
      modern, fast, and robust implementation

- [x] 28: Ctrl+d (or +u) are moving weirdly, especially on first click. Change
      to center cursor with zz first before moving

- [x] 29: LSP reference not working for TanStack start. Searching for all
      references of a symbol is finding none when they are imported with paths
      starting with '#'

## Carried over from `main` (pre-rebase todo list)

<!-- Kept with their original numbers for traceability. Dropped from `main`'s
     list as already covered: 25 (lazygit editing → task "24: Fix editing file
     in lazygit exiting with error" above, done), 26 (treesitter folding →
     implemented in the rebased config: lua/plugins/nvim-treesitter.lua). -->

- [ ] 24: Make barbar sync on commit

- [ ] 27: Investigate why Snacks.explorer can't create a directory with the same
      name as an existing file

- [ ] 28: Fix chainsaw markers not disappearing

- [ ] 29: Fix gitsigns not updating "sidebar" highlights

- [ ] 30: Refactor UI/Toggle keybindings
  - [ ] 30.1: Add toggle for diagnostics + spell check

- [ ] 31: Configure scratch buffer to be 80vh/vw

## To do

- [ ] 1: Learn
  - [ ] How to fold in Neovim
- [ ] 2: Star every plugin
