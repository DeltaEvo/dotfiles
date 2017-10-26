# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/david/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

alias vim=nvim
alias tmux="tmux -2"

# RLS
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set PATH ~/.npm-global/bin $PATH


fish_vi_key_bindings
