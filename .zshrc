# Only run in interactive shells
[[ $- != *i* ]] && return

# Load modular dotfiles
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
  [[ -r "$file" && -f "$file" ]] && source "$file"
done
unset file

# History
HISTSIZE=1000
HISTFILESIZE=2000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Case-insensitive globbing
setopt NO_CASE_GLOB

bindkey '^[d' clear-screen

# Command correction (like cdspell, but broader)
setopt CORRECT

# lesspipe
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Pyenv full init (interactive features like shims)
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

# Local env
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# Completion system
autoload -Uz compinit
compinit
# hide command completions
#zstyle ':completion:*:commands' ignored-patterns '*'
# only offer directories for path/file completion
#zstyle ':completion:*' file-patterns '*(/):directories'

# Homebrew zsh completions
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"
  if [[ -d "$BREW_PREFIX/share/zsh/site-functions" ]]; then
    fpath=("$BREW_PREFIX/share/zsh/site-functions" $fpath)
  fi
  unset BREW_PREFIX
fi

# Git alias completion
compdef g=git

# NOTE: SSH agent intentionally NOT started here
# macOS handles this better via Keychain

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/timkarx/.bun/_bun" ] && source "/Users/timkarx/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
