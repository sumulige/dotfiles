# asciinema 嵌入代码

> 在 GitHub README 或其他地方嵌入 asciinema 录制

---

## 选项一：直接链接（推荐用于 GitHub）

```markdown
[![asciicast](https://asciinema.org/a/placeholder.svg)](https://asciinema.org/a/placeholder)
```

**说明**: 需要先上传到 asciinema.org 获取 ID。

---

## 选项二：HTML 嵌入（适用于支持 HTML 的页面）

```html
<script src="https://asciinema.org/a/placeholder.js" id="asciicast-placeholder" async></script>
```

**自定义尺寸**:
```html
<script src="https://asciinema.org/a/placeholder.js?size=medium" id="asciicast-placeholder" async></script>
```

**参数选项**:
- `size=small` - 小尺寸
- `size=medium` - 中等尺寸
- `t=30` - 从 30 秒开始
- `speed=2` - 2 倍速

---

## 选项三：本地 cast 文件（用于自托管）

```markdown
[查看终端演示](development/tests/demo.cast)
```

**提示**: 用户需要先安装 asciinema 才能播放：
```bash
brew install asciinema
asciinema play development/tests/demo.cast
```

---

## 选项四：GIF 动图（使用 agg 转换）

```bash
# 安装 agg (asciinema to GIF converter)
brew install agg

# 转换为 GIF
agg demo.cast demo.gif
```

然后在 Markdown 中：
```markdown
![终端演示](development/tests/demo.gif)
```

---

## 上传到 asciinema.org

```bash
# 上传录制文件
asciinema upload development/tests/demo.cast

# 输出示例：
# View the recording at https://asciinema.org/a/xxxxx
```

上传后可获得嵌入代码和预览图。

---

## 推荐方案对比

| 方案 | 优点 | 缺点 | 适用场景 |
|------|------|------|----------|
| asciinema.org 链接 | 在线播放，易分享 | 需要网络 | 公开项目 |
| 本地 .cast 文件 | 完全离线 | 需要本地安装 | 私有项目 |
| GIF 转换 | 无需播放器 | 文件大，无交互 | 快速预览 |
| HTML 嵌入 | 播放器完整 | GitHub 不支持 | 独立网站 |

---

## 当前项目建议

**GitHub README**:
```markdown
## 演示

[![asciicast](https://asciinema.org/a/[你的ID].svg)](https://asciinema.org/a/[你的ID])

或下载本地播放：
```bash
git clone https://github.com/sumulige/dotfiles.git
cd dotfiles
asciinema play development/tests/demo.cast
```
```
