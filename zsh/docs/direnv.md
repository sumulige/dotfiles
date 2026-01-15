# Direnv 使用指南

> 自动加载/卸载项目环境变量
>
> 官网: https://direnv.net
>
> 最后更新: 2025-01-15

## 目录

1. [简介](#简介)
2. [安装](#安装)
3. [配置](#配置)
4. [使用方法](#使用方法)
5. [常见用例](#常见用例)
6. [最佳实践](#最佳实践)

---

## 简介

### 什么是 Direnv?

Direnv 是一个 shell 扩展，可以根据当前目录自动加载/卸载环境变量：

- 进入目录时自动加载 `.envrc`
- 离开目录时自动卸载
- 防止环境污染
- 支持多种语言和工具

### 为什么使用 Direnv?

| 问题 | 传统方式 | Direnv |
|------|----------|--------|
| 项目环境 | export 每次都要设置 | 自动加载 |
| 环境污染 | export 影响全局 | 自动卸载 |
| 遗忘设置 | 容易忘记设置 | 自动提示 |
| 团队协作 | 口头传达 | 通过 .envrc 共享 |

---

## 安装

### macOS (Homebrew)

```bash
brew install direnv
```

### 验证安装

```bash
direnv --version
# direnv v2.32.0+...
```

---

## 配置

### Zsh 集成

在 `~/.zshrc` 中添加：

```zsh
eval "$(direnv hook zsh)"
```

### 重新加载

```bash
source ~/.zshrc
# 或重启终端
```

### 验证配置

```bash
direnv status
# DIRENV_WARNING: No direnv configuration found...
# (正常，表示 hook 工作正常)
```

---

## 使用方法

### 基础流程

```bash
# 1. 创建 .envrc 文件
cd ~/projects/myproject
echo 'export HELLO="world"' > .envrc

# 2. 允许 direnv (首次)
direnv allow

# 3. 查看效果
echo $HELLO
# world

# 4. 离开目录自动卸载
cd ..
echo $HELLO
# (空)
```

### .envrc 文件

```bash
# .envrc 示例
export PROJECT_ROOT=$(pwd)
export API_KEY="development_key"
export NODE_ENV="development"

# 添加到 PATH
PATH_add bin
PATH_add node_modules/.bin

# 加载 .env 文件
dotenv_if_exists .env
```

### 命令速查

| 命令 | 功能 |
|------|------|
| `direnv allow` | 允许当前 .envrc |
| `direnv deny` | 撤销允许 |
| `direnv reload` | 重新加载 .envrc |
| `direnv status` | 查看 direnv 状态 |
| `direnv edit` | 编辑并重新加载 .envrc |

---

## 常见用例

### 1. Node.js 项目

```bash
# .envrc
export NODE_ENV=development
export NODE_OPTIONS="--max-old-space-size=4096"

# 使用项目的 Node 版本 (fnm)
use fnm

# 加载 .env
dotenv_if_exists .env

# 添加 node_modules/.bin 到 PATH
PATH_add node_modules/.bin
```

### 2. Python 项目

```bash
# .envrc
layout python

# 或使用 pyenv
use pyenv 3.11

# 加载 .env
dotenv_if_exists .env

# 虚拟环境
layout virtualenv venv
```

### 3. Go 项目

```bash
# .envrc
export GOBIN=$(pwd)/bin
PATH_add $GOBIN
```

### 4. Docker 项目

```bash
# .envrc
export COMPOSE_PROJECT_NAME=myproject
export COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
```

### 5. 多环境配置

```bash
# .envrc
watch_file .envrc.local
source .envrc.local 2>/dev/null || true

# .envrc.local (不提交到 git)
export API_KEY="your_secret_key"
```

---

## 高速功能

### watch_file

监视文件变化，自动重新加载：

```bash
# .envrc
watch_file package.json
# 当 package.json 改变时自动重新加载
```

### 布局系统

自动设置开发环境：

```bash
# Python 虚拟环境
layout python

# Node.js (自动检测 package.json)
layout node

# Ruby (自动检测 Gemfile)
layout ruby

# Perl
layout perl

# pipenv
layout pipenv

# poetry
layout poetry
```

### 自定义函数

```bash
# .envrc
# 定义自定义函数
my_function() {
    echo "Hello from direnv!"
}

# 加载后立即可用
```

### 条件加载

```bash
# .envrc
# 根据主机名加载不同配置
if [[ $(hostname) == "work-mac" ]]; then
    export ENV_TYPE="work"
else
    export ENV_TYPE="personal"
fi

# 根据文件存在性
if has cargo; then
    PATH_add ~/.cargo/bin
fi
```

---

## 最佳实践

### 1. .envrc 管理

```bash
# 提交模板，忽略实际值
echo ".envrc.local" >> .gitignore
echo ".envrc" >> .gitignore  # 如果包含敏感信息
```

### 2. 安全性

```bash
# .envrc
# 不要存储敏感信息
export API_KEY  # ❌ 危险

# 使用 .env 或 .envrc.local
dotenv_if_exists .env  # ✅ 安全
```

### 3. 团队协作

```bash
# .envrc.example (提交到 git)
export NODE_ENV=development
export API_URL="http://localhost:3000"

# .envrc.local (不提交)
export API_KEY="your_key"
```

### 4. 性能优化

```bash
# .envrc
# 避免耗时操作
npm install  # ❌ 不要在 .envrc 中运行

# 使用条件加载
[[ -f package.json ]] && layout node
```

---

## 故障排查

### .envrc 不生效

```bash
# 检查状态
direnv status

# 手动重载
direnv reload

# 检查权限
direnv allow

# 查看日志
direnv status  # 显示详细错误
```

### hook 不工作

```bash
# 确认 hook 在 .zshrc 中
type direnv
# 应该显示 direnv is a shell function

# 重新加载
source ~/.zshrc
```

### 权限被撤销

```bash
# 查看状态
direnv status

# 重新允许
direnv allow
```

### 导出变量未生效

```bash
# 确保使用 export
VAR=value       # ❌ 不导出
export VAR=value # ✅ 导出

# 检查加载顺序
direnv reload
```

---

## 配置文件

### ~/.config/direnv/direnv.toml

```toml
# 全局配置
[global]
# 禁用提示
warn_timeout = "0s"

# 宽松模式 (允许更快加载)
strict_env = false

[whitelist]
# 始终允许的目录前缀
prefix = [
  "~/projects/",
  "~/work/"
]
```

---

## 参考资料

- [Direnv 官网](https://direnv.net)
- [Direnv GitHub](https://github.com/direnv/direnv)
- [Direnv 文档](https://direnv.net/docs/hook.html)
- [标准库](https://direnv.net/docs/stdlib.html)
