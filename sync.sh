#!/bin/bash
# ============================================
# Dotfiles 配置同步脚本
# ============================================
# 用途: 将 dotfiles 仓库中的配置同步到系统目录
# 用法: ./sync.sh [--quiet]
#
# 特点:
#   - 使用 symlink 而非复制（修改即同步）
#   - 备份已存在的非 symlink 文件
#   - 幂等操作（可重复运行）
#   - 支持静默模式（用于 git hooks）

set -e

# ============================================
# 配置
# ============================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
QUIET="${1:-}"

# 颜色定义
if [[ "$QUIET" != "--quiet" ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    NC='\033[0m'
else
    RED='' GREEN='' YELLOW='' BLUE='' NC=''
fi

# ============================================
# 辅助函数
# ============================================
log_info()    { [[ "$QUIET" != "--quiet" ]] && echo -e "${BLUE}➜${NC} $1"; }
log_success() { [[ "$QUIET" != "--quiet" ]] && echo -e "${GREEN}✓${NC} $1"; }
log_warning() { [[ "$QUIET" != "--quiet" ]] && echo -e "${YELLOW}⚠${NC} $1"; }
log_error()   { echo -e "${RED}✗${NC} $1" >&2; }

# 创建 symlink（带备份）
# 用法: safe_link <source> <target>
safe_link() {
    local source="$1"
    local target="$2"
    local target_dir="$(dirname "$target")"

    # 确保源文件存在
    if [[ ! -e "$source" ]]; then
        log_warning "源文件不存在，跳过: $source"
        return 0
    fi

    # 确保目标目录存在
    mkdir -p "$target_dir"

    # 如果目标已经是正确的 symlink，跳过
    if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
        log_info "已链接: $target"
        return 0
    fi

    # 如果目标存在（文件/目录/其他 symlink），备份
    if [[ -e "$target" ]] || [[ -L "$target" ]]; then
        mkdir -p "$BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
        log_warning "已备份: $target → $BACKUP_DIR/"
    fi

    # 创建 symlink
    ln -sf "$source" "$target"
    log_success "已链接: $target → $source"
}

# ============================================
# 同步配置
# ============================================
sync_zsh() {
    log_info "同步 Zsh 配置..."
    # 注意：实际使用的是 ~/.zshrc，可能与 dotfiles 不同
    # 只同步 .zimrc，保留用户自定义的 .zshrc
    safe_link "$DOTFILES_DIR/zsh/.zimrc" "$HOME/.zimrc"

    # 如果用户没有 .zshrc，则链接模板
    if [[ ! -e "$HOME/.zshrc" ]]; then
        safe_link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    else
        log_info "保留现有 ~/.zshrc（如需更新请手动操作）"
    fi
}

sync_git() {
    log_info "同步 Git 配置..."
    safe_link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

    # gitignore_global 如果存在
    if [[ -f "$DOTFILES_DIR/git/.gitignore_global" ]]; then
        safe_link "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"
    fi
}

sync_nvim() {
    log_info "同步 Neovim 配置..."
    safe_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
}

sync_ghostty() {
    log_info "同步 Ghostty 配置..."
    mkdir -p "$HOME/.config/ghostty"
    safe_link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
    safe_link "$DOTFILES_DIR/ghostty/themes" "$HOME/.config/ghostty/themes"
}

sync_iterm2() {
    log_info "同步 iTerm2 配置..."
    # iTerm2 配置比较特殊，不使用 symlink
    # 只提示用户手动导入 Profile
    local iterm_plist="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
    if [[ -f "$iterm_plist" ]]; then
        log_info "iTerm2 配置已存在，如需更新请手动导入:"
        log_info "  Profile: $DOTFILES_DIR/iterm2/OneDarkPro.json"
    fi
}

sync_starship() {
    log_info "同步 Starship 配置..."
    if [[ -f "$DOTFILES_DIR/starship/starship.toml" ]]; then
        safe_link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
    fi
}

sync_atuin() {
    log_info "同步 Atuin 配置..."
    if [[ -f "$DOTFILES_DIR/atuin/config.toml" ]]; then
        mkdir -p "$HOME/.config/atuin"
        safe_link "$DOTFILES_DIR/atuin/config.toml" "$HOME/.config/atuin/config.toml"
    fi
}

# ============================================
# 安装 Git Hooks
# ============================================
install_hooks() {
    log_info "安装 Git Hooks..."
    local hooks_source="$DOTFILES_DIR/hooks/git"
    local hooks_target="$DOTFILES_DIR/.git/hooks"

    if [[ -d "$hooks_source" ]]; then
        for hook in "$hooks_source"/*; do
            if [[ -f "$hook" ]]; then
                local hook_name="$(basename "$hook")"
                cp "$hook" "$hooks_target/$hook_name"
                chmod +x "$hooks_target/$hook_name"
                log_success "已安装 hook: $hook_name"
            fi
        done
    fi
}

# ============================================
# 主流程
# ============================================
main() {
    if [[ "$QUIET" != "--quiet" ]]; then
        echo -e "${BLUE}========================================${NC}"
        echo -e "${BLUE}   Dotfiles 配置同步${NC}"
        echo -e "${BLUE}========================================${NC}"
        echo ""
    fi

    # 同步各配置
    sync_zsh
    sync_git
    sync_nvim
    sync_ghostty
    sync_iterm2
    sync_starship
    sync_atuin

    # 安装 hooks
    install_hooks

    if [[ "$QUIET" != "--quiet" ]]; then
        echo ""
        log_success "同步完成！"

        if [[ -d "$BACKUP_DIR" ]]; then
            echo ""
            log_warning "已备份的文件位于: $BACKUP_DIR"
        fi
    fi
}

main "$@"
