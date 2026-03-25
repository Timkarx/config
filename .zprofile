# Homebrew (Apple Silicon)
if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$("/opt/homebrew/bin/brew" shellenv)"
fi

# Fallback for Linuxbrew (if you ever reuse config)
if [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
  eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
elif [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$("/home/linuxbrew/.linuxbrew/bin/brew" shellenv)"
fi

# Base PATH additions
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Pyenv (only init environment here, not full shell integration)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Cargo (Rust)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Custom paths
export EBOOK_MEDITOR="$HOME/projects/ebook-meditor/dist"
export PATH="$EBOOK_MEDITOR:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$PATH:$HOME/.pulumi/bin"
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/timkarx/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/timkarx/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/timkarx/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/timkarx/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
