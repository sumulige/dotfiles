# asciinema 录制指南

> 创建可播放的终端演示录制

---

## 录制步骤

### 1. 安装 asciinema（如未安装）

```bash
brew install asciinema
```

### 2. 执行录制

```bash
cd ~/Documents/dotfiles/development/tests

# 方式一：直接录制脚本
asciinema rec demo.cast -c "./record-demo.sh"

# 方式二：交互式录制（更灵活）
asciinema rec demo.cast
# 然后手动执行想要演示的命令
```

### 3. 预览录制

```bash
asciinema play demo.cast
```

### 4. 检查敏感信息

```bash
# 查看录制内容（纯文本 JSON）
cat demo.cast | grep -v "xxxx"
# 或用编辑器打开检查
```

### 5. 完成

如果满意，通知 AI 处理；不满意则删除重录：
```bash
rm demo.cast
```

---

## 录制内容检查清单

录制前确保不包含：

- [ ] 真实邮箱地址
- [ ] API 密钥或 Token
- [ ] 密码输入
- [ ] 敏感路径（如 ~/.ssh）
- [ ] 私人信息（真实姓名、地址等）

---

## 隐私处理

如果录制包含敏感信息：

```bash
# 方式一：编辑 .cast 文件（JSON 格式）
# .cast 文件是 JSON 数组，每行一个事件
# 可以手动删除或替换敏感行

# 方式二：使用 asciinema 的编辑工具（需要安装）
# asciinema-edit demo.cast --output demo-edited.cast
```

---

## 录制建议

1. **终端窗口**: 建议宽度 120 列以上
2. **字体大小**: 适中，方便观看
3. **主题**: 使用深色主题（One Dark Pro）
4. **打字速度**: 不宜太快
5. **等待时间**: 命令间适当停顿
6. **内容长度**: 建议 30-60 秒

---

## 录制完成后

将 `demo.cast` 文件放到 `development/tests/` 目录，然后通知 AI：

> "录制完成，请处理 demo.cast"

AI 将会：
1. 读取 cast 文件内容
2. 提取关键信息
3. 更新到测试文档中
4. 生成嵌入代码（可选）
