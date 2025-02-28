# Ubuntu Fresh Install Guide for Development (CraftzCode)

![Ubuntu Development Setup](https://img.shields.io/badge/Ubuntu-24.04-orange?logo=ubuntu)
![License](https://img.shields.io/badge/License-MIT-blue)

A comprehensive guide to setting up a development environment on Ubuntu, including system configuration, shell customization, and essential development tools.

## Table of Contents

1.  [Initial System Update](#initial-system-update)
2.  [Install Homebrew](#install-homebrew)
3.  [Setup Git](#setup-git)
4.  [Install ZSH](#install-zsh)
5.  [Choose Code Editor](#choose-code-editor)
    *   [Install Zed](#install-zed)
    *   [Install Cursor AI Editor](#install-cursor-ai-editor)
    *   [Install Jetbrains Mono Font](#install-jetbrains-mono-font)
6.  [Install Eza & Zoxide](#install-eza--zoxide)
7.  [Install Node](#install-node)
8.  [Install Bun](#install-bun)
9.  [Install Wezterm](#install-wezterm)
10. [Install TMUX](#install-tmux)
11. [Install Zen Browser](#install-zen-browser)
12. [Install Neovim](#install-neovim)

## Initial System Update
```shell
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential procps curl file git
```

## Install Homebrew
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the instructions given by the installation script. You may need to add Homebrew to your PATH. The script will provide the exact commands, but they typically look like this
```shell
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Verify Installation
```shell
brew --version
```

## Setup Git
```shell
git config --global user.name "yourusername"
git config --global user.email "your@email.com"
git config --global init.defaultBranch main
```

## Install ZSH
First, ensure that Homebrew is installed and up to date
```shell
brew update
```

Then, use Homebrew to install Zsh
```shell
brew install zsh
```

After the installation is complete, you can verify it by checking the Zsh version
```shell
zsh --version
```

If you want to make ZSH your default shell, you can use the following command
```shell
chsh -s $(which zsh)
```

If there's an error on setting the ZSH to be your default shell

First, verify that Zsh is correctly installed and its path
```shell
which zsh
```
This should return the path to Zsh, likely something like /home/linuxbrew/.linuxbrew/bin/zsh.

Check if Zsh is listed in the allowed shells
```shell
cat /etc/shells
```
If the path to your Homebrew-installed Zsh is not listed here, you'll need to add it.

If Zsh is not in /etc/shells, add it
```shell
echo $(which zsh) | sudo tee -a /etc/shells
```

Now try changing your shell again
```shell
chsh -s $(which zsh)
# OR
sudo chsh -s $(which zsh)
# OR
chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
# OR
sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
# OR
sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh your-username
```

Restart PC

Now add the path of Homebrew on ZSH
```shell
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Customize ZSH Theme
- Install Oh-My-Posh (Optional)
  - Follow this [installation](https://ohmyposh.dev/docs/installation/linux)
  - Copy or download my theme `craftzcode.omp.json`
    ```shell
    curl -o ~/.config/oh-my-posh/craftzcode.omp.json https://raw.githubusercontent.com/craftzcode/ubuntu-craftzcode/main/.config/oh-my-posh/craftzcode.omp.json
    ```
- Install Powerlevel10k (Optional)
  - ```shell
    brew install powerlevel10k
    echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
    ```

Restart ZSH
```shell
source ~/.zshrc
```

Install ZSH Plugins
```shell
brew install zsh-autosuggestions zsh-syntax-highlighting

echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

Restart ZSH
```shell
source ~/.zshrc
```

## Choose Code Editor
- Install Zed
  - ```shell
    curl -f https://zed.dev/install.sh | sh
    ```
    
  - Add the path of Zed on ZSH
    - ```shell
      echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc
      ```

- Install Cursor AI Editor
  - Follow this [guide](https://arcadian.cloud/how-to-install-cursor-ubuntu-24-10/#option-2-gear-lever) to install `Cursor AI Editor`
 
- Install Jetbrains Mono Font
  - Follow this [installation](https://github.com/JetBrains/JetBrainsMono?tab=readme-ov-file#manual-installation)

## Install Eza & Zoxide
```shell
brew install eza zoxide
```

Add this to enable Zoxide in ZSH
```
eval "$(zoxide init zsh)"
```

Add Alias for Zoxide in ZSH
```
alias cd="z"
```

Add Alias for EZA in ZSH
```
alias ls="eza --icons=always"
alias tree="eza --tree"
```

Add Alias for Neovim
```
alias vim="nvim"
```

Add Alias for Edit & Reload ZSH
```
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
```

## Install Node
```shell
brew install node
```

## Install Bun
```shell
curl -fsSL https://bun.sh/install | bash
```

## Install Wezterm
[Wezterm](https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_3)

Create Wezterm Config File
```shell
mkdir -p ~/.config/wezterm
nano ~/.config/wezterm/wezterm.lua
```

Copy or download my `wezterm.lua`
```shell
curl -o ~/.config/wezterm/wezterm.lua https://raw.githubusercontent.com/craftzcode/ubuntu-craftzcode/main/.config/wezterm/wezterm.lua
```

Exit and Re-run Wezterm

## Install TMUX
```shell
brew install tmux
```

Install TMUX Plugin Manager (Optional)
```shell
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Copy or download my `statlusline.conf`
```bash
curl -o ~/.config/tmux/statusline.conf https://raw.githubusercontent.com/craftzcode/ubuntu-craftzcode/main/.config/tmux/statusline.conf
```

Copy or download my `tmux.conf`
```bash
curl -o ~/.config/tmux/tmux.conf https://raw.githubusercontent.com/craftzcode/ubuntu-craftzcode/main/.config/tmux/tmux.conf
```

Restart TMUX
```lua
leader (ctrl + a) + :source-file ~/.config/tmux/tmux.conf
```

Install TMUX Plugins
```lua
leader (ctrl + a) + shift + i
```

## Install Zen Browser
First setup the `Flatpak` by folling this [instructions](https://flathub.org/setup/Ubuntu)

After that download the file of `Zen Browser` in [Flathub](https://flathub.org/apps/app.zen_browser.zen)

## Install Neovim
```shell
brew install neovim
```

[Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide](https://www.youtube.com/watch?v=6pAG3BHurdM&t=187s&ab_channel=JoseanMartinez)
