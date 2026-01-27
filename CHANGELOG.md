# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

---

## [2026-01-27] - Shell 配置全面优化

### Fixed
- fnm/pyenv 懒加载 bug - 添加防重复加载标记，修复 `command` 调用问题
- Zim compinit 重复警告 - 将 Starship 初始化移至 Zim 之后
- Ghostty 滚动被强制重置 - 设置 `scroll-to-bottom = none`

### Changed
- **Powerlevel10k → Starship 迁移** - P10k 已进入 Life Support 模式
- zsh/.zshrc 精简 ~15 行（移除 P10k 残留代码）

### Added
- `starship/starship.toml` - Starship 提示符配置纳入版本控制
- 懒加载防护标记 `$_FNM_LOADED` / `$_PYENV_LOADED`

### Removed
- ~/.p10k.zsh 配置文件
- ~/.cache/p10k-* 缓存文件

---

## [2026-01-22] - AI 终端编程优化

### Added
- **Ghostty 终端配置** - 基于 2025-2026 最佳实践
  - Quick Terminal: `Ctrl+\`` 全局呼出
  - 自动主题切换: light/dark
  - Shell Integration: 自动注入 zsh 集成
  - 50000 行滚动缓冲
- **自动同步方案** - sync.sh + Git hooks
- Claude Code 快捷命令: `cc`, `ccc`, `ccr`
- iTerm2 滚动优化: Scrollback in Alternate Screen

### Changed
- LESS 配置: `-R -X -F` 不使用 alternate screen

---

## [2026-01-19] - 联网优化审计

### Added
- 完整优化审计报告 `.claude/reports/2026-01-19-optimization-audit.md`

### Audited
- Powerlevel10k: Life Support 状态，建议迁移 Starship
- Zim Framework: 最佳选择，保持不变
- fnm: 最佳选择 (比 nvm 快 500x)
- Atuin v18: 新功能可用 (Sync v2, Vim keys)
- 所有现代 CLI 工具: 全部最新

---

## [2026-01-16] - 全面优化日

### Added
- **测试系统** - 29/29 测试通过
- **一键安装脚本** - `install.sh full`
- **Neovim 现代化配置** - Lua + lazy.nvim
- **分层 Brewfile** - core (32包) + tools (~20包)
- **Manus Kickoff 工作流** - 项目启动流程
- **AI 记忆系统** - MEMORY.md, PROJECT_LOG.md, ANCHORS.md

### Changed
- Brew 性能优化: 禁用 auto-update，命令响应从 5-10s 降至 ~1s
- 清理 2.9GB 缓存

---

## [2026-01-15] - 初始配置

### Added
- Zsh + Zim fw 配置 (启动 ~127ms)
- iTerm2 One Dark Pro 散光优化主题
- 现代工具集成 (atuin, zoxide, direnv, eza, bat, ripgrep, fzf, lazygit)
- 钩子系统 (10 个自动化钩子)

### Changed
- 从 Oh My Zsh 迁移到 Zim fw (启动时间 ~470ms → ~127ms)
- One Dark Pro 蓝色调整 #61afef → #7DCFFF (散光优化)

---

[Unreleased]: https://github.com/sumulige/dotfiles/compare/HEAD...HEAD
[2026-01-27]: https://github.com/sumulige/dotfiles/commits/master
