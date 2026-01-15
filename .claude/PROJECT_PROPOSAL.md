# 项目计划书 (Project Proposal)

> 完整技术方案与实施计划
> 生成日期: 2026-01-16

---

## 执行摘要

**Personal Dotfiles** 是一个 AI 驱动的个人开发环境配置项目。通过 Claude Code 框架和自定义钩子系统，实现配置的可维护性、可追溯性和可进化性。项目采用 Personal Panopticon 设计理念，让 AI 成为你思维的延伸。

---

## 1. 项目背景

### 1.1 问题陈述
传统 dotfiles 管理存在以下问题：
- **配置漂移**: 多机器配置难以同步
- **文档滞后**: 配置更新后文档不及时
- **决策遗忘**: 为什么这样配置？时间久了忘记原因
- **重复劳动**: 每次设置新环境都要手动操作

### 1.2 解决方案概述
构建一个 AI 自治的开发环境系统：
- **钩子自动化**: 配置变更自动触发文档更新
- **记忆系统**: AI 记录所有决策和变更历史
- **任务管理**: AI 自动追踪任务状态
- **技能知识库**: 知识可累积、可复用

### 1.3 目标用户
- 追求极致开发效率的个人开发者
- 需要多机器同步配置的技术人员
- 希望 AI 辅助管理开发环境的早期采用者

---

## 2. 功能需求

### 2.1 核心功能 (MVP)
| 功能 | 描述 | 优先级 | 状态 |
|------|------|--------|------|
| Shell 配置 | Zsh + Zim fw，启动时间 <150ms | P0 | ✅ |
| 终端配置 | iTerm2 + One Dark Pro 散光优化 | P0 | ✅ |
| AI 记忆系统 | 自动记录决策和变更 | P0 | 🔄 |
| 钩子系统 | 10 个自动化钩子 | P0 | ✅ |
| 现代工具集成 | atuin, zoxide, direnv, eza, bat, ripgrep, fzf | P0 | ✅ |

### 2.2 扩展功能
| 功能 | 描述 | 优先级 | 状态 |
|------|------|--------|------|
| 任务管理系统 | 自动追踪任务状态 | P1 | ⏳ |
| Skills 知识库 | 知识可累积复用 | P2 | ⏳ |
| 编辑器配置 | Neovim / VS Code | P2 | ⏳ |
| 容器化开发 | Docker 开发环境 | P3 | ⏳ |

---

## 3. 技术架构

### 3.1 架构图

```
┌─────────────────────────────────────────────────────────────┐
│                    Personal Panopticon 架构                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐   │
│   │   数据层    │    │   AI 层      │    │   输出层    │   │
│   │             │    │             │    │             │   │
│   │ • dotfiles  │───→│   Claude    │───→│ • 配置文件  │   │
│   │ • 历史记录  │    │   Code      │    │ • 文档      │   │
│   │ • 思维轨迹  │    │   钩子系统  │    │ • 任务状态  │   │
│   │ • Skills    │    │             │    │ • 记忆日志  │   │
│   └─────────────┘    └─────────────┘    └─────────────┘   │
│                             │                                │
│                             ▼                                │
│                    ┌─────────────┐                         │
│                    │  持久化存储  │                         │
│                    │ • MEMORY.md  │                         │
│                    │ • PROJECT_LOG│                         │
│                    │ • thinking-routes/                   │
│                    └─────────────┘                         │
└─────────────────────────────────────────────────────────────┘
```

### 3.2 技术栈

| 层级 | 技术选择 | 理由 |
|------|----------|------|
| **Shell** | Zsh + Zim fw | 启动快 (<150ms)，模块化设计 |
| **终端** | iTerm2 | 功能强大，支持动态 Profile |
| **主题** | Powerlevel10k | 高度可定制，即时提示 |
| **AI 框架** | Claude Code | 最好的代码理解和生成能力 |
| **包管理** | Homebrew | macOS 标准包管理器 |
| **版本控制** | Git + GitHub | 分布式版本控制 |

### 3.3 目录结构

```
dotfiles/
├── .claude/                    # AI 自治记忆系统核心 ⭐
│   ├── ANCHORS.md             # 技能锚点索引
│   ├── CLAUDE.md              # AI 协作配置
│   ├── MEMORY.md              # 增量记忆日志
│   ├── PROJECT_LOG.md         # 项目构建历史
│   ├── PROJECT_KICKOFF.md     # 项目启动清单
│   ├── TASK_PLAN.md           # 任务执行计划
│   ├── PROJECT_PROPOSAL.md    # 项目计划书 (本文件)
│   ├── settings.json          # Claude Code 配置
│   ├── hooks/                 # 自动化钩子 (10个)
│   │   ├── code-formatter.cjs
│   │   ├── conversation-logger.cjs
│   │   ├── memory-sync.sh
│   │   ├── project-kickoff.cjs
│   │   ├── rag-skill-loader.cjs
│   │   ├── thinking-silent.cjs
│   │   ├── todo-manager.cjs
│   │   └── verify-work.cjs
│   ├── skills/                # 技能库
│   │   ├── SKILLS.md
│   │   ├── manus-kickoff/
│   │   └── template/
│   ├── thinking-routes/       # 思维轨迹系统
│   └── rag/                   # RAG 系统
├── development/               # 开发任务管理
│   └── todos/                 # 任务追踪系统
├── git/                       # Git 配置
├── iterm2/                    # iTerm2 配置 ✅
│   ├── com.googlecode.iterm2.plist
│   ├── OneDarkPro.itermcolors
│   ├── OneDarkPro.json
│   ├── CONFIG.md
│   └── README.md
├── prompts/                   # Prompt 教学库
│   └── how-to-find.md
├── zsh/                       # Zsh 配置 ✅
│   ├── .zshrc
│   ├── .zimrc
│   └── docs/                  # Zsh 文档 ✅
│       ├── ZSH.md
│       ├── atuin.md
│       ├── direnv.md
│       └── zoxide.md
├── AGENTS.md
├── CLAUDE-template.md
├── README.md
├── project-paradigm.md
└── thinkinglens-silent.md
```

---

## 4. 钩子系统

### 4.1 钩子列表

| 钩子 | 触发时机 | 功能 |
|------|----------|------|
| project-kickoff.cjs | 项目启动 | 生成项目计划文件 |
| rag-skill-loader.cjs | 技能变更 | 更新 RAG 索引 |
| thinking-silent.cjs | 思考时 | 静默模式记录 |
| todo-manager.cjs | 任务变更 | 自动更新任务状态 |
| code-formatter.cjs | 代码保存 | 格式化代码 |
| verify-work.cjs | 任务完成 | 验证工作质量 |
| conversation-logger.cjs | 对话结束 | 记录对话摘要 |
| memory-sync.sh | 文件变更 | 同步记忆日志 |

### 4.2 钩子配置

```json
{
  "matcher": "Edit|MultiEdit|Write",
  "hooks": [{
    "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/memory-sync.sh",
    "timeout": 5
  }]
}
```

---

## 5. 开发计划

### 5.1 迭代规划

| Sprint | 目标 | 任务 | 预估 | 状态 |
|--------|------|------|------|------|
| Sprint 0 | 项目启动 | 架构设计、环境搭建 | 1天 | ✅ |
| Sprint 1 | 核心 MVP | Shell/终端配置完成 | 1天 | ✅ |
| Sprint 2 | AI 系统 | 记忆系统、钩子配置 | 1天 | 🔄 |
| Sprint 3 | 文档完善 | 完整文档覆盖 | 1天 | ⏳ |
| Sprint 4 | 持续进化 | Skills 扩展、任务管理 | 持续 | ⏳ |

### 5.2 里程碑

| 里程碑 | 交付物 | 预计日期 | 实际日期 | 状态 |
|--------|--------|----------|----------|------|
| M0: 项目启动 | 架构文档、任务计划 | 2026-01-16 | 2026-01-16 | ✅ |
| M1: Shell 配置 | Zsh + Zim fw + 现代工具 | 2026-01-16 | 2026-01-16 | ✅ |
| M2: 终端配置 | iTerm2 + One Dark Pro | 2026-01-15 | 2026-01-15 | ✅ |
| M3: AI 记忆系统 | 钩子运行 + 记忆记录 | 2026-01-16 | - | 🔄 |
| M4: 文档完整 | 100% 文档覆盖 | 2026-01-16 | - | ⏳ |

---

## 6. 质量保证

### 6.1 测试策略
- **配置测试**: 新环境自动安装脚本
- **钩子测试**: 每个钩子独立测试
- **文档验证**: 文档与配置一致性检查

### 6.2 代码质量
- **风格指南**: Linus Torvalds 哲学
- **文件限制**: 单文件 <800 行，单目录 <8 文件
- **零循环依赖**: 模块间单向依赖

### 6.3 性能指标

| 指标 | 目标 | 当前 | 状态 |
|------|------|------|------|
| Shell 启动时间 | <150ms | ~127ms | ✅ |
| 钩子执行时间 | <5s | <2s | ✅ |
| 文档覆盖率 | 100% | ~70% | 🔄 |

---

## 7. 部署计划

### 7.1 环境配置

```bash
# 1. 克隆仓库
git clone https://github.com/sumulige/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles

# 2. 安装依赖
brew install zsh zimfw atuin zoxide direnv eza bat ripgrep fzf lazygit

# 3. 链接配置
ln -s ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Documents/dotfiles/zsh/.zimrc ~/.zimrc
ln -s ~/Documents/dotfiles/git/.gitconfig ~/.gitconfig

# 4. iTerm2 配置
# 导入 iterm2/OneDarkPro.json 作为动态 Profile

# 5. 重启终端
```

### 7.2 发布流程
1. 配置变更测试
2. 文档同步更新
3. Git commit + push
4. 多机器同步

---

## 8. 风险与缓解

| 风险 | 影响 | 可能性 | 缓解措施 |
|------|------|--------|----------|
| 钩子兼容性问题 | 中 | 中 | 版本锁定 + 逐步迁移 |
| 文档维护负担 | 低 | 高 | AI 自动生成 + 模板 |
| 多机器同步冲突 | 低 | 中 | Git 分支策略 |
| AI 行为不可预期 | 中 | 低 | Human 检查点 |

---

## 9. 成功指标

### 9.1 技术指标
- Shell 启动时间 < 150ms ✅
- 钩子执行成功率 > 95% 🔄
- 文档覆盖率 100% ⏳

### 9.2 个人效率指标
- 新环境设置时间 < 30min
- 配置查找时间 < 1min
- 决策可追溯性 100%

---

## 10. 后续规划

### 10.1 短期 (1个月)
- ✅ Zsh + Zim fw 配置
- ✅ iTerm2 散光优化主题
- ✅ 现代工具集成 (atuin, zoxide, direnv)
- 🔄 AI 记忆系统运行
- ⏳ 文档 100% 覆盖

### 10.2 中期 (3个月)
- ⏳ Neovim 配置
- ⏳ VS Code 配置
- ⏳ Skills 知识库扩展
- ⏳ 任务系统自动化

### 10.3 长期 (1年)
- ⏳ Docker 开发环境
- ⏳ 跨平台支持 (Linux)
- ⏳ 团队协作支持
- ⏳ 公开源码

---

## 附录

### A. 术语表

| 术语 | 定义 |
|------|------|
| Personal Panopticon | 数据主权反转理念，让你看见自己 |
| Manus Kickoff | AI 2.0 开发范式，先规划后执行 |
| ThinkingLens | 思维轨迹系统，记录决策过程 |
| RAG | Retrieval-Augmented Generation，检索增强生成 |

### B. 参考资料
- [Zim fw GitHub](https://github.com/zimfw/zimfw)
- [Powerlevel10k GitHub](https://github.com/romkatv/powerlevel10k)
- [Claude Code 文档](https://docs.anthropic.com)
- [project-paradigm.md](../project-paradigm.md)

---

**文档版本**: v1.0
**最后更新**: 2026-01-16
**状态**: ✅ 批准执行
