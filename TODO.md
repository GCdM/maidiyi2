# Neovim Configuration TODO

This document outlines suggested improvements and enhancements for the current Neovim configuration.

## High Priority Issues

### 1. Fix Directory Path Configuration
**File**: `lua/config/vim.lua:22-23`

**Issue**: Backup and undo directory paths are swapped and may not exist.

```lua
-- Current (incorrect):
vim.opt.undodir = os.getenv('HOME') .. '/.vim/backup'
vim.opt.backupdir = os.getenv('HOME') .. '/.vim/undo'

-- Should be:
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undo'
vim.opt.backupdir = os.getenv('HOME') .. '/.vim/backup'
```

**Additional**: Ensure these directories exist or are created automatically.

### 2. Fix LSP Custom Configuration Format
**File**: `lsp/lua_ls.lua:4-11`

**Issue**: Uses `root_markers` format but nvim-lspconfig expects `root_dir` function.

```lua
-- Current:
root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', '.git' }

-- Should be:
root_dir = function(fname)
  return vim.fs.root(fname, { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', '.git' })
end
```

### 3. Complete or Remove Mini.lua
**File**: `lua/plugins/mini.lua`

**Issue**: Contains only comments, no actual implementation.

**Options**:
- Remove the file entirely if not needed
- Implement autopairs functionality
- Add other mini.nvim modules (buffers, move, etc.)

## Medium Priority Enhancements

### 4. Add Completion Engine
**Missing**: Code completion functionality

**Suggestion**: Add `nvim-cmp` with appropriate sources:
- `cmp-nvim-lsp` - LSP completions
- `cmp-buffer` - Buffer completions
- `cmp-path` - File path completions
- `cmp-cmdline` - Command line completions

### 5. Enhanced Git Integration
**Current**: Only has lazygit integration via snacks.nvim

**Suggestions**:
- Add `gitsigns.nvim` for git diff indicators in sign column
- Add more git-related keymaps and workflows
- Consider `diffview.nvim` for better diff viewing

### 6. Session Management
**Missing**: Session persistence and restoration

**Suggestion**: Add session management plugin like:
- `auto-session` - Automatic session management
- `persistence.nvim` - Simple session management
- Or implement custom session handling

## Low Priority Improvements

### 7. Project-Specific Configuration
**Missing**: Per-project settings and configurations

**Suggestions**:
- Add `.nvim.lua` or `.nvimrc` support for project-specific settings
- Implement project-specific LSP configurations
- Add project-specific keymaps or commands

### 8. Enhanced Autocommands
**Current**: Only has basic highlight on yank

**Suggestions**:
- Auto-create directories when saving files
- Format on save for specific filetypes
- Auto-resize windows on terminal resize
- Remember cursor position when reopening files

### 9. Additional Language Support
**Current**: Limited language server configuration

**Suggestions**:
- Uncomment and configure additional LSP servers (Python, Rust, Go, C++)
- Add language-specific formatting and linting rules
- Configure DAP (Debug Adapter Protocol) for debugging

### 10. Performance Optimizations
**Potential Areas**:
- Lazy load more plugins based on filetypes
- Optimize startup time with lazy loading strategies
- Review and optimize plugin configurations

## File Structure Improvements

### 11. Better Organization
**Suggestions**:
- Consider splitting large plugin configurations into separate files
- Add documentation comments to configuration files
- Create consistent naming conventions for plugin files

### 12. Configuration Validation
**Missing**: Validation of configuration settings

**Suggestions**:
- Add checks for required tools/binaries
- Validate plugin configurations on startup
- Add health checks for custom configurations

## Documentation

### 13. Add Configuration Documentation
**Missing**: Documentation for custom configurations and keymaps

**Suggestions**:
- Create `KEYMAPS.md` documenting all custom keymaps
- Add inline documentation for complex configurations
- Document custom functions and their purposes

## Completed ✅

- ✅ LSP Configuration (migrated to nvim-lspconfig)
- ✅ Treesitter Configuration (syntax highlighting and indentation)
- ✅ Keymap duplication cleanup
- ✅ Plugin architecture modernization
- ✅ Custom LSP configuration integration

## Notes

- Most issues are minor optimizations rather than fundamental problems
- Current configuration is solid and follows modern best practices
- Focus on high priority issues first for maximum impact
- Consider your personal workflow when implementing enhancements