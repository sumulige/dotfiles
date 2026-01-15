# Atuin 使用指南

> 魔法般的 Shell 历史记录管理工具
>
> 官网: https://atuin.sh
>
> 最后更新: 2025-01-15

## 目录

1. [简介](#简介)
2. [安装](#安装)
3. [配置](#配置)
4. [使用方法](#使用方法)
5. [高级功能](#高级功能)
6. [故障排查](#故障排查)

---

## 简介

### 什么是 Atuin?

Atuin 是一个用 Rust 编写的 shell 历史记录工具，它：

- 用 SQLite 数据库替代传统的文本历史文件
- 提供强大的搜索和过滤功能
- 支持跨机器加密同步
- 记录命令的上下文信息（退出码、执行时间、目录等）

### 为什么使用 Atuin?

| 特性 | 传统 Shell 历史 | Atuin |
|------|----------------|-------|
| 搜索 | Ctrl+R 逐个匹配 | 全文搜索 + 过滤 |
| 存储 | 纯文本 | SQLite 数据库 |
| 上下文 | 无 | 退出码、时间、目录 |
| 同步 | 手动复制 | 自动加密同步 |
| 统计 | 无 | 命令使用分析 |

---

## 安装

### macOS (Homebrew)

```bash
brew install atuin
```

### 验证安装

```bash
atuin --version
# atuin 18.0.0+...
```

### 注册账户

```bash
atuin register
```

按提示输入邮箱和密码。注册后自动登录。

### 登录

```bash
atuin login
```

---

## 配置

### Zsh 集成

在 `~/.zshrc` 中添加：

```zsh
eval "$(atuin init zsh)"
```

### 配置文件

Atuin 的配置位于 `~/.config/atuin/config.toml`:

```toml
# 自动同步
auto_sync = true

# 更新频率
update_check = true

# 搜索模式
# "prefix" | "full" | "fuzzy" | "token"
search_mode = "fuzzy"

# 显示样式
# "compact" | "full"
style = "compact"

# 进入即搜索
enter_accept = true
```

---

## 使用方法

### 基础搜索

| 按键 | 功能 |
|------|------|
| `Ctrl+R` | 打开 Atuin 搜索界面 |
| `Ctrl+R` (在搜索中) | 切换搜索模式 |
| `Esc` | 退出搜索 |
| `Enter` | 执行选中命令 |

### 搜索模式

```bash
# 模式 1: 前缀搜索 (默认)
git pu<Tab>  # 匹配 git push, git pull

# 模式 2: 全文搜索
:full config<Tab>  # 匹配包含 config 的命令

# 模式 3: 模糊搜索
:fuzzy gpm<Tab>  # 模糊匹配 git push main
```

### 过滤搜索

```bash
# 只显示当前目录的历史
zsh atuin search --cwd

# 只显示成功命令 (退出码 0)
zsh atuin search --exit 0

# 只显示失败命令
zsh atuin search --exit-not 0

# 显示特定时间范围的命令
zsh atuin search --after "2025-01-01"
zsh atuin search --before "2025-01-15"
```

---

## 高级功能

### 统计信息

```bash
# 查看使用统计
atuin stats

# 查看最常用的命令
atuin stats --cmd-count 10

# 按目录统计
atuin stats --cwd
```

### 历史同步

```bash
# 手动同步
atuin sync

# 同步状态
atuin sync status
```

### 历史导入

```bash
# 从传统 zsh 历史导入
atuin import zsh

# 从 fish 历史导入
atuin import fish
```

### 历史管理

```bash
# 删除特定历史记录
atuin history id <ID>

# 清空所有历史
atuin history prune --age 30d  # 删除30天前的历史
```

---

## 快捷键速查

### 搜索界面

| 按键 | 功能 |
|------|------|
| `Ctrl+R` | 切换搜索模式 |
| `Ctrl+U` | 清空搜索框 |
| `Ctrl+G` | 退出不执行 |
| `Up/Down` | 上下选择 |
| `Ctrl+J/K` | 上下选择 |
| `Enter` | 执行选中命令 |

### 命令行

```bash
# 快速搜索
atuin search <query>

# 列出最近历史
atuin history list --limit 20

# 按目录查看
atuin history list --cwd ~/projects
```

---

## 故障排查

### Ctrl+R 不工作

```bash
# 检查是否正确初始化
echo $HISTFILE  # 应该是空的或指向 atuin

# 检查配置
cat ~/.zshrc | grep atuin

# 重新加载
source ~/.zshrc
```

### 同步失败

```bash
# 检查登录状态
atuin status

# 重新登录
atuin login

# 手动同步
atuin sync
```

### 历史重复

```bash
# 检查 Zsh 配置
# 确保 HIST_IGNORE_DUPS 等选项被 Atuin 接管
```

---

## 最佳实践

### 1. 命令分组

使用目录隔离不同项目的历史记录，Atuin 自动记录所在目录。

### 2. 敏感命令

Atuin 默认不记录包含敏感信息的命令（如带密码的命令）。

### 3. 定期清理

```bash
# 定期清理旧历史
atuin history prune --age 90d
```

---

## 参考资料

- [Atuin 官网](https://atuin.sh)
- [Atuin GitHub](https://github.com/atuinsh/atuin)
- [配置文档](https://atuin.sh/docs/configuration/)
