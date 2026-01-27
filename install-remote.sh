#!/bin/bash
# ============================================
# Dotfiles 远程一键安装脚本
# ============================================
# 用法: curl -fsSL https://raw.githubusercontent.com/sumulige/dotfiles/master/install-remote.sh | bash
# 或:   curl -fsSL https://raw.githubusercontent.com/sumulige/dotfiles/master/install-remote.sh | bash -s -- full
#
# 参数:
#   core   - 仅安装核心包
#   tools  - 核心包 + 工具包
#   full   - 完整安装 (默认)
#   sync   - 仅同步配置

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() { echo -e "${BLUE}➜${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; exit 1; }

# 配置
REPO_URL="https://github.com/sumulige/dotfiles.git"
DOTFILES_DIR="$HOME/Documents/dotfiles"
INSTALL_LEVEL="${1:-full}"

# ============================================
# 主流程
# ============================================
main() {
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}   Sumulige Dotfiles 远程安装${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""

    # 检查 Git
    if ! command -v git &> /dev/null; then
        print_error "Git 未安装，请先安装 Git"
    fi

    # 检查目标目录
    if [ -d "$DOTFILES_DIR" ]; then
        print_warning "目录已存在: $DOTFILES_DIR"
        print_step "正在更新..."
        cd "$DOTFILES_DIR"
        git pull --rebase
    else
        print_step "克隆仓库到 $DOTFILES_DIR..."
        mkdir -p "$(dirname "$DOTFILES_DIR")"
        git clone "$REPO_URL" "$DOTFILES_DIR"
    fi

    # 运行安装脚本
    print_step "运行安装脚本 (level: $INSTALL_LEVEL)..."
    cd "$DOTFILES_DIR"
    chmod +x install.sh
    ./install.sh "$INSTALL_LEVEL"

    # 完成
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}   安装完成！${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "Dotfiles 已安装到: $DOTFILES_DIR"
    echo ""
    echo "快速命令:"
    echo "  cd $DOTFILES_DIR   # 进入配置目录"
    echo "  ./install.sh sync  # 同步配置"
    echo "  git pull           # 更新配置"
    echo ""
}

main "$@"
