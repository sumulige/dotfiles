# Personal Dotfiles

🌐 **Language**: **English** | [中文](README.md)

[![GitHub Stars](https://img.shields.io/github/stars/sumulige/dotfiles?style=flat-square)](https://github.com/sumulige/dotfiles/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/sumulige/dotfiles?style=flat-square)](https://github.com/sumulige/dotfiles/commits)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![macOS](https://img.shields.io/badge/OS-macOS-black?style=flat-square&logo=apple)](https://www.apple.com/macos/)
[![Zsh](https://img.shields.io/badge/Shell-Zsh-black?style=flat-square&logo=gnu-bash)](zsh/)
[![Neovim](https://img.shields.io/badge/Editor-Neovim-green?style=flat-square&logo=neovim)](nvim/)

> AI-driven personal development environment configuration - Personal Panopticon

Let AI become an extension of your mind — working while you sleep, remembering when you forget, and clarifying when you're confused.

---

## Why This Project?

What makes this dotfiles project unique compared to other solutions:

| Feature | This Project | chezmoi | yadm | Manual |
|---------|--------------|---------|------|--------|
| 🤖 AI Memory System | ✅ | ❌ | ❌ | ❌ |
| ⚡ Ready-to-use Config | ✅ | ❌ | ❌ | ❌ |
| 🚀 Startup < 150ms | ✅ | - | - | ⚠️ |
| 📦 One-click Install | ✅ | ⚠️ | ⚠️ | ❌ |
| 🔧 Modern Tool Stack | ✅ | ⚠️ | ⚠️ | ⚠️ |
| 📚 Complete Docs | ✅ | ✅ | ⚠️ | ❌ |

**Core Advantages**:
- **AI Autonomous Memory** - Deep Claude Code integration, auto-records decisions and changes
- **Blazing Fast Startup** - Zsh startup ~127ms, 3-4x faster than Oh My Zsh
- **Modern Toolchain** - Full configuration for Starship, atuin, zoxide, eza, bat, and more

---

## Overview

**Philosophy**: Personal Panopticon - Data sovereignty reversal, see yourself clearly

**Features**:
- ⚡ **Blazing Fast**: Zsh startup ~127ms
- 🤖 **AI Autonomous**: Deep Claude Code integration for memory and task management
- 📦 **One-click Install**: `./install.sh full` automated setup
- 📚 **Well Documented**: Every config has detailed explanations
- 🔄 **Traceable**: All decisions and changes are recorded

---

## Directory Structure

```
dotfiles/
├── install.sh                 ⚡ One-click install script
├── .claude/                    # AI Memory System Core ⭐
│   ├── ANCHORS.md             # Skill anchor index
│   ├── CLAUDE.md              # AI collaboration config
│   ├── MEMORY.md              # Incremental memory log
│   ├── PROJECT_LOG.md         # Project build history
│   ├── hooks/                 # Automation hooks (10)
│   ├── skills/                # Skill library
│   └── thinking-routes/       # Thinking trace system
├── brew/                       # Homebrew Package Management ⚡
│   ├── Brewfile.core          # Core packages (Shell, Git, Editor)
│   └── Brewfile.tools         # Tool packages (Dev tools, Monitoring, AI)
├── nvim/                       # Neovim Configuration ⚡
│   ├── init.lua               # Main config
│   ├── lua/config/            # Config modules
│   └── lua/plugins/           # Plugin configs
├── ghostty/                   # Ghostty Terminal ✅
│   ├── config                 # Main config (AI programming optimized)
│   └── themes/                # Custom themes
├── iterm2/                    # iTerm2 Configuration ✅
│   ├── OneDarkPro.json        # Dynamic Profile
│   └── OneDarkPro.itermcolors # Color theme (astigmatism optimized)
├── starship/                  # Starship Prompt ✅
│   └── starship.toml          # Minimal prompt
├── zsh/                       # Zsh Configuration ✅
│   ├── .zshrc                 # Zsh main config
│   ├── .zimrc                 # Zim module config
│   └── docs/                  # Zsh documentation
└── README.md                  # This file
```

---

## Quick Start

### Method 1: One-liner (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/sumulige/dotfiles/master/install-remote.sh | bash
```

### Method 2: Homebrew

```bash
brew tap sumulige/tap
brew install sumulige-dotfiles
sumulige-dotfiles full
```

### Method 3: npm / npx

```bash
npx @sumulige/dotfiles
# or
npm install -g @sumulige/dotfiles && sumulige-dotfiles
```

### Method 4: Manual Clone

```bash
git clone https://github.com/sumulige/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles
./install.sh full
```

### Installation Levels

```bash
./install.sh core   # Core packages (Shell, Git, Editor, basics)
./install.sh tools  # Core + Tool packages (Languages, Monitoring, AI)
./install.sh full   # Full install (with config linking, Zim init)
./install.sh sync   # Sync config only (for updates)
```

---

## Neovim Configuration

Modern Neovim setup based on Lua + lazy.nvim.

### Keybindings

| Key | Function |
|-----|----------|
| `<Space>ff` | Find files |
| `<Space>fg` | Search text |
| `<Space>fb` | Buffer list |
| `<Space>tt` | Floating terminal |
| `<Space>ca` | Code actions |
| `gd` | Go to definition |
| `K` | Hover documentation |

### Supported Languages

- Go (gopls)
- Python (pyright)
- TypeScript/JavaScript (ts_ls)
- Lua (lua_ls)
- Rust (rust_analyzer)
- C/C++ (clangd)

[View full Neovim docs](nvim/README.md)

---

## Modern Tool Integration

| Tool | Purpose | Command |
|------|---------|---------|
| **atuin** | Command history search | `Ctrl+R` |
| **zoxide** | Smart directory jump | `z <keyword>` |
| **direnv** | Auto environment loading | `cd <project>` |
| **eza** | Modern ls | `ll`, `lt` |
| **bat** | Modern cat | `cat <file>` |
| **ripgrep** | Fast search | `rg <pattern>` |
| **fzf** | Fuzzy finder | Integrated everywhere |
| **lazygit** | Git TUI | `lg` |

---

## Performance

| Metric | Value | Status |
|--------|-------|--------|
| Zsh Startup | ~127ms | ✅ |
| Hook Execution | <2s | ✅ |
| Doc Coverage | ~80% | 🔄 |

Configured with `HOMEBREW_NO_AUTO_UPDATE=1`, brew command response reduced from 5-10s to ~1s.

---

## FAQ

### Q: How to quickly set up a new machine?
A: Run `curl -fsSL https://raw.githubusercontent.com/sumulige/dotfiles/master/install-remote.sh | bash`

### Q: How to add new Homebrew packages?
A: Edit `brew/Brewfile.core` or `brew/Brewfile.tools`, then run `brew bundle --file=brew/Brewfile.core`

### Q: How to add new zsh plugins?
A: Edit `~/.zimrc`, add `zmodule <plugin-name>`, then run `zimfw install`

### Q: How to add Neovim plugins?
A: Edit files in `nvim/lua/plugins/`. See [nvim/README.md](nvim/README.md)

---

## License

MIT

---

**Last Updated**: 2026-01-27
**Maintainer**: sumulige + Claude (Opus 4.5)
