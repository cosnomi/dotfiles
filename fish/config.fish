set -g theme_display_git_master_branch no
set -g theme_display_date no
set -g theme_display_cmd_duration no

set -x EDITOR nvim

set GOPATH ~/go
set PATH $HOME/bin $GOPATH/bin $PATH

set -x GPG_TTY (tty)

# alias
abbr vim nvim
abbr tat tmux a -t

abbr ga git add
abbr gs git status

abbr lh ls -lh
abbr lha ls -lha

abbr vimrc nvim ~/.config/nvim/init.vim

abbr .. cd ..
abbr ..2 cd ../..
abbr ..3 cd ../../..

# Change tmux prefix to avoid conflict in case of nested tmux
alias tmux-chkey='tmux set-option -ag prefix C-b'
alias tmux-revkey='tmux set-option -ag prefix C-s'
