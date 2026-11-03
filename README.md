# gdconfig

This repository contains my personal configurations for Zsh, Starship, and Tmux. By keeping these files here, they can be easily copied and symlinked across multiple machines.

## Installation Instructions

Follow these step-by-step instructions to set up the configurations on a new machine.

### 1. Clone the Repository

Clone this repository directly into your `.config` directory.
*(Note: Replace `<YOUR_REPO_URL>` with the actual Git URL of this repository).*

```zsh
git clone <YOUR_REPO_URL> ~/.config/gdconfig
```

### 2. Prepare the Starship Directory

Create the custom directory for the Starship configuration. *(Note: We deliberately do not create a `~/.config/zsh` directory).*

```zsh
mkdir -p ~/.config/starship
```

### 3. Symlink Configuration Files

Create symbolic links from the cloned repository to the active system paths for Tmux and Starship:

```zsh
ln -sf ~/.config/gdconfig/.tmux.conf ~/.tmux.conf
ln -sf ~/.config/gdconfig/starship.toml ~/.config/starship/starship.toml
```

### 4. Install starship
Use homebrew to install starship
```zsh
brew install starship
```


### 4. Update Your `.zshrc`

Open the machine's local `~/.zshrc` file and paste the following snippet at the very bottom.

This snippet points Starship to the custom symlinked path, enables native directory stack tracking, and loops through all custom `.zsh` files in the repository.

```zsh
# ========== starship ==========
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Automatically push visited directories onto the stack
setopt AUTO_PUSHD
# Do not push duplicate directories to the stack
setopt PUSHD_IGNORE_DUPS
# Allow cd -<TAB> or cd +<TAB> to navigate the stack
setopt PUSHD_MINUS

# ========== zsh custom categories ==========
for config_file in "$HOME"/.config/gdconfig/zsh/*.zsh(N); do
  source "$config_file"
done
```

### 5. Apply Changes

Finally, replace the current shell process with a fresh instance to cleanly apply the new environment variables, keybinds, and prompt configurations:

```zsh
exec zsh
```
