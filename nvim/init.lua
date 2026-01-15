-- ============================================
-- Neovim 配置 - 2025 版
-- ============================================
-- 极简 · 极速 · 现代化

-- 引导 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 加载配置模块
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 设置插件
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,  -- 延迟加载所有插件
    version = false, -- 使用最新的 git commit
  },
  install = {
    colorscheme = { "habamax" },
  },
  performance = {
    rtp = {
      -- 禁用不需要的内置插件
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
  },
})
