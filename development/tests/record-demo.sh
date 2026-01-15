#!/bin/bash
# asciinema 录制脚本
# 使用方法：asciinema rec demo.cast -c "./record-demo.sh"
#
# 录制前检查：
# 1. 确保已安装 asciinema: brew install asciinema
# 2. 确保终端窗口足够宽 (建议 120 列)
# 3. 确保没有敏感信息在提示符中

set -e

# 录制开始前的等待时间（让你准备）
echo "=========================================="
echo "   Dotfiles 功能演示录制"
echo "=========================================="
echo ""
echo "录制将在 3 秒后开始..."
sleep 3

echo ""
echo "=== 1. Shell 信息 ==="
echo "Shell: $ZSH_VERSION"
echo "用户: $USER"
echo ""

echo "=== 2. Shell 启动时间 ==="
time zsh -i -c "echo 'Shell 已启动'"
echo ""

echo "=== 3. 现代工具版本 ==="
echo "atuin:    $(atuin --version 2>/dev/null | head -1)"
echo "zoxide:   $(zoxide --version 2>/dev/null | head -1)"
echo "direnv:   $(direnv --version 2>/dev/null | head -1)"
echo "eza:      $(eza --version 2>/dev/null | head -1)"
echo "bat:      $(bat --version 2>/dev/null | head -1)"
echo "ripgrep:  $(rg --version 2>/dev/null | head -1)"
echo "fzf:      $(fzf --version 2>/dev/null | head -1)"
echo "lazygit:  $(lazygit --version 2>/dev/null | head -1)"
echo ""

echo "=== 4. 文件列表演示 (eza) ==="
eza -la --icons ~/Documents/dotfiles | head -10
echo ""

echo "=== 5. 语法高亮演示 (bat) ==="
echo "# 这是一个示例配置文件" > /tmp/demo-config.txt
echo "export MY_VAR='value'" >> /tmp/demo-config.txt
cat /tmp/demo-config.txt
echo ""

echo "=== 6. 快速搜索演示 (ripgrep) ==="
cd ~/Documents/dotfiles
rg -l "test" --type sh | head -5
echo ""

echo "=== 7. Git 状态演示 ==="
git status --short | head -5
echo ""

echo "=== 8. AI 记忆系统 ==="
ls -lh ~/Documents/dotfiles/.claude/*.md
echo ""

echo "=== 录制完成 ==="
echo ""
echo "检查录制的文件："
echo "  asciinema play demo.cast"
echo ""
echo "上传到 asciinema（可选）："
echo "  asciinema upload demo.cast"
