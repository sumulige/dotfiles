-- ============================================
-- 键映射
-- ============================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================
-- 空格 + 键 = 快捷键前缀
-- ============================================

-- 窗口导航
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>=", "<C-w>=", opts)  -- 均分窗口

-- 缓冲区导航
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- 文件操作
map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)

-- 搜索
map("n", "<leader>/", ":nohlsearch<CR>", opts)  -- 清除高亮

-- ============================================
-- 实用快捷键
-- ============================================

-- 快速保存 (类似 IDE 的 Ctrl+S)
map("n", "<C-s>", ":write<CR>", opts)
map("i", "<C-s>", "<C-o>:write<CR>", opts)

-- 快速退出
map("n", "<C-q>", ":quit<CR>", opts)

-- 保持选择区
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- 移动行 (visual 模式)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- J/K 移动时保持光钉在中间
map("n", "J", "mzJ`z", opts)

-- ============================================
-- 系统剪贴板
-- ============================================

map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+yg_', opts)
map("n", "<leader>y", '"+y', opts)
map("n", "<leader>yy", '"+yy', opts)

map("v", "<leader>d", '"+d', opts)
map("n", "<leader>d", '"+d', opts)
map("n", "<leader>dd", '"+dd', opts)

map("n", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)

-- ============================================
-- 辅助功能
-- ============================================

-- 快速访问配置
map("n", "<leader>ev", ":e ~/Documents/dotfiles/nvim/init.lua<CR>", opts)

-- 重新加载配置
map("n", "<leader>sv", ":source ~/Documents/dotfiles/nvim/init.lua<CR>", opts)

-- 行首/行尾
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- 跳转到列表开头/结尾
map("n", "<M-h>", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<M-l>", ":BufferLineGoToBuffer -1<CR>", opts)
