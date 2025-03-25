#!/bin/bash

echo "🚀 Installation complète de Zsh + Oh My Zsh + Powerlevel10k + plugins + alias + police..."

# Mise à jour des paquets
sudo apt update

# 1. Installer Zsh
if ! command -v zsh >/dev/null 2>&1; then
    echo "🛠️ Installation de Zsh..."
    sudo apt install zsh -y
else
    echo "✅ Zsh est déjà installé."
fi

# 2. Définir Zsh comme shell par défaut
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🔄 Changement du shell par défaut vers Zsh..."
    chsh -s $(which zsh)
fi

# 3. Installer Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "✨ Installation de Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 4. Installer Powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "🎨 Installation de Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# 5. Installer les plugins
ZSH_PLUGINS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

# Autosuggestions
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "🔮 Installation de zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_DIR/zsh-autosuggestions"
fi

# Syntax highlighting
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "🌈 Installation de zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
fi

# 6. Télécharger configuration Powerlevel10k si non existante
if [ ! -f ~/.p10k.zsh ]; then
    echo "📦 Téléchargement d'une configuration Powerlevel10k de base..."
    curl -fsSL https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/config/p10k-classic.zsh -o ~/.p10k.zsh
fi

# 7. Configurer .zshrc
echo "🧩 Configuration du fichier .zshrc..."

# Définir le thème
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Activer les plugins
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# S'assurer que Powerlevel10k est bien sourcé
if ! grep -q 'source ~/.p10k.zsh' ~/.zshrc; then
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
fi

# 8. Ajouter les alias personnalisés à la fin du .zshrc
cat <<'EOF' >> ~/.zshrc

# --- Personnalisation par script ---

# Alias de base
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lha"
alias c="clear"
alias zshrc="nano ~/.zshrc"
alias reload="source ~/.zshrc"

# Alias système macOS
alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias iplocal="ifconfig | grep 'inet '"
alias df="df -h"
alias du="du -h -d 1"
alias free="vm_stat | awk '/free/ {print \$3 * 4096 / 1048576 \" MB libre\"}'"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gundo="git reset HEAD~1"
alias gcl="git clone"

# Python
alias python="python3"
alias pip="pip3"
alias venv="python3 -m venv"
alias act="source venv/bin/activate"
alias deact="deactivate"

# Docker
alias d="docker"
alias dps="docker ps"
alias di="docker images"
alias dstop="docker stop \$(docker ps -q)"
alias drm="docker rm \$(docker ps -aq)"
alias dimg="docker rmi \$(docker images -q)"
alias dc="docker-compose"

# Node.js
alias n="node"
alias npmi="npm install"
alias npms="npm start"
alias npmb="npm run build"

# Couleurs et personnalisation
autoload -U colors && colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# --- Fin des personnalisations ---
EOF

# 9. Installer la police MesloLGS NF
echo "🔤 Installation des polices MesloLGS NF..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

for font in "Regular" "Bold" "Italic" "BoldItalic"; do
    wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20$font.ttf -O "MesloLGS NF $font.ttf"
done

fc-cache -f -v

echo ""
echo "🎉 Installation terminée !"
echo "👉 Ouvre un nouveau terminal ou tape 'zsh'"
echo "👉 Configure le prompt avec : p10k configure"
echo "👉 Et sélectionne la police 'MesloLGS NF' dans ton terminal pour un affichage parfait ✨"