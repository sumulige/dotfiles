# Ghostty 配置 - AI Terminal Optimized

> 基于 2025-2026 最佳实践，针对 AI 终端编程优化
> 版本要求: Ghostty 1.2.0+

## 核心亮点

| 特性 | 说明 |
|------|------|
| **Quick Terminal** | `Ctrl+\`` 全局呼出浮动终端 |
| **自动主题切换** | 跟随系统 Light/Dark 模式 |
| **Shell Integration** | 自动注入，无需配置 |
| **50000 行滚动** | AI 长输出友好 |
| **分屏快捷键** | 与 iTerm2 一致 |

## 文件结构

```
ghostty/
├── config              # 主配置（已链接）
├── themes/
│   ├── One Dark Pro    # 暗色主题（散光优化）
│   └── One Light       # 亮色主题
└── README.md
```

## 安装

```bash
# 配置已自动链接到 ~/.config/ghostty/
# 如需手动安装:
mkdir -p ~/.config/ghostty
ln -sf ~/Documents/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sf ~/Documents/dotfiles/ghostty/themes ~/.config/ghostty/themes
```

## 快捷键速查

### 基础操作
| 快捷键 | 功能 |
|--------|------|
| `Ctrl+\`` | **Quick Terminal** 全局呼出 |
| `Cmd+T` | 新标签 |
| `Cmd+W` | 关闭窗格 |
| `Cmd+Shift+,` | 重载配置 |
| `Cmd+Shift+I` | Terminal Inspector |

### 分屏
| 快捷键 | 功能 |
|--------|------|
| `Cmd+D` | 垂直分屏 |
| `Cmd+Shift+D` | 水平分屏 |
| `Cmd+Alt+方向键` | 分屏导航 |
| `Cmd+Ctrl+方向键` | 调整分屏大小 |

### 滚动
| 快捷键 | 功能 |
|--------|------|
| `Cmd+↑/↓` | 翻页 |
| `Cmd+Home` | 滚动到顶部 |
| `Cmd+End` | 滚动到底部 |

### 字体
| 快捷键 | 功能 |
|--------|------|
| `Cmd++` | 放大字体 |
| `Cmd+-` | 缩小字体 |
| `Cmd+0` | 重置字体 |

## 特色功能

### 1. Quick Terminal（隐藏神器）

类似 iTerm2 的 Hotkey Window，按 `Ctrl+\`` 从屏幕顶部滑出浮动终端：

```
quick-terminal-position = top      # 从顶部滑出
quick-terminal-animation-duration = 0.15  # 动画时长
```

### 2. 自动主题切换

跟随 macOS 系统外观自动切换：
```
theme = light:One Light,dark:One Dark Pro
```

### 3. Shell Integration

Ghostty 杀手锏 - 自动注入 shell 集成，无需手动配置：
- 光标形状跟随模式变化
- sudo 密码提示优化
- 窗口标题自动更新

### 4. Terminal Inspector

`Cmd+Shift+I` 打开调试面板，实时查看：
- 按键事件
- 渲染时间
- 终端状态

## 与 iTerm2 配置对比

| 配置项 | iTerm2 | Ghostty |
|--------|--------|---------|
| 滚动缓冲 | 50000 行 | 50000 行 |
| 字体 | JetBrains Mono 17pt | JetBrains Mono 17pt |
| 行距 | 1.25 | 25% |
| 主题切换 | 手动 | **自动** ✨ |
| Quick Terminal | Hotkey Window | Quick Terminal |
| Shell Integration | 手动配置 | **自动** ✨ |

## 命令行工具

```bash
# 列出所有可用主题
ghostty +list-themes

# 验证配置
ghostty +validate-config

# 显示当前配置
ghostty +show-config
```

## 参考资料

- [官方文档](https://ghostty.org/docs/config)
- [配置选项参考](https://ghostty.org/docs/config/reference)
- [最佳实践文章](https://samuellawrentz.com/blog/minimal-ghostty-config/)
- [可视化配置生成器](https://ghostty.zerebos.com/)
