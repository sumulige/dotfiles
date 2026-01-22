#!/bin/bash
# ============================================
# Dotfiles 一键安装脚本
# ============================================
# 用途: 新电脑快速搭建开发环境
# 用法: ./install.sh [core|tools|full|sync]
#
# 安装层级:
#   core   - 核心包 (必需)
#   tools  - 工具包 (开发增强)
#   full   - 完整安装 (core + tools + 配置链接)
#   sync   - 仅同步配置 + 安装 git hooks（推荐 clone 后首次运行）

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_step() { echo -e "${BLUE}➜${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

# 获取脚本目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"

# ============================================
# 检查 Homebrew
# ============================================
check_brew() {
    print_step "检查 Homebrew..."
    if ! command -v brew &> /dev/null; then
        print_step "安装 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Apple Silicon 补丁
        if [[ $(uname -m) == 'arm64' ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    else
        print_success "Homebrew 已安装 ($(brew --version | head -1))"
    fi
}

# ============================================
# 配置 brew 性能优化
# ============================================
configure_brew() {
    print_step "配置 Homebrew 优化..."

    # 禁用 auto-update (关键性能优化)
    if ! grep -q "HOMEBREW_NO_AUTO_UPDATE=1" ~/.zshrc 2>/dev/null; then
        echo '' >> ~/.zshrc
        echo '# Homebrew 性能优化' >> ~/.zshrc
        echo 'export HOMEBREW_NO_AUTO_UPDATE=1' >> ~/.zshrc
        echo 'export HOMEBREW_NO_INSTALL_CLEANUP=1' >> ~/.zshrc
        print_success "已添加 HOMEBREW_NO_AUTO_UPDATE 到 .zshrc"
    else
        print_success "HOMEBREW_NO_AUTO_UPDATE 已配置"
    fi

    # 停止自动更新服务
    if brew autoupdate status 2>/dev/null | grep -q "started"; then
        brew autoupdate delete 2>/dev/null || true
        print_success "已停止 Homebrew 自动更新服务"
    fi
}

# ============================================
# 安装核心包
# ============================================
install_core() {
    print_step "安装核心包..."
    cd "$DOTFILES_DIR"
    brew bundle --file=brew/Brewfile.core --verbose
    print_success "核心包安装完成"
}

# ============================================
# 安装工具包
# ============================================
install_tools() {
    print_step "安装工具包..."
    cd "$DOTFILES_DIR"
    brew bundle --file=brew/Brewfile.tools --verbose
    print_success "工具包安装完成"
}

# ============================================
# 链接配置文件
# ============================================
link_dotfiles() {
    print_step "链接配置文件..."

    # Zsh
    ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
    ln -sf "$DOTFILES_DIR/zsh/.zimrc" ~/.zimrc
    print_success "Zsh 配置已链接"

    # Git
    mkdir -p ~/.config/git
    ln -sf "$DOTFILES_DIR/git/.gitconfig ~/.gitconfig"
    ln -sf "$DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global
    print_success "Git 配置已链接"

    # Neovim
    ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
    print_success "Neovim 配置已链接"
}

# ============================================
# 初始化 Zim fw
# ============================================
initialize_zim() {
    print_step "初始化 Zim fw..."
    if [ ! -d ~/.zim ]; then
        zimfw install
        print_success "Zim fw 已初始化"
    else
        print_success "Zim fw 已存在，跳过"
    fi
}

# ============================================
# 清理
# ============================================
cleanup() {
    print_step "清理 Homebrew 缓存..."
    brew cleanup --prune=all -s
    print_success "清理完成"
}

# ============================================
# 显示完成信息
# ============================================
show_completion() {
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}   安装完成！${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "下一步："
    echo "  1. 重启终端"
    echo "  2. 运行: zimfw install"
    echo "  3. 配置 iTerm2: 导入 iterm2/OneDarkPro.json"
    echo "  4. 配置 atuin: atuin register && atuin import zsh"
    echo "  5. 启动 Neovim 自动安装插件: nvim"
    echo ""
    echo "管理命令："
    echo "  brew update       # 更新 brew"
    echo "  brew upgrade      # 升级包"
    echo "  brew cleanup      # 清理缓存"
    echo ""
}

# ============================================
# 主流程
# ============================================
main() {
    local LEVEL="${1:-full}"

    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}   Dotfiles 安装${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo "安装层级: $LEVEL"
    echo ""

    check_brew
    configure_brew

    case "$LEVEL" in
        core)
            install_core
            ;;
        tools)
            install_core
            install_tools
            ;;
        sync)
            # 仅同步配置 + 安装 hooks（适合 clone 后或 pull 更新后）
            print_step "运行配置同步..."
            "$DOTFILES_DIR/sync.sh"
            return 0
            ;;
        full|*)
            install_core
            install_tools
            link_dotfiles
            initialize_zim
            cleanup
            ;;
    esac

    show_completion
}

# 运行主流程
main "$@"
