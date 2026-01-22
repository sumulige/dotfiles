# AI 终端编程工作流最佳实践

> 针对 Claude Code 等 AI 终端工具的配置优化指南
> 最后更新：2026-01-22

---

## 一、核心配置清单

### 1.1 iTerm2 滚动优化

| 配置项 | 推荐值 | 说明 |
|--------|--------|------|
| Scrollback Lines | 50000+ | AI 输出通常很长 |
| Scrollback in Alternate Screen | true | 退出 less/vim 后保留内容 |
| Scrollback With Status Bar | true | 状态栏程序也保留滚动 |

**设置路径**: Preferences → Profiles → Terminal

### 1.2 Shell 配置

```bash
# LESS 配置 - 不使用 alternate screen
export LESS='-R -X -F'
# -R: 保留颜色
# -X: 不清屏
# -F: 内容少于一屏时直接退出

# Claude Code 快捷命令
alias cc='claude'           # 启动 Claude Code
alias ccc='claude --continue'  # 继续上次对话
alias ccr='claude --resume'    # 恢复特定会话
```

---

## 二、推荐工具链

### 2.1 必备工具

| 工具 | 用途 | 为什么对 AI 编程重要 |
|------|------|---------------------|
| **atuin** | 命令历史搜索 | 快速找回 AI 建议的命令 |
| **zoxide** | 智能目录跳转 | 项目间快速切换 |
| **bat** | 代码查看 | 语法高亮，方便复制给 AI |
| **ripgrep** | 快速搜索 | 帮 AI 定位代码位置 |

### 2.2 可选增强

| 工具 | 用途 | 场景 |
|------|------|------|
| **tmux/zellij** | 会话持久化 | 断开不丢失 AI 对话 |
| **Starship** | 现代提示符 | 更好的 git 状态显示 |

---

## 三、工作流建议

### 3.1 项目启动

```bash
# 1. 跳转到项目
z myproject

# 2. 启动 Claude Code
cc

# 3. 或继续上次对话
ccc
```

### 3.2 长会话管理

```bash
# 查看会话列表
claude /sessions

# 恢复特定会话
ccr <session-id>
```

### 3.3 输出回顾

- **Cmd+F**: 在终端中搜索
- **Cmd+↑/↓**: 快速滚动
- **Shift+Cmd+H**: 打开滚动历史

---

## 四、待评估升级

- [ ] **Atuin Sync v2**: 多设备历史同步
- [ ] **Starship**: 替代 Powerlevel10k（已进入 Life Support）
- [ ] **Zellij**: 现代终端复用器

---

## 五、常见问题

### Q: 窗口刷新后跳到顶部？

**原因**: Alternate Screen Buffer 行为
**解决**: 启用 "Scrollback in Alternate Screen" 或设置 `LESS='-R -X -F'`

### Q: 历史命令太多找不到？

**解决**: 使用 atuin 的 `Ctrl+R` 模糊搜索

### Q: AI 输出被截断？

**解决**: 增大 Scrollback Lines 到 50000+
