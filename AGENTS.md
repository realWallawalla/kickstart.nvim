# Agent Guidelines for kickstart.nvim

## Build/Lint/Test Commands
- **Format Lua**: `stylua .` or `stylua <file>` (runs automatically on save via conform.nvim)
- **Check formatting**: `stylua --check .`
- **Test config**: Open Neovim with `nvim` and run `:checkhealth`
- **No unit tests**: This is a Neovim configuration, not a test suite

## Code Style
- **Language**: Lua (Neovim config)
- **Indentation**: 2 spaces (enforced by stylua)
- **Line endings**: Unix (LF)
- **Quote style**: Single quotes preferred (stylua: AutoPreferSingle)
- **Function calls**: No parentheses for single-argument strings/tables where optional
- **Comments**: Use `--` for single line, `--[[ ]]` for multi-line blocks

## Naming & Structure
- **Variables**: snake_case (e.g., `local my_variable`)
- **Plugin files**: kebab-case (e.g., `neo-tree.lua`, `nvim-jdtls.lua`)
- **Modules**: Return table/function from plugin files in `lua/` directories
- **Keymaps**: Use descriptive `desc` parameter for which-key integration

## Imports & Requires
- Use `require 'module'` (no parentheses) for single string requires
- Use `require('module')` when storing result or complex paths
- Prefer lazy-loading plugins via lazy.nvim's `event`, `cmd`, `ft`, or `keys`

## Error Handling
- Minimal explicit error handling; rely on Neovim's error reporting
- Use `:checkhealth` for diagnostic information
- Validate LSP/formatter/linter availability via Mason (`:Mason`)
