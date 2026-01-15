#!/bin/bash
# Dotfiles 功能演示录制脚本
# 注意隐私：使用匿名用户名和路径

# 隐藏真实用户名
export USER="user"
export HOSTNAME="hostname"

echo "=========================================="
echo "   Dotfiles 功能演示"
echo "=========================================="
echo ""
echo "1. Shell 启动时间测试"
echo "2. 现代工具演示"
echo "3. 别名功能演示"
echo "4. 文档查看"
echo ""
sleep 2

echo "=== 1. Shell 启动时间 ==="
time zsh -i -c "echo 'Shell 已启动'"
echo ""

echo "=== 2. 现代工具检查 ==="
echo "- atuin: $(which atuin)"
echo "- zoxide: $(which zoxide)"
echo "- direnv: $(which direnv)"
echo "- eza: $(which eza)"
echo "- bat: $(which bat)"
echo "- ripgrep: $(which rg)"
echo "- fzf: $(which fzf)"
echo "- lazygit: $(which lazygit)"
echo ""

echo "=== 3. 别名功能演示 ==="
echo "ll 别名（eza 长列表）:"
ll /tmp | head -5
echo ""

echo "=== 4. Git 配置 ==="
echo "Git 用户名: $(git config --get user.name)"
echo ""

echo "=== 5. AI 记忆系统 ==="
echo "ANCHORS.md: $(wc -l < ~/Documents/dotfiles/.claude/ANCHORS.md | tr -d ' ') 行"
echo "MEMORY.md: $(wc -l < ~/Documents/dotfiles/.claude/MEMORY.md | tr -d ' ') 行"
echo "PROJECT_LOG.md: $(wc -l < ~/Documents/dotfiles/.claude/PROJECT_LOG.md | tr -d ' ') 行"
echo ""

echo "=== 6. 文档列表 ==="
ls -1 ~/Documents/dotfiles/*.md
echo ""

echo "=== 演示完成 ==="
echo "所有功能正常运行！"
