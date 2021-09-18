#!/bin/bash

git_repo=$(ls ~/code | fzf)

if [[ $git_repo == '' ]]; then
  exit 0
fi

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t=$git_repo 2> /dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
  TMUX='' tmux new-session -d -s "$git_repo"
fi

# 3. Attach if outside of tmux, switch if you're in tmux.
if [[ -z "$TMUX" ]]; then
  tmux attach -t "$git_repo"
else
  tmux switch-client -t "$git_repo"
fi
