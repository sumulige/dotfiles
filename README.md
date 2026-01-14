# Dotfiles

个人开发环境配置文件集合。

## 目录结构

```
dotfiles/
├── iterm2/           # iTerm2 配置
│   ├── com.googlecode.iterm2.plist
│   └── README.md
├── zsh/              # Zsh 配置
│   └── .zshrc
├── git/              # Git 配置
│   └── .gitconfig
└── README.md
```

## 新电脑设置

```bash
# 1. 克隆仓库
git clone <your-repo-url> ~/dotfiles

# 2. 安装字体
brew install --cask font-jetbrains-mono-nerd-font

# 3. 链接 zsh 配置
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# 4. 链接 git 配置
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

# 5. 配置 iTerm2
# Settings → General → Preferences → Load from: ~/dotfiles/iterm2

# 6. 安装 oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 7. 安装 zsh 插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

## 包含工具

- oh-my-zsh + Powerlevel10k
- zsh-autosuggestions
- zsh-syntax-highlighting
- JetBrains Mono Nerd Font
- Smart Blue iTerm2 主题, Created at $(date +%Y-%m-%d)
