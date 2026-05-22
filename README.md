# 3583Bytes Neovim Config

Neovim configuration for **3583Bytes**.

- GitHub: https://github.com/3583Bytes
- Website: https://3583Bytes.com

## Overview

This config is a clean, minimal Neovim setup focused on:

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
git clone https://github.com/3583Bytes/<repo-name>.git $env:LOCALAPPDATA\nvim
```

3. Start Neovim:

```powershell
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

## Notes

- Keep `lazy-lock.json` committed to keep plugin versions consistent across machines.
- Do not commit `%LOCALAPPDATA%\nvim-data` (plugin/cache runtime data).
