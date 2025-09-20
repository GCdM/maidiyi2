# Neovim Configuration TODO

This document outlines suggested improvements and enhancements for the current Neovim configuration.

## High Priority Issues

## Medium Priority Enhancements

### 1. Add Completion Engine
**Missing**: Code completion functionality

**Suggestion**: Add `nvim-cmp` with appropriate sources:
- `cmp-nvim-lsp` - LSP completions
- `cmp-buffer` - Buffer completions
- `cmp-path` - File path completions
- `cmp-cmdline` - Command line completions

### 2. Enhanced Git Integration
**Current**: Only has lazygit integration via snacks.nvim

**Suggestions**:
- Add `gitsigns.nvim` for git diff indicators in sign column
- Add more git-related keymaps and workflows
- Consider `diffview.nvim` for better diff viewing

### 3. Session Management
**Missing**: Session persistence and restoration

**Suggestion**: Add session management plugin like:
- `auto-session` - Automatic session management
- `persistence.nvim` - Simple session management
- Or implement custom session handling

## Low Priority Improvements

### 4. Project-Specific Configuration
**Missing**: Per-project settings and configurations

**Suggestions**:
- Add `.nvim.lua` or `.nvimrc` support for project-specific settings
- Implement project-specific LSP configurations
- Add project-specific keymaps or commands

### 5. Enhanced Autocommands
**Current**: Only has basic highlight on yank

**Suggestions**:
- Auto-create directories when saving files
- Format on save for specific filetypes
- Auto-resize windows on terminal resize
- Remember cursor position when reopening files

### 6. Additional Language Support
**Current**: Limited language server configuration

**Suggestions**:
- Uncomment and configure additional LSP servers (Python, Rust, Go, C++)
- Add language-specific formatting and linting rules
- Configure DAP (Debug Adapter Protocol) for debugging

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
