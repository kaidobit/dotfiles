# chezmoi-based dotfiles repository

## install

### chezmoi
`sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin`

### just
`curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to $HOME/.local/bin`


## bootstrap

1. export `VAULT_ADDR`and `VAULT_TOKEN`
2. get repo: `chezmoi init $GITHUB_USERNAME`
3. cd into repo dir: `chezmoi cd`
4. decrypt files: `just decrypt`
5. apply dotfiles: `chezmoi apply`

## setup zsh

1. install zsh
2. install plugins:
   1. `zsh-autosuggestions`
      * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
   2. `zsh-completions`(replace nvm bash_completion)
      * `git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions`
   3. `zsh-syntax-highlighting` 
      * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`