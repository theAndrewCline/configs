fish_vi_key_bindings

function open_repository
  set $git_repo=(ls ~/code | fzf)

  if test -n "$git_repo"
    exit 0
  end

  # 1. First you check if a tmux session exists with a given name.
  tmux has-session -t=$git_repo 2> /dev/null

  # 2. Create the session if it doesn't exists.
  if test $status -ne 0
    TMUX='' tmux new-session -d -s "$git_repo" -c ~/code/$git_repo
  end

  # 3. Attach if outside of tmux, switch if you're in tmux.
  if test -z "$TMUX"
    tmux attach -t "$git_repo"
  else
    tmux switch-client -t "$git_repo"
  end
end
