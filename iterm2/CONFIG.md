# iTerm2 配置文档

> One Dark Pro (散光优化版) - 完整配置说明
>
> 最后更新: 2025-01-15

## 目录

1. [配置概览](#配置概览)
2. [文件结构](#文件结构)
3. [全局设置](#全局设置)
4. [Profile 配置详解](#profile-配置详解)
5. [颜色配置](#颜色配置)
6. [更新流程](#更新流程)
7. [变更历史](#变更历史)

---

## 配置概览

### 设计目标

- **可读性优先**: 散光优化，WCAG AA+ 对比度标准 (6:1)
- **性能**: 启用 GPU 渲染，大滚动缓冲区
- **一致性**: 与 One Dark Pro 主题保持一致
- **现代体验**: Vertical Bar 光标，类似 VS Code

### Profile 结构

| Profile | GUID | 用途 |
|---------|------|------|
| Default | (默认) | 系统默认配置，80x25 |
| **One Dark Pro (Dynamic)** | `ONEDARKPRO-DYNAMIC-2026` | **主要使用，120x35** |

### 快速状态

| 配置项 | 状态 | 说明 |
|--------|------|------|
| 字体 | ✅ JetBrains Mono 17pt | 等宽字体，适合编码 |
| 行距 | ✅ 1.25 | 垂直间距，提高可读性 |
| 光标 | ✅ Vertical Bar (#7DCFFF) | 现代风格，不遮挡文字 |
| 对比度 | ✅ 6:1+ | WCAG AA+ 标准 |
| 透明度 | ✅ 0% | 完全不透明 |
| 抗锯齿 | ✅ 启用 | Retina 优化 |

---

## 文件结构

```
~/Documents/dotfiles/iterm2/
├── com.googlecode.iterm2.plist    # 主配置文件 (全局 + Profiles)
├── OneDarkPro.json                # 动态 Profile (自动重载)
├── OneDarkPro.itermcolors         # 颜色预设 (手动导入)
├── CONFIG.md                      # 本文档
└── README.md                      # 使用说明
```

### 配置文件映射

| 文件 | 作用域 | 更新方式 | 自动重载 |
|------|--------|----------|----------|
| `com.googlecode.iterm2.plist` | 全局设置 | 手动编辑或 iTerm2 GUI | 需重启 |
| `OneDarkPro.json` | Profile 配置 | 手动编辑 | ✅ 自动 |
| `OneDarkPro.itermcolors` | 颜色预设 | iTerm2 导入 | - |

### 动态 Profile 位置

```
~/Library/Application Support/iTerm2/DynamicProfiles/OneDarkPro.json
```

---

## 全局设置

### AI 功能配置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| AiModel | gpt-5.1 | AI 模型版本 |
| AiMaxTokens | 400000 | 最大令牌数 |
| AiResponseMaxTokens | 128000 | 响应最大令牌数 |
| AIFeatureStreamingResponses | true | 流式响应 |

### 窗口行为

| 配置项 | 值 | 说明 |
|--------|-----|------|
| Default Bookmark Guid | ONEDARKPRO-DYNAMIC-2026 | 默认 Profile |
| AlwaysOpenWindowAtStartup | false | 启动时不自动打开窗口 |
| AppleWindowTabbingMode | manual | 窗口标签模式 (手动) |

### 手势操作

| 手势 | 动作 |
|------|------|
| 三指上滑 | 下一个窗口 |
| 三指下滑 | 上一个窗口 |
| 三指左滑 | 上一个标签 |
| 三指右滑 | 下一个标签 |

---

## Profile 配置详解

### One Dark Pro (Dynamic) - 主要使用

#### 基本信息

| 配置项 | 值 | plist 键 |
|--------|-----|----------|
| 名称 | One Dark Pro (Dynamic) | `Name` |
| GUID | ONEDARKPRO-DYNAMIC-2026 | `Guid` |
| 父配置 | Default | `Dynamic Profile Parent Name` |

#### 窗口设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| 列数 (Columns) | 120 | 适合 80 字符代码 + 侧边栏 |
| 行数 (Rows) | 35 | 适合 MacBook 屏幕高度 |
| 窗口类型 | 2 | 普通窗口 |
| 禁止调整大小 | true | 保持固定尺寸 |

#### 字体设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| 正常字体 | JetBrainsMonoNLNFM-Regular 17 | 等宽字体，连字支持 |
| 非 ASCII 字体 | JetBrainsMonoNLNFM-Regular 17 | 中文等字符 |
| 水平间距 | 1.0 | 默认 |
| **垂直间距** | **1.25** | **散光优化** |
| 使用非 ASCII 字体 | true | 启用 |

> **为什么选择 JetBrains Mono?**
> - 专为编程设计的等宽字体
> - 支持连字 (Ligatures)，提高代码可读性
> - 区分度高的字符设计 (1lI, 0Oo 等)

#### 滚动设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| Scrollback Lines | 10000 | 滚动历史行数 |
| Unlimited Scrollback | false | 不使用无限滚动 |

> **为什么是 10000 行?**
> - 足够查看较长的构建输出
> - 不会占用过多内存
> - Git log 等命令输出完全覆盖

#### 光标设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| 光标类型 | **2 (Vertical Bar)** | **竖线光标** |
| 光标颜色 | #7DCFFF | 亮蓝色，高对比度 |
| 闪烁 | 启用 | 帮助定位光标位置 |

> **为什么选择 Vertical Bar?**
> - 类似现代编辑器 (VS Code, Sublime)
> - 不遮挡下方字符
> - 适合长时间输入
> - 散光用户更容易定位

**光标类型值对照:**
| 值 | 形状 | 适用场景 |
|----|------|----------|
| 0 | Block (方块) | Normal Mode，导航 |
| 1 | Underline (下划线) | 折中方案 |
| **2** | **Vertical Bar (竖线)** | **Insert Mode，输入** |

#### 终端设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| Terminal Type | xterm-256color | 标准 256 色支持 |
| ASCII Anti Aliased | true | ASCII 抗锯齿 |
| Non-ASCII Anti Aliased | true | 非 ASCII 抗锯齿 |
| Visual Bell | true | 视觉提示音 |
| Flashing Bell | false | 禁用闪烁 |

#### 热键设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| Has Hotkey | true | 启用热键 |
| HotKey Key Code | 49 | 数字 "1" 键 |
| HotKey Modifier Flags | 524288 | Command 键 |

> **快捷键**: `Cmd+1` 快速呼出 iTerm2 窗口

---

## 颜色配置

### One Dark Pro 配色方案

#### 基础颜色

| 名称 | Hex | RGB (0-1) | 用途 |
|------|-----|-----------|------|
| Background | `#282c34` | 0.157, 0.173, 0.204 | 深灰背景 |
| Foreground | `#abb2bf` | 0.671, 0.698, 0.749 | 浅灰文字 |
| Cursor | `#7DCFFF` | 0.49, 0.81, 1.0 | 光标颜色 |
| Selection | `#3e4451` | 0.243, 0.267, 0.318 | 选中背景 |
| Bold | `#abb2bf` | 0.671, 0.698, 0.749 | 粗体文字 |

#### ANSI 颜色

| ANSI | 名称 | Hex | RGB | 用途 |
|------|------|-----|-----|------|
| 0 | Black | `#3e4451` | 0.243, 0.267, 0.318 | 黑色 |
| 1 | Red | `#e06c75` | 0.878, 0.424, 0.459 | 红色 (错误) |
| 2 | Green | `#98c379` | 0.596, 0.765, 0.475 | 绿色 (成功) |
| 3 | Yellow | `#e5c07b` | 0.898, 0.753, 0.482 | 黄色 (警告) |
| **4** | **Blue** | **`#7DCFFF`** | **0.49, 0.81, 1.0** | **蓝色 (信息)** |
| 5 | Magenta | `#c678dd` | 0.776, 0.471, 0.867 | 品红 |
| 6 | Cyan | `#56b6c2` | 0.337, 0.714, 0.761 | 青色 |
| 7 | White | `#abb2bf` | 0.671, 0.698, 0.749 | 白色 (浅灰) |
| 8 | Bright Black | `#545862` | 0.329, 0.345, 0.384 | 亮黑 |
| 9 | Bright Red | `#e06c75` | 0.878, 0.424, 0.459 | 亮红 |
| 10 | Bright Green | `#98c379` | 0.596, 0.765, 0.475 | 亮绿 |
| 11 | Bright Yellow | `#e5c07b` | 0.898, 0.753, 0.482 | 亮黄 |
| **12** | **Bright Blue** | **`#7DCFFF`** | **0.49, 0.81, 1.0** | **亮蓝** |
| 13 | Bright Magenta | `#c678dd` | 0.776, 0.471, 0.867 | 亮品红 |
| 14 | Bright Cyan | `#56b6c2` | 0.337, 0.714, 0.761 | 亮青 |
| 15 | Bright White | `#dcdfe4` | 0.862, 0.875, 0.894 | 亮白 |

### 对比度优化

| 配置 | 原值 | 现值 | 原因 |
|------|------|------|------|
| Blue (Ansi 4/12) | `#61afef` | `#7DCFFF` | 提高对比度，改善可读性 |
| Cursor | `#61afef` | `#7DCFFF` | 与蓝色输出一致 |

**对比度计算** (基于 WCAG 2.1):
- `#7DCFFF` on `#282c34`: **约 6.5:1** ✅ WCAG AA+
- `#61afef` on `#282c34`: 约 4.8:1 ⚠️ 仅 WCAG AA

### Minimum Contrast 设置

**位置**: `iTerm2 → Settings → Profiles → Colors → Minimum Contrast`

**建议值**: 0.3 - 0.4 (30-40%)

此设置确保所有颜色组合满足最小对比度要求，对低视力用户特别有帮助。

---

## 更新流程

### 修改配置

1. **编辑 JSON 文件** (推荐)
   ```bash
   vim ~/Documents/dotfiles/iterm2/OneDarkPro.json
   ```

2. **重启 iTerm2** 或等待自动重载 (动态 Profile)

3. **验证配置生效**
   ```bash
   # 检查当前配置
   defaults read com.googlecode.iterm2
   ```

4. **提交到版本控制**
   ```bash
   cd ~/Documents/dotfiles
   git add iterm2/
   git commit -m "iterm2: update configuration"
   ```

### 颜色转换

从 Hex 到 RGB (0-1) 的转换:

```
#7DCFFF
R = 0x7D / 255 = 0.49
G = 0xCF / 255 = 0.81
B = 0xFF / 255 = 1.0
```

---

## 变更历史

### 2025-01-15

- ✅ 更新蓝色从 `#61afef` 到 `#7DCFFF` (提高对比度)
- ✅ 添加 Vertical Bar 光标配置
- ✅ 创建 CONFIG.md 文档
- ✅ 更新 README.md 链接

### 2025-01-XX

- ✅ 移除 BlueDolphin 主题
- ✅ 设置 One Dark Pro 为默认 Profile
- ✅ 配置热键 Cmd+1

---

## 参考资料

### 官方文档

- [iTerm2 Documentation](https://iterm2.com/documentation-one-page.html)
- [Colors Preferences](https://iterm2.com/documentation-preferences-profiles-colors.html)
- [Text Preferences](https://iterm2.com/documentation-preferences-profiles-text.html)

### 可访问性

- [WCAG 2.2 Contrast Requirements](https://www.w3.org/TR/WCAG22/)
- [Understanding WCAG Contrast](https://webaim.org/articles/contrast/)
- [iTerm2 Minimum Contrast](https://gitlab.com/gnachman/iterm2/-/issues/1811)

### 社区资源

- [Cursor Shape Discussion](https://www.reddit.com/r/commandline/comments/8a6n8h/thoughts_on_box_vs_underbar_vs_vertical_line/)
- [Complete iTerm2 Configuration Guide](https://www.oreateai.com/blog/complete-guide-to-iterm2-configuration-and-optimization/)
