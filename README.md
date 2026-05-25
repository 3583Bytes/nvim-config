# 3583Bytes Neovim Config

Neovim configuration for **3583Bytes**.

- GitHub: https://github.com/3583Bytes
- Website: https://3583Bytes.com

## Overview

At 3583Bytes, we build games with a practical engineering mindset: keep tools lean, keep iteration fast, and ship consistently. This Neovim configuration reflects that approach, combining a clean editor experience with strong project navigation and Git workflows to support day-to-day production.

Core workflow:

- File explorer and buffer sidebar via `neo-tree.nvim`
- Git change review via `diffview.nvim`
- Plugin management via `lazy.nvim`

## Included Files

- `init.lua` - main Neovim configuration
- `lazy-lock.json` - pinned plugin versions for reproducible installs

## Windows Install

1. Install Neovim and Git.
2. Clone this repo into your Neovim config path:

```powershell
git clone https://github.com/3583Bytes/nvim-config.git $env:LOCALAPPDATA\nvim
```

3. Start Neovim:

```powershell
nvim
```

4. Inside Neovim, install plugins:

```vim
:Lazy sync
```

## macOS Install

1. Install Neovim and Git.
2. Clone this repo into your Neovim config path:

```bash
git clone https://github.com/3583Bytes/nvim-config.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

4. Inside Neovim, install plugins:

```vim
:Lazy sync
```

## Linux Install

1. Install Neovim and Git.
2. Clone this repo into your Neovim config path:

```bash
git clone https://github.com/3583Bytes/nvim-config.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

4. Inside Neovim, install plugins:

```vim
:Lazy sync
```

## Default Behavior

On startup, Neovim opens:

- Neo-tree filesystem view on the left
- Neo-tree buffers view on the right

## Keymaps

- `<Space>e` - toggle filesystem tree
- `<Space>b` - toggle buffers tree
- `<Space>g` - toggle Neo-tree git status view
- `<Space>gd` - open Git diff view (`diffview.nvim`)
- `<Space>gD` - close Git diff view
- `<Space>x` - close current file buffer
- `<Space>q` - close current window
- `<Space>1` - keep only current window (`:only`)

## Quitting Neovim

When multiple windows or tabs are open, `:q` only closes the current window.

- `:qa` or `:qall` - quit all windows and tabs
- `:qa!` or `:qall!` - force quit all (discard unsaved changes)
- `:wqa` - save all, then quit all

Optional mappings:

```vim
nnoremap <leader>q :qa<CR>
nnoremap <leader>Q :qa!<CR>
```

## Neo-tree Buffers Actions

- `x` - delete selected buffer in the Neo-tree Buffers panel

## Notes

- Keep `lazy-lock.json` committed to keep plugin versions consistent across machines.
- Do not commit `%LOCALAPPDATA%\nvim-data` (plugin/cache runtime data).
