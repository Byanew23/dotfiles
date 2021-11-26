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

alias clockify="cat ~/work/clockifyAPI.txt | awk '{print $1}' | xclip -sel clip"

alias gtoken="cat ~/docs/Github_token.txt | awk '{print $1}' | xclip -sel clip"
alias pull="git pull --rebase"
alias push="git push --force-with-lease"

alias ss="magick import -page A4 -gravity center png:- | xclip -sel clip -t image/png"
alias sdown="sudo shutdown -h now"

alias view="magick display"

alias info="magick identify"

alias v-python="source ~/python-virtual-environments/env/bin/activate"

combine (){
	magick montage -label %f -frame 5 -background '#336699' -geometry +4+4 $1 $2 $3
}

combineNoBorder (){
	magick montage -geometry +4+4 $1 $2 $3
}

gnb () {
	git checkout canary && git pull && git checkout -b $1
}


#Work related aliases
alias lib='cd ~/senteca/theme/packages/lib'
alias theme-c='cd ~/senteca/theme/packages/themes/clean'

alias preview='rm -rf node_modules/ yarn.lock && yarn && yarn preview-theme'
alias bpreview='cd ~/senteca/theme/packages/lib && yarn build && cd - && rm -rf node_modules/ pages/ && yarn && yarn preview-theme && yarn dev'
alias blib='cd ~/senteca/theme/packages/lib/ && yarn build && cd - && yarn dev'

alias linkReact='cd node_modules/react/ && yarn link && cd ../react-dom && yarn link && cd ../react-query && yarn link && cd ../embla-carousel && yarn link && cd ../styled-components && yarn link && cd ../../'

alias linkLinked='yarn link react && yarn link react-dom && yarn link react-query && yarn link embla-carousel && yarn link styled-components'
# Show git branch and color the PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\D{%R} [\[\e[94m\]\u \[\e[32m\]\w\[\e[00m\]]\[\e[91m\]\$(parse_git_branch)\[\e[94m\]\$ \[\e[00m\]"
