# Dotfiles - Skill Anchors Index

> This file is auto-maintained by AI as a quick index for the skill system
> Last updated: 2026-01-16

---

## 🚀 AI Startup: Memory Loading Order

```
1. ANCHORS.md (this file)     → Quick locate modules
2. PROJECT_LOG.md            → Understand build history
3. MEMORY.md                 → View latest changes
4. CLAUDE.md                 → Load core knowledge
5. prompts/                  → View tutorials
6. .claude/rag/skill-index.json → RAG skill index ⭐
7. Specific files            → Deep dive into implementation
```

---

## Current Anchor Mapping

### Teaching Resources
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[doc:paradigm]` | `project-paradigm.md` | Personal Panopticon development paradigm ⭐ |
| `[doc:claude-template]` | `.claude/CLAUDE-template.md` | CLAUDE.md template for new projects |
| `[doc:agents]` | `AGENTS.md` | Agent role definitions |
| `[doc:thinking-silent]` | `thinkinglens-silent.md` | ThinkingLens silent mode |

### Project Management (Manus Kickoff)
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[project:kickoff]` | `.claude/PROJECT_KICKOFF.md` | Project kickoff checklist ⭐ |
| `[project:task-plan]` | `.claude/TASK_PLAN.md` | Task execution plan |
| `[project:proposal]` | `.claude/PROJECT_PROPOSAL.md` | Full project proposal |

### Shell Configuration
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[config:zsh]` | `zsh/.zshrc` | Zsh configuration with Zim fw |
| `[config:zim]` | `zsh/.zimrc` | Zim module configuration |
| `[doc:zsh]` | `zsh/docs/ZSH.md` | Zsh configuration overview |
| `[doc:atuin]` | `zsh/docs/atuin.md` | Shell history management guide |
| `[doc:zoxide]` | `zsh/docs/zoxide.md` | Smart directory jump guide |
| `[doc:direnv]` | `zsh/docs/direnv.md` | Project environment management guide |

### Terminal Configuration
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[config:iterm2]` | `iterm2/OneDarkPro.json` | iTerm2 Dynamic Profile |
| `[config:iterm2-colors]` | `iterm2/OneDarkPro.itermcolors` | One Dark Pro colors (astigmatism optimized) |
| `[doc:iterm2]` | `iterm2/CONFIG.md` | iTerm2 configuration documentation |

### Version Control
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[config:git]` | `git/.gitconfig` | Git user configuration |

### RAG System
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[system:rag-index]` | `.claude/rag/skill-index.json` | Dynamic skill index ⭐ |

### Skills
| Anchor | File Path | Purpose |
|--------|-----------|---------|
| `[skill:manus-kickoff]` | `.claude/skills/manus-kickoff/SKILL.md` | Manus style project kickoff |

---

## Module Status

| Module | Status | Notes |
|--------|--------|-------|
| Shell (Zsh) | ✅ Complete | Startup ~127ms |
| Terminal (iTerm2) | ✅ Complete | One Dark Pro astigmatism optimized |
| AI Memory System | 🔄 Active | Framework ready, recording in progress |
| Task Management | ⏳ Pending | System ready, needs tasks |
| Skills | ⏳ Pending | manus-kickoff created |

---

## Quick Reference

### Modern Tools Integrated
- **atuin**: Shell history with Ctrl+R search
- **zoxide**: Smart `z` command for directory jumping
- **direnv**: Automatic .envrc loading per project
- **eza**: Modern `ls` replacement
- **bat**: Modern `cat` replacement
- **ripgrep**: Fast `rg` grep
- **fzf**: Fuzzy finder
- **lazygit**: Git TUI

### Key Commands
```bash
# Shell
z <keyword>       # Jump to directory (zoxide)
Ctrl+R            # Search history (atuin)
cd <project>      # Auto-load .envrc (direnv)

# Navigation
code .            # Open in VS Code
lazygit / lg      # Git TUI
ll                # List files (eza)
cat <file>        # View file (bat)
```

---

**Last updated**: 2026-01-16
**Updated by**: Manus Kickoff Workflow
