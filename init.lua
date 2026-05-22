vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Recommended by Neo-tree to avoid netrw conflicts.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sources = { "filesystem", "buffers", "git_status" },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "left",
        width = 36,
        mappings = {
          ["<space>"] = "none",
        },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal left<cr>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>g", "<cmd>Neotree toggle git_status float<cr>", { desc = "Git Status (Neo-tree)" })
vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle buffers right<cr>", { desc = "Buffers (Neo-tree)" })
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git Diff View" })
vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Close Git Diff View" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if #vim.api.nvim_list_uis() == 0 then
      return
    end
    vim.schedule(function()
      vim.cmd("Neotree filesystem reveal left")
      vim.cmd("Neotree buffers right")
    end)
  end,
})
