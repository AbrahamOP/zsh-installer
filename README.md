# 🚀 ZSH Installer – Terminal moderne avec Oh My Zsh + Powerlevel10k

![Version](https://img.shields.io/github/v/release/AbrahamOP/zsh-installer?label=version&style=flat-square)
![Téléchargements](https://img.shields.io/github/downloads/AbrahamOP/zsh-installer/total?label=t%C3%A9l%C3%A9chargements&style=flat-square)

Un script d'installation **tout-en-un** pour transformer ton terminal Linux en un environnement **beau, rapide et productif**, avec :

- 💡 Zsh  
- 🌈 Oh My Zsh  
- ⚡ Powerlevel10k (thème moderne et ultra personnalisable)  
- 🔌 Plugins : `zsh-autosuggestions` et `zsh-syntax-highlighting`  
- 🧠 Plus de 30 alias utiles (Git, Docker, Python, Node.js…)  
- 🔤 Installation automatique de la police **MesloLGS NF**

---

## 🧪 Installation en une commande

\`\`\`bash
bash <(curl -sSL https://raw.githubusercontent.com/AbrahamOP/zsh-installer/main/install.sh)
\`\`\`

---

## 📦 Ce que fait le script

✅ Automatiquement :

- Installe \`zsh\` (si besoin)
- Installe **Oh My Zsh**
- Installe le thème **Powerlevel10k**
- Installe les **plugins utiles**
- Configure ton fichier \`~/.zshrc\` (thème + plugins + alias)
- Installe la **police MesloLGS NF** pour un affichage parfait

---

## 🔌 Plugins Zsh installés

### 🔮 [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
🧠 Suggestion automatique de commandes pendant que tu tapes, basée sur ton historique.  
Exemple : tape \`git st\` → il propose \`git status\`.

### 🌈 [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
🎨 Colore les commandes en temps réel pour mieux lire et éviter les erreurs.

- ✅ Vert = commande valide
- ❌ Rouge = erreur
- 📁 Bleu = chemin ou fichier

---

## 🧠 Alias intégrés

| Catégorie   | Alias disponibles                                  |
|-------------|---------------------------------------------------|
| **Git**     | \`gs\`, \`ga\`, \`gc\`, \`gp\`, \`gl\`, \`gco\`, \`gb\`, \`gundo\`, \`gcl\` |
| **Docker**  | \`d\`, \`dps\`, \`di\`, \`dstop\`, \`drm\`, \`dimg\`, \`dc\`     |
| **Python**  | \`python\`, \`pip\`, \`venv\`, \`act\`, \`deact\`           |
| **Node.js** | \`n\`, \`npmi\`, \`npms\`, \`npmb\`                        |
| **Utiles**  | \`ll\`, \`la\`, \`lla\`, \`c\`, \`zshrc\`, \`reload\`, \`iplocal\`, \`df\`, \`du\`, \`free\` |

---

## 🖼️ Aperçu du résultat

> Terminal moderne, coloré, rapide et lisible avec suggestions & mise en évidence syntaxique ✨

![Powerlevel10k screenshot](https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/prompt-modern-1.png)

---

## 🔤 Configuration de la police

Le script installe automatiquement la police **MesloLGS NF** dans \`~/.local/share/fonts\`.

📝 N'oublie pas de **la sélectionner manuellement dans ton terminal** (Tilix, iTerm2, GNOME Terminal, etc.) pour un rendu parfait.

---

## 🔁 Reconfigurer le thème

Tu veux changer le style du prompt Powerlevel10k ?

Lance simplement :

\`\`\`bash
p10k configure
\`\`\`

---

## ⚙️ Pré-requis

- Linux (Debian / Ubuntu)
- \`curl\`, \`git\`, \`wget\`, \`fc-cache\`
- Terminal compatible Nerd Fonts

---

## 🙋 Contribution

Tu veux ajouter d'autres alias, plugins ou améliorer le script ?

➡️ Ouvre une **pull request** ou une **issue** ! Je serai ravi de collaborer avec toi 🤝

---

## ❤️ Auteur

Développé avec soin par [@AbrahamOP](https://github.com/AbrahamOP)  
✨ Pour un terminal qui te donne envie de coder tous les jours !
