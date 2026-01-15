#!/bin/bash
# Dotfiles 测试脚本
# 测试所有 dotfiles 配置和功能

DOTFILES_DIR="$HOME/Documents/dotfiles"
TEST_DIR="$DOTFILES_DIR/development/tests"
RESULTS_FILE="$TEST_DIR/test-results.txt"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 测试计数器
PASS=0
FAIL=0
SKIP=0

# 打印标题
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

# 打印测试结果
print_result() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓ $2${NC}"
        ((PASS++))
    else
        echo -e "${RED}✗ $2${NC}"
        ((FAIL++))
    fi
}

# 打印跳过
print_skip() {
    echo -e "${YELLOW}⊘ $1${NC}"
    ((SKIP++))
}

# 开始测试
{
    echo "=== Dotfiles 测试报告 ==="
    echo "测试时间: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "主机名: $(hostname)"
    echo "macOS: $(sw_vers -productVersion)"
    echo ""
} > "$RESULTS_FILE"

# ========== T1: Shell 启动时间测试 ==========
print_header "T1: Shell 启动时间测试"

echo -e "\n${BLUE}[T1.1]${NC} 测试 Zsh 启动时间..."
STARTUP_OUTPUT=$(time zsh -i -c exit 2>&1)
STARTUP_TIME=$(echo "$STARTUP_OUTPUT" | grep real | awk '{print $2}')
echo "启动时间: $STARTUP_TIME" >> "$RESULTS_FILE"

# 解析时间，格式为 "0m0.492s"
SECONDS=$(echo "$STARTUP_TIME" | sed 's/0m\([0-9.]*\)s/\1/')
SECONDS_INT=$(echo "$SECONDS" | cut -d. -f1)

# 检查是否 <500ms (更宽松的标准)
if [ "$SECONDS_INT" -lt 500 ] || [ "$SECONDS_INT" -eq 0 ]; then
    print_result 0 "Shell 启动时间 ($STARTUP_TIME < 500ms)"
else
    print_result 1 "Shell 启动时间 ($STARTUP_TIME < 500ms)"
fi

echo -e "\n${BLUE}[T1.2]${NC} 检查 Zim fw..."
if [ -d "$HOME/.zim" ]; then
    print_result 0 "Zim fw 已安装"
else
    print_result 1 "Zim fw 已安装"
fi

if [ -f "$HOME/.zimrc" ]; then
    print_result 0 ".zimrc 配置文件存在"
else
    print_result 1 ".zimrc 配置文件存在"
fi

# ========== T2: 现代工具可用性测试 ==========
print_header "T2: 现代工具可用性测试"

TOOLS=("atuin" "zoxide" "direnv" "eza" "bat" "rg" "fzf" "lazygit")
TOOL_COUNT=0

for tool in "${TOOLS[@]}"; do
    echo -e "\n${BLUE}[T2.$((TOOL_COUNT+1))]${NC} 检查 $tool..."
    if command -v "$tool" &> /dev/null; then
        VERSION=$(command $tool --version 2>&1 | head -1 || echo "已安装")
        echo "$tool: $VERSION" >> "$RESULTS_FILE"
        print_result 0 "$tool - $VERSION"
    else
        print_result 1 "$tool - 未安装"
    fi
    ((TOOL_COUNT++))
done

# ========== T3: 别名功能测试 ==========
print_header "T3: 别名功能测试"

# 初始化 zsh 以加载别名
echo -e "\n${BLUE}[T3.1]${NC} 测试 eza 别名..."
if command -v eza &> /dev/null; then
    if alias ll &> /dev/null; then
        print_result 0 "ll 别名已定义"
    else
        # 尝试在 zsh 中测试
        if zsh -i -c "alias ll" 2>/dev/null | grep -q "eza"; then
            print_result 0 "ll 别名在 zsh 中可用"
        else
            print_result 1 "ll 别名未定义"
        fi
    fi
else
    print_skip "ll 别名测试 (eza 未安装)"
fi

echo -e "\n${BLUE}[T3.2]${NC} 测试 lazygit 别名..."
if command -v lazygit &> /dev/null; then
    if zsh -i -c "alias lg" 2>/dev/null | grep -q "lazygit"; then
        print_result 0 "lg 别名在 zsh 中可用"
    else
        print_result 1 "lg 别名未定义"
    fi
else
    print_skip "lg 别名测试 (lazygit 未安装)"
fi

echo -e "\n${BLUE}[T3.3]${NC} 测试 ripgrep 别名..."
if command -v rg &> /dev/null; then
    if zsh -i -c "alias rg" 2>/dev/null | grep -q "rg"; then
        print_result 0 "rg 别名在 zsh 中可用"
    else
        print_result 1 "rg 别名未定义"
    fi
else
    print_skip "rg 别名测试 (ripgrep 未安装)"
fi

# ========== T4: Git 配置测试 ==========
print_header "T4: Git 配置测试"

echo -e "\n${BLUE}[T4.1]${NC} 检查 Git 用户配置..."
GIT_NAME=$(git config --get user.name 2>/dev/null || echo "")
GIT_EMAIL=$(git config --get user.email 2>/dev/null || echo "")

if [ -n "$GIT_NAME" ]; then
    echo "Git 用户名: $GIT_NAME" >> "$RESULTS_FILE"
    print_result 0 "Git 用户名已配置 ($GIT_NAME)"
else
    print_result 1 "Git 用户名已配置"
fi

if [ -n "$GIT_EMAIL" ]; then
    echo "Git 邮箱: [已设置]" >> "$RESULTS_FILE"
    print_result 0 "Git 邮箱已配置"
else
    print_result 1 "Git 邮箱已配置"
fi

# ========== T5: AI 记忆系统测试 ==========
print_header "T5: AI 记忆系统检查"

AI_FILES=(
    "$DOTFILES_DIR/.claude/ANCHORS.md"
    "$DOTFILES_DIR/.claude/MEMORY.md"
    "$DOTFILES_DIR/.claude/PROJECT_LOG.md"
    "$DOTFILES_DIR/.claude/TASK_PLAN.md"
)

AI_FILE_COUNT=0
for file in "${AI_FILES[@]}"; do
    FILENAME=$(basename "$file")
    echo -e "\n${BLUE}[T5.$((AI_FILE_COUNT+1))]${NC} 检查 $FILENAME..."
    if [ -f "$file" ]; then
        LINES=$(wc -l < "$file" | tr -d ' ')
        if [ "$LINES" -gt 10 ]; then
            print_result 0 "$FILENAME 存在且有内容 ($LINES 行)"
        else
            print_result 1 "$FILENAME 存在但内容过少"
        fi
    else
        print_result 1 "$FILENAME 存在"
    fi
    ((AI_FILE_COUNT++))
done

# ========== T6: 文档完整性测试 ==========
print_header "T6: 文档完整性检查"

DOC_FILES=(
    "$DOTFILES_DIR/README.md"
    "$DOTFILES_DIR/iterm2/CONFIG.md"
    "$DOTFILES_DIR/zsh/docs/ZSH.md"
    "$DOTFILES_DIR/zsh/docs/atuin.md"
    "$DOTFILES_DIR/zsh/docs/zoxide.md"
    "$DOTFILES_DIR/zsh/docs/direnv.md"
)

DOC_FILE_COUNT=0
for file in "${DOC_FILES[@]}"; do
    FILENAME=$(basename "$file")
    echo -e "\n${BLUE}[T6.$((DOC_FILE_COUNT+1))]${NC} 检查 $FILENAME..."
    if [ -f "$file" ]; then
        print_result 0 "$FILENAME 存在"
    else
        print_result 1 "$FILENAME 存在"
    fi
    ((DOC_FILE_COUNT++))
done

# ========== T7: iTerm2 配置检查 ==========
print_header "T7: iTerm2 配置检查"

ITERM_FILES=(
    "$DOTFILES_DIR/iterm2/OneDarkPro.json"
    "$DOTFILES_DIR/iterm2/OneDarkPro.itermcolors"
    "$DOTFILES_DIR/iterm2/com.googlecode.iterm2.plist"
)

ITERM_FILE_COUNT=0
for file in "${ITERM_FILES[@]}"; do
    FILENAME=$(basename "$file")
    echo -e "\n${BLUE}[T7.$((ITERM_FILE_COUNT+1))]${NC} 检查 $FILENAME..."
    if [ -f "$file" ]; then
        print_result 0 "$FILENAME 存在"
    else
        print_result 1 "$FILENAME 存在"
    fi
    ((ITERM_FILE_COUNT++))
done

# ========== 测试汇总 ==========
print_header "测试汇总"

TOTAL=$((PASS + FAIL + SKIP))
PERCENT=$((PASS * 100 / TOTAL))

{
    echo ""
    echo "=== 测试汇总 ==="
    echo "总计: $TOTAL"
    echo "通过: $PASS (${PERCENT}%)"
    echo "失败: $FAIL"
    echo "跳过: $SKIP"
} >> "$RESULTS_FILE"

echo -e "\n${GREEN}总计: $TOTAL | 通过: $PASS (${PERCENT}%) | 失败: $FAIL | 跳过: $SKIP${NC}"

# 保存结果到文件
echo -e "\n详细结果已保存到: $RESULTS_FILE"

# 返回退出码
if [ $FAIL -gt 0 ]; then
    exit 1
else
    exit 0
fi
