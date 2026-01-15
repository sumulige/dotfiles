# Personal Dotfiles

> AI 驱动的个人开发环境配置 - Personal Panopticon

让 AI 成为你思维的延伸——在你睡觉时它仍在工作，在你忘记时它还记得，当你困惑时它已理清。

---

## 项目概览

**核心理念**: Personal Panopticon - 数据主权反转，让你看见自己

**特点**:
- ⚡ **极速启动**: Zsh 启动时间 ~127ms
- 🤖 **AI 自治**: Claude Code 深度集成，自动化记忆和任务管理
- 📚 **完整文档**: 每个配置都有详细说明
- 🔄 **可追溯**: 所有决策和变更都有记录

---

## 目录结构

```
dotfiles/
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
├── development/               # 开发任务管理
│   └── todos/                 # 任务追踪系统
├── git/                       # Git 配置
├── iterm2/                    # iTerm2 配置 ✅
│   ├── OneDarkPro.json        # 动态 Profile
│   ├── OneDarkPro.itermcolors # 颜色主题（散光优化）
│   ├── CONFIG.md              # 配置文档
│   └── README.md              # 使用说明
├── prompts/                   # Prompt 教学库
├── zsh/                       # Zsh 配置 ✅
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

### 1. 克隆仓库

```bash
git clone https://github.com/sumulige/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles
```

### 2. 安装依赖

```bash
# 必需工具
brew install zimfw atuin zoxide direnv eza bat ripgrep fzf lazygit

# 字体
brew install --cask font-jetbrains-mono-nerd-font
```

### 3. 链接配置

```bash
# Zsh
ln -sf ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/zsh/.zimrc ~/.zimrc

# Git
ln -sf ~/Documents/dotfiles/git/.gitconfig ~/.gitconfig
```

### 4. 配置 iTerm2

1. 打开 iTerm2 → Settings → Profiles
2. 点击 "Other Actions..." → "Import JSON Profiles..."
3. 选择 `iterm2/OneDarkPro.json`
4. 设置为默认 Profile

### 5. 初始化 Zim

```bash
# 重启终端后运行
zimfw install
```

### 6. 配置 atuin (可选)

```bash
atuin register
atuin import zsh
```

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
| `project-paradigm.md` | Personal Panopticon 开发范式 |
| `iterm2/CONFIG.md` | iTerm2 完整配置指南 |
| `zsh/docs/ZSH.md` | Zsh + Zim fw 配置概述 |
| `zsh/docs/atuin.md` | Shell 历史管理指南 |
| `zsh/docs/zoxide.md` | 智能目录跳转指南 |
| `zsh/docs/direnv.md` | 项目环境管理指南 |

---

## 常见问题

### Q: 如何添加新的 zsh 插件？
A: 编辑 `~/.zimrc`，添加 `zmodule <plugin-name>`，然后运行 `zimfw install`

### Q: 如何自定义 iTerm2 主题？
A: 编辑 `iterm2/OneDarkPro.json` 中的颜色值，然后重新导入 Profile

### Q: 如何查看项目历史？
A: 查看 `.claude/PROJECT_LOG.md` 获取完整历史记录

---

## 许可证

MIT

---

**最后更新**: 2026-01-16
**维护者**: sumulige + Claude (Opus 4.5)
