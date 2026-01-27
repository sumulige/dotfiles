# =============================================================================
# Zsh Configuration with Zim Framework
# =============================================================================

# -----------------
# Zsh configuration
# -----------------

# History
setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Input/output
bindkey -e

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

# zsh-autosuggestions: Disable automatic widget re-binding on each precmd.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# zsh-syntax-highlighting: Set what highlighters will be used.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# =============================================================================
# ⚡ STARSHIP PROMPT (must be after Zim to avoid compinit conflict)
# =============================================================================
eval "$(starship init zsh)"

# =============================================================================
# Custom Configuration
# =============================================================================

# ===== Editor =====
export EDITOR="code"

# ===== Path =====
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# ===== Python Version Manager (pyenv) - Lazy Load =====
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# 懒加载 pyenv：仅在首次调用 python/pip 时初始化
_pyenv_load() {
  # 防止重复加载
  (( $_PYENV_LOADED )) && return 0
  _PYENV_LOADED=1
  unfunction python pip python3 pip3 pyenv 2>/dev/null
  eval "$(command pyenv init - zsh)"
}
python() { _pyenv_load && command python "$@" }
pip() { _pyenv_load && command pip "$@" }
python3() { _pyenv_load && command python3 "$@" }
pip3() { _pyenv_load && command pip3 "$@" }
pyenv() { _pyenv_load && command pyenv "$@" }

# ===== Node Version Manager (fnm) - Lazy Load =====
# 懒加载 fnm：仅在首次调用 node/npm 时初始化
export PATH="$HOME/.local/share/fnm:$PATH"
_fnm_load() {
  # 防止重复加载
  (( $_FNM_LOADED )) && return 0
  _FNM_LOADED=1
  unfunction node npm npx yarn pnpm 2>/dev/null
  eval "$(fnm env --use-on-cd --shell zsh)"
}
node() { _fnm_load && command node "$@" }
npm() { _fnm_load && command npm "$@" }
npx() { _fnm_load && command npx "$@" }
yarn() { _fnm_load && command yarn "$@" }
pnpm() { _fnm_load && command pnpm "$@" }

# ===== China Mirrors =====
export PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# ===== Modern Tools =====
# atuin - magical shell history (keeps eval as it modifies key bindings)
eval "$(atuin init zsh)"

# zoxide - smarter cd command
eval "$(zoxide init zsh)"

# direnv - automatic environment loading
eval "$(direnv hook zsh)"

# ===== Enhanced CLI Tools =====

# fzf - fuzzy finder
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

# bat - better cat
alias cat="bat --paging=never"
alias catp="bat"

# eza - better ls
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first"
alias lt="eza --tree --level=2 --icons"

# ripgrep
alias rg="rg --smart-case"

# lazygit
alias lg="lazygit"

# htop
alias top="htop"

# ===== Aliases =====
alias ..="cd .."
alias ...="cd ../.."
alias cls="clear"

# ===== Git Aliases =====
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline -10"
alias gd="git diff"

# ===== AI Support =====
export CLAUDE_AUTO_UPDATE_PROMPT=false

# Claude Code 快捷命令
alias cc='claude'
alias ccc='claude --continue'
alias ccr='claude --resume'

# ===== Pager Configuration =====
# 让 less 内容保留在主屏幕，不使用 alternate screen
export LESS='-R -X -F'

# Sumulige CLI Tools - Use Local Development Version
# Use full node path to avoid fnm lazy loading issues
alias smc='/opt/homebrew/bin/node ~/Documents/Antigravity/sumulige-claude/cli.js'
alias sumulige-notebooklm-mcp='/opt/homebrew/bin/node ~/Documents/Antigravity/sumulige-notebooklm-mcp/dist/index.js'

# Update global versions (when needed)
alias smc-update='npm update -g sumulige-claude'
alias notebooklm-mcp-update='npm update -g sumulige-notebooklm-mcp'
alias sumulige-update='smc-update && notebooklm-mcp-update'

# ===== Performance =====
# Disable auto-title for tmux/zellij
DISABLE_AUTO_TITLE="true"

# Faster paste
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# ===== Zellij (Terminal Multiplexer) =====
alias zj="zellij"

# ===== Local Configuration =====
# Machine-specific settings can go in ~/.zshrc.local
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Homebrew 性能优化
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export CLAUDE_AUTO_APPROVE=true
export CLAUDE_TRUST_WORKSPACE=~/Documents/Antigravity
