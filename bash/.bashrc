# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

echo "<--(*,..,*)--<<"

export EDITOR='vim'

# Export GPG key
export GPG_TTY=$(tty)

# Add local/bin to PATH
export PATH="/usr/local/bin:$PATH"

#add aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias l='ls -lh'
alias ll='ls -lah'

alias v='vim'
alias g='git'
alias gs='git status'
alias gm='git switch canary'

alias sbc='source ~/.bashrc'
alias bc='vim ~/.bashrc'
alias vc='vim ~/.vimrc'

alias cat="bat"

alias pull="git pull --rebase"
alias push="git push --force-with-lease"

alias sdown="sudo shutdown -h now"

alias view="magick display"

alias info="magick identify"

source ~/.bash_aliases

combine (){
	magick montage -label %f -frame 5 -background '#336699' -geometry +4+4 $1 $2 $3
}

combineNoBorder (){
	magick montage -geometry +4+4 $1 $2 $3
}

gignore (){
	git update-index --assume-unchanged $1
}
# Show git branch and color the PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\D{%R} [\[\e[94m\]\u \[\e[32m\]\w\[\e[00m\]]\[\e[91m\]\$(parse_git_branch)\[\e[94m\]\$ \[\e[00m\]"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/usr/lib64/kitty/shell-integration/kitty.bash"; then source "/usr/lib64/kitty/shell-integration/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
