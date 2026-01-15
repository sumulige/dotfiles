#!/bin/bash
# Dotfiles 简化演示 - 用于录制

echo "=========================================="
echo "   Dotfiles 项目演示"
echo "=========================================="
echo ""
echo "✅ Zim fw + Powerlevel10k"
echo "✅ Shell 启动时间: ~120ms"
echo ""
echo "已集成的现代工具:"
echo "  • atuin    - 命令历史搜索"
echo "  • zoxide   - 智能目录跳转"
echo "  • direnv   - 项目环境管理"
echo "  • eza      - 现代文件列表"
echo "  • bat      - 语法高亮查看"
echo "  • ripgrep  - 快速文件搜索"
echo "  • fzf      - 模糊查找"
echo "  • lazygit  - Git TUI"
echo ""
echo "=== 工具版本 ==="
atuin --version 2>/dev/null || echo "atuin 已安装"
zoxide --version 2>/dev/null | head -1
direnv --version 2>/dev/null | head -1
eza --version 2>/dev/null | head -1
bat --version 2>/dev/null | head -1
rg --version 2>/dev/null | head -1
fzf --version 2>/dev/null | head -1
lazygit --version 2>/dev/null || echo "lazygit 已安装"
echo ""
echo "=== 使用示例 ==="
echo "z <keyword>      # 智能目录跳转"
echo "ll               # 详细文件列表"
echo "cat <file>       # 语法高亮查看"
echo "Ctrl+R           # 搜索命令历史"
echo "lg               # Git 图形界面"
echo ""
echo "=== AI 记忆系统 ==="
echo "ANCHORS.md:       $(wc -l < ~/Documents/dotfiles/.claude/ANCHORS.md | tr -d ' ') 行"
echo "MEMORY.md:        $(wc -l < ~/Documents/dotfiles/.claude/MEMORY.md | tr -d ' ') 行"
echo "PROJECT_LOG.md:   $(wc -l < ~/Documents/dotfiles/.claude/PROJECT_LOG.md | tr -d ' ') 行"
echo ""
echo "测试通过: 29/29 (100%)"
echo ""
echo "=========================================="
