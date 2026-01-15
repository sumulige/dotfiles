-- ============================================
-- 编辑器选项
-- ============================================

local opt = vim.opt

-- 性能优化
opt.updatetime = 300        -- 更快触发 swap 写入
opt.timeoutlen = 500        -- 键映射等待时间
opt.redrawtime = 1500       -- 语法高亮重绘时间
opt.lazyredraw = true       -- 宏执行时不重绘

-- 编码
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- 行号
opt.relativenumber = true   -- 相对行号 (更方便跳转)
opt.number = true           -- 同时显示绝对行号
opt.signcolumn = "yes"      -- 始终显示符号列

-- 缩进
opt.expandtab = true        -- 用空格替代 tab
opt.shiftwidth = 2          -- 缩进 2 空格
opt.tabstop = 2             -- tab 宽度
opt.smartindent = true      -- 智能缩进

-- 搜索
opt.ignorecase = true       -- 忽略大小写
opt.smartcase = true        -- 智能大小写 (有大写字母时匹配大小写)
opt.incsearch = true        -- 增量搜索

-- 外观
opt.termguicolors = true    -- 真彩色
opt.background = "dark"     -- 深色背景
opt.cursorline = true       -- 高亮当前行
opt.scrolloff = 8           -- 上下保留 8 行
opt.sidescrolloff = 8       -- 左右保留 8 列
opt.showmode = false        -- 不显示模式 (已在状态栏显示)
opt.splitbelow = true       -- 水平分割在下方
opt.splitright = true       -- 垂直分割在右侧

-- 补全
opt.completeopt = { "menu", "menuone", "noselect" }

-- 折叠
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#fold()"
opt.foldlevel = 99          -- 默认展开所有折叠

-- 剪贴板
opt.clipboard = "unnamedplus" -- 使用系统剪贴板

-- 鼠标
opt.mouse = "a"             -- 所有模式支持鼠标
opt.mousescroll = { "ver:3", "hor:6" }

-- 持久化撤销
opt.undofile = true

-- 命令行
opt.cmdheight = 1           -- 命令行高度
opt.showcmd = true          -- 显示输入的命令
opt.wildmode = "longest:full,full"
opt.pumheight = 10          -- 补全菜单高度

-- 其他
opt.confirm = true          -- 保存前确认
opt.backspace = "indent,eol,start"
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- 全局变量
vim.g.mapleader = " "
vim.g.maplocalleader = " "
