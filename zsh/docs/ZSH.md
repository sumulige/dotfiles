# Zsh 配置文档

> 极致性能 + 最大开发便利的 Zsh 配置
>
> 最后更新: 2025-01-15

## 目录

1. [配置概览](#配置概览)
2. [框架选择](#框架选择)
3. [工具集](#工具集)
4. [文件结构](#文件结构)
5. [安装指南](#安装指南)
6. [故障排查](#故障排查)

---

## 配置概览

### 设计目标

- **极致性能**: Shell 启动时间 <50ms
- **开发便利**: 现代工具集成，减少重复操作
- **完美主义**: 每个配置都有明确目的和文档

### 核心组件

| 组件 | 作用 | 状态 |
|------|------|------|
| **Zim fw** | 高性能 Zsh 框架 | ✅ 使用中 |
| **Powerlevel10k** | 快速主题引擎 | ✅ 使用中 |
| **atuin** | 命令历史管理 | ✅ 已集成 |
| **zoxide** | 智能目录跳转 | ✅ 已集成 |
| **direnv** | 项目环境管理 | ✅ 已集成 |

---

## 框架选择

### 为什么选择 Zim fw?

| 特性 | Zim fw | Oh My Zsh |
|------|--------|-----------|
| 启动时间 | <30ms | ~500ms |
| 插件管理 | 模块化 | 单体式 |
| 配置复杂度 | 简单 | 复杂 |
| 主题兼容 | P10k 原生支持 | 需额外配置 |
| 维护状态 | 活跃 | 活跃 |

### 性能对比

```
Oh My Zsh:  ~470ms
Zim fw:     ~20-30ms
纯手写:     ~10ms (但需要大量维护)
```

---

## 工具集

### 现代工具列表

| 工具 | 替代 | 用途 | 文档 |
|------|------|------|------|
| **atuin** | Ctrl+R | 命令历史搜索 | [atuin.md](./atuin.md) |
| **zoxide** | cd | 智能目录跳转 | [zoxide.md](./zoxide.md) |
| **direnv** | .envrc | 项目环境管理 | [direnv.md](./direnv.md) |
| **eza** | ls | 更好的 ls | - |
| **bat** | cat | 带语法高亮的 cat | - |
| **ripgrep** | grep | 更快的 grep | - |
| **fzf** | - | 模糊查找器 | - |
| **lazygit** | git | Git TUI 工具 | - |
| **htop** | top | 系统监控 | - |

### 版本管理器

| 工具 | 语言 | 用途 |
|------|------|------|
| **fnm** | Node.js | 快速 Node 版本切换 |
| **pyenv** | Python | Python 版本管理 |

---

## 文件结构

```
~/Documents/dotfiles/zsh/
├── .zshrc              # 主配置入口
├── .zprofile           # 环境变量配置
├── .zimrc             # Zim 框架配置
├── .p10k.zsh          # Powerlevel10k 配置
├── aliases.zsh         # 别名定义
├── docs/              # 文档目录
│   ├── ZSH.md         # 本文件
│   ├── atuin.md       # atuin 使用指南
│   ├── zoxide.md      # zoxide 使用指南
│   └── direnv.md      # direnv 使用指南
├── plugins/           # 自定义插件 (可选)
└── completions/       # 自动补全 (可选)
```

---

## 安装指南

### 1. 安装 Zim fw

```bash
# 安装
curl -fsSL https://raw.githubusercontent.com/zimfw/zimfw/install/install.zsh | zsh

# 配置
chsh -s $(which zsh)
```

### 2. 安装工具

```bash
# 命令历史管理
brew install atuin
atuin register

# 智能目录跳转
brew install zoxide

# 项目环境管理
brew install direnv

# 其他现代工具
brew install eza bat ripgrep fzf lazygit htop
```

### 3. 配置文件

将以下内容添加到 `~/.zshrc`:

```zsh
# === Zim 框架 ===
ZIM_HOME=${ZIM_HOME:-${ZDOTDIR:-$HOME}/.zim}
[[ -f ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# === 现代工具 ===
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# === 别名 ===
source ~/Documents/dotfiles/zsh/aliases.zsh
```

### 4. 应用配置

```bash
# 重启 shell 或执行
source ~/.zshrc
```

---

## 故障排查

### 启动慢

```bash
# 测量启动时间
zmodload zsh/zprof
zsh -i -c zprof
```

### atuin 不工作

```bash
# 检查状态
atuin doctor

# 重新初始化
eval "$(atuin init zsh)"
```

### zoxide 不工作

```bash
# 检查安装
which zoxide

# 查看数据库
zoxide --help
```

### direnv 不工作

```bash
# 检查 hook
direnv status

# 允许 .envrc
cd ~/projects/myproject
direnv allow
```

---

## 参考资料

### 框架文档
- [Zim fw GitHub](https://github.com/zimfw/zimfw)
- [Zim Speed Wiki](https://github.com/zimfw/zimfw/wiki/Speed)

### 工具文档
- [atuin GitHub](https://github.com/atuinsh/atuin)
- [zoxide GitHub](https://github.com/ajeetdsouza/zoxide)
- [direnv 官网](https://direnv.com/)

### 社区资源
- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [CLI++: Upgrade Your Command Line](https://www.kdab.com/cli-upgrade-your-command-line/)
