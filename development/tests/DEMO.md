# Dotfiles 功能演示

> 展示 dotfiles 项目的核心功能和使用方法

---

## 功能概览

```
┌─────────────────────────────────────────────────────────────┐
│                    Dotfiles 项目架构                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐   │
│   │  Shell 层   │    │  工具层     │    │   文档层    │   │
│   │             │    │             │    │             │   │
│   │ Zsh + Zim fw │───→│ atuin       │───→│ ANCHORS.md  │   │
│   │ Powerlevel10k│   │ zoxide      │   │ MEMORY.md   │   │
│   │ 启动 ~120ms  │   │ direnv      │   │ PROJECT_LOG │   │
│   │             │    │ eza/bat/rg  │    │ TASK_PLAN.md │   │
│   └─────────────┘    │ fzf/lazygit │    └─────────────┘   │
│                      └─────────────┘                     │
└─────────────────────────────────────────────────────────────┘
```

---

## 1. Shell 配置演示

### 启动性能
```bash
$ time zsh -i -c exit

real    0m0.117s
user    0m0.050s
sys     0m0.050s
```

**对比**: 比 Oh My Zsh (~470ms) 快 **75%**！

### 提示效果
```
user@hostname ~/Documents/dotfiles
└─ [main] →  # Git 分支显示
✦ 1s       # 命令执行时间
```

---

## 2. 现代工具演示

### 工具版本
| 工具 | 版本 | 功能 |
|------|------|------|
| `atuin` | 18.11.0 | 命令历史搜索 (Ctrl+R) |
| `zoxide` | 0.9.8 | 智能目录跳转 |
| `direnv` | 2.37.1 | 项目环境自动加载 |
| `eza` | modern ls | 带图标的文件列表 |
| `bat` | 0.26.1 | 语法高亮 cat |
| `ripgrep` | 15.1.0 | 超快速 grep |
| `fzf` | 0.67.0 | 模糊查找 |
| `lazygit` | 0.58.1 | Git TUI |

### 使用示例

#### 智能目录跳转 (zoxide)
```bash
$ z dotfiles      # 跳转到 dotfiles 目录
$ z docs          # 跳转到最近访问的 docs 目录
$ z d             # 模糊匹配包含 d 的目录
```

#### 现代文件列表 (eza)
```bash
$ ll              # 详细列表，带图标
$ lt              # 树状结构，2级深度
```

#### 语法高亮查看 (bat)
```bash
$ cat ~/.zshrc   # 带行号、语法高亮
$ catp config    # 分页查看
```

#### Git 图形界面 (lazygit)
```bash
$ lg              # 启动 lazygit TUI
```

---

## 3. 别名功能演示

### 常用别名
| 别名 | 命令 | 说明 |
|------|------|------|
| `ll` | `eza -la --icons` | 详细列表 |
| `lt` | `eza --tree --level=2` | 树状结构 |
| `cat` | `bat --paging=never` | 语法高亮 |
| `catp` | `bat` | 分页查看 |
| `gs` | `git status` | Git 状态 |
| `ga` | `git add` | Git 添加 |
| `gc` | `git commit` | Git 提交 |
| `gp` | `git push` | Git 推送 |
| `gl` | `git log --oneline -10` | Git 日志 |
| `gd` | `git diff` | Git 差异 |
| `lg` | `lazygit` | Git TUI |
| `top` | `htop` | 系统监控 |

---

## 4. AI 记忆系统演示

### 文件结构
```
.claude/
├── ANCHORS.md       (114 行) - 技能锚点索引
├── MEMORY.md        (93 行)  - 增量记忆日志
├── PROJECT_LOG.md   (201 行) - 项目构建历史
├── TASK_PLAN.md     (163 行) - 任务执行计划
├── PROJECT_KICKOFF.md      - 项目启动清单
└── PROJECT_PROPOSAL.md     - 项目计划书
```

### 锚点使用
```markdown
[doc:paradigm]      # Personal Panopticon 开发范式
[config:zsh]       # Zsh 配置
[doc:atuin]         # atuin 使用指南
[project:kickoff]   # 项目启动清单
```

---

## 5. iTerm2 配置演示

### 主题: One Dark Pro (散光优化)

| 颜色 | 原值 | 优化值 | 说明 |
|------|------|--------|------|
| 蓝色 | #61afef | **#7DCFFF** | 提高对比度 |
| 光标 | Block | **Vertical Bar** | 更精准定位 |

### 导入方法
1. iTerm2 → Settings → Profiles
2. Other Actions → Import JSON Profiles...
3. 选择 `iterm2/OneDarkPro.json`
4. 设置为默认

---

## 6. 测试结果

```
┌─────────────────────────────────────────────────────────────┐
│                    测试汇总                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   总计: 29    通过: 29    失败: 0    跳过: 0               │
│                                                             │
│   ████████████████████████████████████████████ 100%          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 各模块状态
- ✅ Shell 配置: 3/3 通过
- ✅ 现代工具: 8/8 通过
- ✅ 别名功能: 3/3 通过
- ✅ Git 配置: 2/2 通过
- ✅ AI 记忆系统: 4/4 通过
- ✅ 文档完整性: 6/6 通过
- ✅ iTerm2 配置: 3/3 通过

---

## 7. 快速开始

```bash
# 1. 克隆仓库
git clone https://github.com/sumulige/dotfiles.git ~/Documents/dotfiles

# 2. 安装依赖
brew install zimfw atuin zoxide direnv eza bat ripgrep fzf lazygit

# 3. 链接配置
ln -sf ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/zsh/.zimrc ~/.zimrc
ln -sf ~/Documents/dotfiles/git/.gitconfig ~/.gitconfig

# 4. 初始化 Zim
zimfw install

# 5. 配置 iTerm2
# 导入 iterm2/OneDarkPro.json

# 6. 重启终端
```

---

**测试结论**: Dotfiles 项目配置完整，所有功能正常工作！🚀

---

**相关文档**:
- [TEST_REPORT.md](./TEST_REPORT.md) - 详细测试报告
- [README.md](../../README.md) - 项目主文档
- [TEST_PLAN.md](./TEST_PLAN.md) - 测试计划
