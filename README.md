# Neovim Config

This Neovim setup is built on top of [LazyVim](https://github.com/LazyVim/LazyVim) with additional customizations for daily development workflows.

## Overview

- Base distribution: `LazyVim`
- Plugin manager: `lazy.nvim`
- Current colorscheme: `gruvbox`
- Enabled extra modules in `lazyvim.json`:
  - `ai.copilot`
  - `ai.sidekick`
  - `lang.docker`
  - `lang.go`
  - `lang.helm`
  - `lang.json`
  - `lang.markdown`
  - `lang.rust`
  - `lang.terraform`
  - `lang.toml`
  - `lang.typescript`
  - `lang.yaml`

## Main Customizations

### 1. Keymaps (`lua/config/keymaps.lua`)

- `Ctrl + ,`
  - Normal: toggle comment for the current line
  - Visual: toggle comment for the selected range
  - Insert: comment the current line and return to insert mode
- `Cmd + S`
  - Save all open files with `:wall`
  - Supported in normal, insert, and visual mode
- `Backspace` in normal mode
  - Remapped to `Ctrl + o` to jump back in the jumplist
- `Ctrl + /`
  - Normal/Insert/Visual: open `Snacks.terminal` in the current working directory
  - Terminal mode: close the terminal window
- `Enter` when an LSP attaches to the buffer
  - Open definitions with `Snacks.picker.lsp_definitions()`
  - Automatically fall back to references if no definitions are found
- `Alt + Enter` when an LSP attaches to the buffer
  - Open implementations
- `Tab` (`lua/plugins/sidekick.lua`)
  - In Sidekick, prefer jumping to or applying the next edit via `nes_jump_or_apply()`

### 2. UI And Navigation

#### Colorscheme (`lua/plugins/colorscheme.lua`)

- Uses `gruvbox` as the default colorscheme

#### Dashboard (`lua/plugins/dashboard.lua`)

- Replaces the default `snacks.nvim` dashboard header with a custom ASCII header
- Current sections:
  - `Keymaps`
  - `Projects`
  - `Startup`

#### Snacks Picker (`lua/plugins/snacks.lua`)

- Enables image support
- Pickers for `files`, `grep`, `grep_word`, `grep_buffers`, and `explorer` all show hidden files
- `files` and all `grep*` sources use `ignored = true` so ignored files can still be searched
- Excludes common noisy folders and files:
  - `.git`
  - `node_modules`
  - `.venv`, `venv`
  - `__pycache__`
  - `.pytest_cache`, `.mypy_cache`, `.ruff_cache`, `.tox`
  - `*.egg-info`, `.eggs`
  - `.ipynb_checkpoints`, `htmlcov`, `.hypothesis`
  - `.idea`, `.vscode`, `.DS_Store`

### 3. Git (`lua/plugins/gitsigns.lua`)

- Enables `current_line_blame`
- Shows inline blame after `1000ms`
- Blame format: `<author>, <author_time:%R> - <summary>`

