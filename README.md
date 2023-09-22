# chezmoi-based dotfiles repository

## install

`sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin`

## bootstrap

`chezmoi init --apply $GITHUB_USERNAME`

## setup zsh

1. install zsh
2. install plugins:
   1. `zsh-autosuggestions`
      * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
   2. `zsh-completions`(replace nvm bash_completion)
      * `git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions`
   3. `zsh-syntax-highlighting` 
      * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`