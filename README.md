# Personal Dotfiles

> AI 驱动的个人开发环境配置 - Personal Panopticon

让 AI 成为你思维的延伸——在你睡觉时它仍在工作，在你忘记时它还记得，当你困惑时它已理清。

---

## 项目概览

**核心理念**: Personal Panopticon - 数据主权反转，让你看见自己

**特点**:
- ⚡ **极速启动**: Zsh 启动时间 ~127ms
- 🤖 **AI 自治**: Claude Code 深度集成，自动化记忆和任务管理
- 📦 **一键安装**: `./install.sh full` 自动化环境搭建
- 📚 **完整文档**: 每个配置都有详细说明
- 🔄 **可追溯**: 所有决策和变更都有记录

---

## 目录结构

```
dotfiles/
├── install.sh                 ⚡ 一键安装脚本
├── .claude/                    # AI 自治记忆系统核心 ⭐
│   ├── ANCHORS.md             # 技能锚点索引
│   ├── CLAUDE.md              # AI 协作配置
│   ├── MEMORY.md              # 增量记忆日志
│   ├── PROJECT_LOG.md         # 项目构建历史
│   ├── PROJECT_KICKOFF.md     # 项目启动清单
│   ├── TASK_PLAN.md           # 任务执行计划
│   ├── PROJECT_PROPOSAL.md    # 项目计划书
│   ├── hooks/                 # 自动化钩子 (10个)
│   ├── skills/                # 技能库
│   └── thinking-routes/       # 思维轨迹系统
├── brew/                       # Homebrew 包管理 ⚡
│   ├── Brewfile.core          # 核心包 (Shell, Git, 编辑器)
│   └── Brewfile.tools         # 工具包 (开发工具, 监控, AI)
├── nvim/                       # Neovim 配置 ⚡
│   ├── init.lua               # 主配置
│   ├── lua/config/            # 配置模块
│   └── lua/plugins/           # 插件配置
├── development/               # 开发任务管理
│   └── todos/                 # 任务追踪系统
├── git/                       # Git 配置
├── ghostty/                   # Ghostty 终端配置 ✅
│   ├── config                 # 主配置（AI 编程优化）
│   ├── themes/                # 自定义主题
│   └── README.md              # 使用说明
├── iterm2/                    # iTerm2 配置 ✅
│   ├── OneDarkPro.json        # 动态 Profile
│   ├── OneDarkPro.itermcolors # 颜色主题（散光优化）
│   ├── CONFIG.md              # 配置文档
│   └── README.md              # 使用说明
├── starship/                  # Starship 提示符配置 ✅
│   └── starship.toml          # 极简提示符
├── prompts/                   # Prompt 教学库
├── zsh/                       # Zsh 配置 ✅ (Starship + 懒加载优化)
│   ├── .zshrc                 # Zsh 主配置
│   ├── .zimrc                 # Zim 模块配置
│   └── docs/                  # Zsh 文档
│       ├── ZSH.md             # 配置概述
│       ├── atuin.md           # 历史管理指南
│       ├── zoxide.md          # 目录跳转指南
│       └── direnv.md          # 环境管理指南
├── project-paradigm.md        # 项目开发范式
└── README.md                  # 本文件
```

---

## 快速开始

### 方式 1: 一行命令 (推荐)

```bash
curl -fsSL https://raw.githubusercontent.com/sumulige/dotfiles/master/install-remote.sh | bash
```

### 方式 2: Homebrew

```bash
brew tap sumulige/tap
brew install sumulige-dotfiles
sumulige-dotfiles full
```

### 方式 3: npm / npx

```bash
npx @sumulige/dotfiles
# 或
npm install -g @sumulige/dotfiles && sumulige-dotfiles
```

### 方式 4: 手动克隆

```bash
git clone https://github.com/sumulige/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles
./install.sh full
```

### 安装层级

```bash
./install.sh core   # 核心包 (Shell, Git, 编辑器, 基础工具)
./install.sh tools  # 核心 + 工具包 (语言工具, 监控, AI)
./install.sh full   # 完整安装 (含配置链接, Zim 初始化)
./install.sh sync   # 仅同步配置 (已安装后更新)
```

### 手动安装

如果偏好手动控制：

```bash
# 安装 Homebrew (如果未安装)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安装核心包
brew bundle --file=brew/Brewfile.core

# 安装工具包 (可选)
brew bundle --file=brew/Brewfile.tools

# 链接配置文件
ln -sf ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/zsh/.zimrc ~/.zimrc
ln -sf ~/Documents/dotfiles/git/.gitconfig ~/.gitconfig

# 初始化 Zim
zimfw install
```

### 配置 iTerm2

1. 打开 iTerm2 → Settings → Profiles
2. 点击 "Other Actions..." → "Import JSON Profiles..."
3. 选择 `iterm2/OneDarkPro.json`
4. 设置为默认 Profile

### 配置 atuin (可选)

```bash
atuin register
atuin import zsh
```

---

## Neovim 配置

本仓库包含现代化的 Neovim 配置（基于 Lua + lazy.nvim）。

### 安装

```bash
# 一键安装已包含 nvim 配置链接
./install.sh full

# 或手动链接
ln -sf ~/Documents/dotfiles/nvim ~/.config/nvim
```

### 首次启动

```bash
nvim
```

首次启动会自动：
- 克隆所有插件（lazy.nvim）
- 安装 Treesitter 解析器
- 配置 LSP 服务器

### 快捷键

| 快捷键 | 功能 |
|--------|------|
| `<Space>ff` | 查找文件 |
| `<Space>fg` | 搜索文本 |
| `<Space>fb` | 缓冲区列表 |
| `<Space>tt` | 浮动终端 |
| `<Space>ca` | 代码操作 |
| `gd` | 跳转定义 |
| `K` | 文档悬浮 |

### 支持的语言

- Go (gopls)
- Python (pyright)
- TypeScript/JavaScript (ts_ls)
- Lua (lua_ls)
- Rust (rust_analyzer)
- C/C++ (clangd)

[查看 Neovim 完整文档](nvim/README.md)

---

## 现代工具集成

| 工具 | 用途 | 命令 |
|------|------|------|
| **atuin** | 命令历史搜索 | `Ctrl+R` |
| **zoxide** | 智能目录跳转 | `z <keyword>` |
| **direnv** | 自动环境加载 | `cd <project>` |
| **eza** | 现代 ls | `ll`, `lt` |
| **bat** | 现代 cat | `cat <file>` |
| **ripgrep** | 快速搜索 | `rg <pattern>` |
| **fzf** | 模糊查找 | 集成到各种工具 |
| **lazygit** | Git TUI | `lg` |

---

## Homebrew 管理

### 分层包管理

| 文件 | 包数量 | 说明 |
|------|--------|------|
| `Brewfile.core` | 32 | 核心包 (每日使用) |
| `Brewfile.tools` | ~20 | 工具包 (开发增强) |

### 安装命令

```bash
# 安装核心包
brew bundle --file=brew/Brewfile.core

# 安装工具包
brew bundle --file=brew/Brewfile.tools

# 检查是否缺少包
brew bundle --file=brew/Brewfile.core check

# 清理未列出的包
brew bundle --file=brew/Brewfile.core cleanup
```

### 维护命令

```bash
# 检查过期包
brew outdated

# 升级所有包
brew upgrade

# 清理缓存
brew cleanup
```

### 性能优化

已配置 `HOMEBREW_NO_AUTO_UPDATE=1`，brew 命令响应时间从 5-10秒 降至 ~1秒。

---

## 演示

### 终端录制

本项目包含终端功能演示录制，可以本地播放查看真实效果：

```bash
# 安装 asciinema
brew install asciinema

# 播放演示
asciinema play development/tests/demo.cast
```

**演示内容**:
- Shell 启动时间实测
- 现代工具版本信息
- 文件列表、语法高亮、快速搜索演示
- AI 记忆系统展示

[查看更多演示文档](development/tests/DEMO.md)

---

## 性能指标

| 指标 | 数值 | 状态 |
|------|------|------|
| Zsh 启动时间 | ~127ms | ✅ |
| 钩子执行时间 | <2s | ✅ |
| 文档覆盖率 | ~80% | 🔄 |

---

## 项目管理

### Manus Kickoff 工作流

本项目使用 Manus 风格的项目启动流程：

1. **PROJECT_KICKOFF.md** - 项目启动清单
2. **TASK_PLAN.md** - 任务执行计划
3. **PROJECT_PROPOSAL.md** - 完整项目计划书

### 记忆系统

- **MEMORY.md** - 增量记忆日志
- **PROJECT_LOG.md** - 完整构建历史
- **ANCHORS.md** - 快速索引

---

## 文档索引

| 文档 | 描述 |
|------|------|
| `nvim/README.md` | Neovim 配置完整文档 |
| `project-paradigm.md` | Personal Panopticon 开发范式 |
| `iterm2/CONFIG.md` | iTerm2 完整配置指南 |
| `zsh/docs/ZSH.md` | Zsh + Zim fw 配置概述 |
| `zsh/docs/atuin.md` | Shell 历史管理指南 |
| `zsh/docs/zoxide.md` | 智能目录跳转指南 |
| `zsh/docs/direnv.md` | 项目环境管理指南 |

---

## 常见问题

### Q: 新电脑如何快速搭建环境？
A: 运行 `git clone https://github.com/sumulige/dotfiles.git ~/Documents/dotfiles && cd ~/Documents/dotfiles && ./install.sh full`

### Q: 如何添加新的 Homebrew 包？
A: 编辑 `brew/Brewfile.core` (核心包) 或 `brew/Brewfile.tools` (工具包)，然后运行 `brew bundle --file=brew/Brewfile.core`

### Q: 如何添加新的 zsh 插件？
A: 编辑 `~/.zimrc`，添加 `zmodule <plugin-name>`，然后运行 `zimfw install`

### Q: 如何添加 Neovim 插件？
A: 编辑 `nvim/lua/plugins/` 下的文件，添加插件配置。详见 [nvim/README.md](nvim/README.md)

### Q: 如何自定义 iTerm2 主题？
A: 编辑 `iterm2/OneDarkPro.json` 中的颜色值，然后重新导入 Profile

### Q: 如何查看项目历史？
A: 查看 `.claude/PROJECT_LOG.md` 获取完整历史记录

---

## 许可证

MIT

---

**最后更新**: 2026-01-27
**维护者**: sumulige + Claude (Opus 4.5)
