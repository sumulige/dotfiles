# Neovim 配置

> 极简 · 极速 · 现代化的 Neovim 配置

---

## 特性

- ⚡ **Lazy.nvim** - 延迟加载，启动迅速
- 🌳 **Treesitter** - 现代语法高亮
- 🔍 **FZF** - 使用你已有的 fzf-rigrep 进行搜索
- 🤖 **LSP** - 完整的语言服务器支持
- 💬 **Completion** - 智能补全
- 🎨 **UI** - 美观的状态栏和缓冲区标签

---

## 安装

```bash
# 链接配置
ln -sf ~/Documents/dotfiles/nvim ~/.config/nvim

# 首次启动 Neovim
nvim
```

首次启动会自动安装所有插件。

---

## 快捷键

| 快捷键 | 功能 |
|--------|------|
| `<Space>` | 键前缀 |
| `<Space>ff` | 查找文件 |
| `<Space>fg` | 搜索文本 |
| `<Space>fb` | 缓冲区列表 |
| `<Space>fc` | 命令列表 |
| `<Space>tt` | 浮动终端 |
| `<Space>ev` | 编辑配置 |
| `<Space>sv` | 重载配置 |
| `gd` | 跳转定义 |
| `K` | 文档悬浮 |
| `<Space>rn` | 重命名 |
| `<Space>ca` | 代码操作 |

---

## LSP 支持

- Go (gopls)
- Python (pyright)
- TypeScript/JavaScript (ts_ls)
- Lua (lua_ls)
- Rust (rust_analyzer)
- C/C++ (clangd)

---

## 文件结构

```
nvim/
├── init.lua              # 入口文件
├── lua/
│   ├── config/           # 配置模块
│   │   ├── options.lua   # 编辑器选项
│   │   ├── keymaps.lua   # 键映射
│   │   └── autocmds.lua  # 自动命令
│   └── plugins/          # 插件配置
│       ├── core.lua      # 核心插件
│       ├── lsp.lua       # LSP + 补全
│       └── ui.lua        # UI 插件
└── README.md
```
