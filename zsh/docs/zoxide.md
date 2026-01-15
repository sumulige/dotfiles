# Zoxide 使用指南

> 更智能的 cd 命令，学习你的使用习惯
>
> GitHub: https://github.com/ajeetdsouza/zoxide
>
> 最后更新: 2025-01-15

## 目录

1. [简介](#简介)
2. [安装](#安装)
3. [配置](#配置)
4. [使用方法](#使用方法)
5. [高级功能](#高级功能)
6. [最佳实践](#最佳实践)

---

## 简介

### 什么是 Zoxide?

Zoxide 是一个用 Rust 编写的更智能的 `cd` 命令替代品：

- 学习你经常访问的目录
- 使用模糊匹配算法
- 支持短别名跳转
- 与 fzf 集成

### 为什么使用 Zoxide?

| 特性 | cd | zoxide |
|------|-----|--------|
| 路径记忆 | 无 | ✅ 学习习惯 |
| 模糊匹配 | 无 | ✅ 支持关键字 |
| 别名支持 | 需手动 | ✅ 自动生成 |
| 交叉目录 | 需完整路径 | ✅ 几个字符 |

---

## 安装

### macOS (Homebrew)

```bash
brew install zoxide
```

### 验证安装

```bash
zoxide --version
# zoxide v0.9.0+...
```

---

## 配置

### Zsh 集成

在 `~/.zshrc` 中添加：

```zsh
eval "$(zoxide init zsh)"
```

### 自定义别名

默认使用 `z` 命令，可自定义：

```zsh
# 使用其他别名
eval "$(zoxide init zsh --cmd cd)"  # 替代 cd
eval "$(zoxide init zsh --cmd j)"   # 使用 j 命令
```

---

## 使用方法

### 基础用法

```bash
# 首次访问目录（使用普通 cd）
cd ~/Documents/projects/dotfiles

# 之后可以用任何关键字跳转
z dot              # 跳转到 dotfiles
z do               # 同样有效（模糊匹配）
z files            # 同样有效
z doc/dot          # 子目录匹配
```

### 关键字匹配

Zoxide 使用 ** frecency** 算法（频率 + 最近时间）：

```bash
# 访问频率越高，权重越大
z dot              # 最常用的包含 "dot" 的目录

# 最近访问有加成
z proj             # 最近访问的包含 "proj" 的目录
```

### 多关键字

```bash
# 使用多个关键字缩小范围
z dot proj         # 包含 dot 和 proj 的目录
z doc ierm         # 包含 doc 和 ierm 的目录
```

### 交互式选择

与 fzf 集成：

```bash
# 按 Tab 进入交互模式
z dot<Tab>

# 在 fzf 中选择目标目录
```

---

## 高级功能

### 查看数据库

```bash
# 查看所有记录的目录
zoxide query -ls

# 查看特定目录的分数
zoxide query ~/Documents/dotfiles
```

### 管理数据库

```bash
# 添加目录到数据库
zoxide add ~/path/to/dir

# 从数据库移除
zoxide remove ~/path/to/dir

# 清空整个数据库
zoxide remove --all
```

### 导入/导出

```bash
# 导出数据库
zoxide export > zoxide-backup.txt

# 导入数据库
zoxide import < zoxide-backup.txt
```

---

## 常用场景

### 1. 项目跳转

```bash
# 访问一次
cd ~/projects/myproject
cd ~/projects/otherproject

# 之后快速切换
z my               # 跳转到 myproject
z other            # 跳转到 otherproject
z proj             # 如果有多个，会按 frecency 排序
```

### 2. 深层目录

```bash
# 避免输入深层路径
# 原来需要:
cd ~/Documents/projects/work/2025/myproject/src

# 现在只需:
z src              # 如果这是你常用的 src 目录
```

### 3. 类似名称的目录

```bash
# 多个相似目录时
z api-backend       # 如果这是你常用的
z api-frontend      # 或者用更多关键字区分
z api back          # 多关键字精确匹配
```

---

## 最佳实践

### 1. 与其他工具结合

```bash
# 与代码编辑器结合
z dot && code .     # 跳转并打开 VS Code
z dot && nvim .     # 跳转并打开 Neovim

# 与 git 结合
z proj && git status
```

### 2. 自定义常用跳转

```bash
# 在 .zshrc 中添加函数
gdot() { z dot && code . }
gproj() { z proj && tmux }
```

### 3. 初始化数据库

```bash
# 从 z 或 autojump 迁移
# zoxide 会自动学习，首次使用时多访问常用目录
```

---

## 故障排查

### 找不到目录

```bash
# 确保先用 cd 访问过该目录
cd ~/path/to/dir

# 再次尝试
z dir
```

### 跳转错误

```bash
# 查看匹配的目录
zoxide query -ls | grep keyword

# 如果有歧义，使用更多关键字
z proj name
```

### 与其他工具冲突

如果与 `autojump` 或 `z` 冲突，卸载其他工具：

```bash
brew uninstall autojump
# 从 .zshrc 中移除相关配置
```

---

## 配置选项

### 环境变量

```bash
# 设置数据目录
export _ZO_DATA_DIR="$HOME/.local/share/zoxide"

# 设置排除的目录
export _ZO_EXCLUDE_DIRS="$HOME/Downloads:/tmp"

# 最大数据库条目数
export _ZO_MAXAGE=10000
```

---

## 参考资料

- [Zoxide GitHub](https://github.com/ajeetdsouza/zoxide)
- [Zoxide 文档](https://github.com/ajeetdsouza/zoxide#readme)
- [fzf 集成](https://github.com/ajeetdsouza/zoxide/wiki/fzf)
