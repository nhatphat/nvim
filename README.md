# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## 🎨 Custom Configurations

### Keymaps (`lua/config/keymaps.lua`)

#### Comment Toggle
- **`Ctrl + ,`**: Toggle comment in normal, visual, and insert modes
  - Normal mode: Comments current line
  - Visual mode: Comments selected lines
  - Insert mode: Comments current line and returns to insert mode

#### Save All Files
- **`Cmd + S`**: Save all modified files (`:wall`)
  - Normal mode: Saves all files
  - Insert mode: Saves and returns to insert mode at cursor position
  - Visual mode: Saves and restores visual selection

### Python LSP (`lua/plugins/python_lsp.lua`)

- **Pyright Configuration**:
  - Auto-detects `.venv` or `venv` directories for Python path
  - Type checking mode: `basic`
  - Filtered diagnostics: `reportAttributeAccessIssue` is disabled
  - Add more ignored diagnostics in the `ignored_diagnostics` table

### Autocmds (`lua/config/autocmds.lua`)

- **Auto-save**: Disabled (previously saved on `InsertLeave` and `TextChanged`)
  - Now using manual `Cmd+S` save instead
