# 项目任务追踪系统

> 本目录由 AI 自动维护，记录项目开发任务和进度

@version: 1.0.0

## 目录结构

```
development/todos/
├── INDEX.md           # 本文件 - 任务总览
├── active/            # 进行中的任务
├── completed/         # 已完成的任务
├── backlog/           # 待规划的任务
└── archived/          # 已归档的任务
```

## 任务状态说明

| 状态 | 目录 | 说明 |
|------|------|------|
| 🚧 进行中 | `active/` | 当前正在开发的任务 |
| ✅ 已完成 | `completed/` | 完成的任务 |
| 📋 待办 | `backlog/` | 规划中或待分配的任务 |
| 📦 已归档 | `archived/` | 不再活跃的历史任务 |

## 快速跳转

- [🚧 进行中的任务](./active/) - 当前开发重点
- [✅ 已完成的任务](./completed/) - 最近完成
- [📋 待办任务](./backlog/) - 待规划
- [📦 已归档](./archived/) - 历史记录

---

## 当前任务状态

### 🚧 进行中 (4)

| 任务 | 优先级 | 负责人 | 创建时间 |
|------|--------|--------|----------|
| [创建 development/README.md](./active/2025-01-16-development-readme.md) | P2 | AI | 2026-01-16 |
| [创建 dotfiles-usage skill](./active/2025-01-16-dotfiles-usage-skill.md) | P2 | AI | 2026-01-16 |
| [创建 terminal-workflow skill](./active/2025-01-16-terminal-workflow-skill.md) | P2 | AI | 2026-01-16 |
| [Neovim 配置](./active/2025-01-16-neovim-config.md) | P2 | AI+Human | 2026-01-16 |

### ✅ 已完成 (0)

暂无已完成的任务

### 📋 待办 (0)

暂无待办任务

## 使用方式

### 查看任务
点击上方链接跳转到对应目录，或使用：
```bash
# 查看进行中的任务
cat development/todos/active/*.md

# 查看特定任务
cat development/todos/active/feature-name.md
```

### 创建新任务
在 Claude Code 中：
```
创建一个新任务：实现用户登录功能
```

AI 会自动在 `active/` 目录创建对应的任务文件。

### 更新任务状态
```
将 [任务名] 标记为完成
```

AI 会自动将任务移动到 `completed/` 目录。

---

> **维护说明**: 本系统由 AI 自动维护，请勿手动编辑（除非你知道自己在做什么）
