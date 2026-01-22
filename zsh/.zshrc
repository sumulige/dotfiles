# =============================================================================
# Zsh Configuration with Zim Framework
# =============================================================================
# This configuration uses Zim fw for blazing fast startup time

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

# git: Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

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
# Custom Configuration
# =============================================================================

# ===== Editor =====
export EDITOR="code"

# ===== Path =====
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# ===== Python Version Manager (pyenv) =====
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# ===== Node Version Manager (fnm) =====
eval "$(fnm env --use-on-cd --shell zsh)"

# ===== China Mirrors =====
export PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# ===== Powerlevel10k Instant Prompt =====
[[ ! -f ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh ]] || source ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh

# ===== Powerlevel10k Prompt =====
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===== Modern Tools (atuin, zoxide, direnv) =====
# atuin - magical shell history
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
