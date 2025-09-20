# Neovim Configuration TODO

This document outlines suggested improvements and enhancements for the current Neovim configuration.

## High Priority Issues

## Medium Priority Enhancements

### 2. Enhanced Git Integration
**Current**: Only has lazygit integration via snacks.nvim

**Suggestions**:
- Add `gitsigns.nvim` for git diff indicators in sign column
- Add more git-related keymaps and workflows
- Consider `diffview.nvim` for better diff viewing

## Low Priority Improvements

### 5. Enhanced Autocommands
**Current**: Only has basic highlight on yank

**Suggestions**:
- Format on save for specific filetypes
- Auto-resize windows on terminal resize
- Remember cursor position when reopening files

### 7. Performance Optimizations
**Potential Areas**:
- Lazy load more plugins based on filetypes
- Optimize startup time with lazy loading strategies
- Review and optimize plugin configurations

## File Structure Improvements

### 8. Better Organization
**Suggestions**:
- Consider splitting large plugin configurations into separate files
- Add documentation comments to configuration files
- Create consistent naming conventions for plugin files

### 9. Configuration Validation
**Missing**: Validation of configuration settings

**Suggestions**:
- Add checks for required tools/binaries
- Validate plugin configurations on startup
- Add health checks for custom configurations

## Documentation

### 10. Add Configuration Documentation
**Missing**: Documentation for custom configurations and keymaps

**Suggestions**:
- Create `KEYMAPS.md` documenting all custom keymaps
- Add inline documentation for complex configurations
- Document custom functions and their purposes

### 11. Diagnose Why Lazy Starts Unfocused
**Problem**: When opening neovim and lazy auto installs new packages
the cursor starts in the background.

**Suggestions**:
- Search the web for similar reports

### 12. Allow "Scrolling" With Cursor off screen
**Problem**: Scrolling w/ <C-e> and <C-y> moves the cursor as
it reaches the boundaries.

### 13. Fix Window Clash Issues
**Problem**: Opening terminal clashes with opening explorer.

**Suggestions**:
- Both terminal and explorer are from snacks modules, so there
should be a way to make them not clash.

## Completed ✅

- ✅ Complete Mini.lua Configuration (added autopairs, surround, textobjects, bracketed navigation, and icons)
- ✅ Fix Directory Path Configuration (backup/undo paths corrected with auto-creation)
- ✅ LSP Configuration (migrated to nvim-lspconfig with proper root_markers format)
- ✅ Treesitter Configuration (syntax highlighting and indentation)
- ✅ Keymap duplication cleanup
- ✅ Plugin architecture modernization
- ✅ Custom LSP configuration integration

## Notes

- Most issues are minor optimizations rather than fundamental problems
- Current configuration is solid and follows modern best practices
- Focus on high priority issues first for maximum impact
- Consider your personal workflow when implementing enhancements
