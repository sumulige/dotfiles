-- ============================================
-- 自动命令 (autocmds)
-- ============================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ============================================
-- 通用设置
-- ============================================
local general = augroup("GeneralSettings", { clear = true })

-- 高亮 yanked 文本
autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- 自动切换目录到当前文件
autocmd("BufEnter", {
  group = general,
  pattern = "*",
  callback = function()
    local dir = vim.fn.expand("%:p:h")
    if dir ~= vim.fn.getcwd() then
      vim.cmd("lcd " .. dir)
    end
  end,
})

-- 自动保存视图
autocmd("BufWinLeave", {
  group = general,
  pattern = "?*",
  callback = function()
    vim.cmd("silent! mkview")
  end,
})

autocmd("BufWinEnter", {
  group = general,
  pattern = "?*",
  callback = function()
    vim.cmd("silent! loadview")
  end,
})

-- ============================================
-- 文件类型设置
-- ============================================
local filetype = augroup("FiletypeSettings", { clear = true })

-- Markdown
autocmd("FileType", {
  group = filetype,
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})

-- Git 相关
autocmd("FileType", {
  group = filetype,
  pattern = { "gitcommit", "gitrebase" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- ============================================
-- 通用设置 (Neovim 0.9+ 风格)
-- ============================================

-- 新建行时自动添加注释续行
vim.opt.formatoptions:remove("o")
vim.opt.formatoptions:append("r")
vim.opt.formatoptions:append("n")

-- ============================================
-- 终端设置
-- ============================================
autocmd("TermOpen", {
  group = general,
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- ============================================
-- 快捷退出
-- ============================================
autocmd("FileType", {
  group = general,
  pattern = { "qf", "help", "man", "lspinfo", "git" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
