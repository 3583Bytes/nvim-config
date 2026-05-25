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
- `scripts/install-neovim-context-menu.ps1` - installs/removes Windows Explorer context menu entries for Neovim

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

## Windows Context Menu (Optional)

This repo includes a script to add right-click options for opening files/folders in Neovim from Windows Explorer.

Install entries:

```powershell
.\scripts\install-neovim-context-menu.ps1
```

Remove entries:

```powershell
.\scripts\install-neovim-context-menu.ps1 -Uninstall
```

Use a specific Neovim path:

```powershell
.\scripts\install-neovim-context-menu.ps1 -NvimExe "C:\Program Files\Neovim\bin\nvim.exe"
```

## macOS Finder Context Menu (Optional)

On macOS, the Finder equivalent is a Quick Action created in Automator.

1. Open `Automator`.
2. Choose `New Document` -> `Quick Action`.
3. Set `Workflow receives current` to `files or folders`.
4. Set `in` to `Finder`.
5. Add `Run AppleScript`.
6. Paste:

```applescript
on run {input, parameters}
	tell application "Terminal"
		activate
		repeat with i in input
			set p to POSIX path of i
			do script "nvim " & quoted form of p
		end repeat
	end tell
	return input
end run
```

7. Save as `Open with Neovim`.
8. In Finder, right-click a file or folder and run `Quick Actions` -> `Open with Neovim`.

Note: Finder usually only shows this on selected files/folders, not when right-clicking empty folder background.

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
