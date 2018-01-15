#! /bin/bash
GOROOT=$HOME/dev/lang/go/goroot
GOPATH=$HOME/dev/lang/go/workspace
# JAVA_HOME=~/dev/env/jdk1.7.0_55
JAVA_HOME=~/dev/env/jdk1.8.0_101
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
MAVEN_HOME=~/dev/tools/apache-maven-3.3.3
ANDROID_HOME=~/dev/env/android
PATH=$JAVA_HOME/bin:$PATH:/usr/lib/go-1.7/bin:$GOROOT/bin:$GOPATH/bin:$MAVEN_HOME/bin
PATH=$PATH:$ANDROID_HOME/tools
PERL5LIB=~/Desktop/perl/mylib:$PERL5LIB
PYDEVDIR=$HOME/dev/ide/workspaces/pycharm
export JAVA_HOME PATH PERL5LIB GOPATH GOROOT PYDEVDIR ANDROID_HOME

# my alias
alias cl=clear
alias crapidoc='apidoc -i app/ -o apidoc/'
alias myflask='. ~/dev/env/python/flask/bin/activate'
alias myflask-common='. ~/dev/env/python/flask_common/bin/activate'
alias myflask-min='. ~/dev/env/python/flask-min/bin/activate'
alias myflask-base='. ~/dev/env/python/flask-base/bin/activate'
alias mypi='. ~/dev/env/python/pi/bin/activate'
alias apt='sudo /usr/bin/apt'
alias nginx='sudo nginx'
alias tmux='tmux -2'
alias emptycache='sudo sh -c "free && sync && echo 3 > /proc/sys/vm/drop_caches && free"'
# alias myhosts='sudo sh ~/git/ynconfig/host_conf.sh'
alias hosts='wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts -O hosts_tmp && cat ~/git/ynconfig/hosts_work hosts_tmp > hosts_tmp2 && sudo cp hosts_tmp2 /etc/hosts && rm hosts_tmp hosts_tmp2'
alias mysource='source ~/.bashrc'
# git alias
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcmsg='git commit -m'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
# alias gpristine='git reset --hard && git clean -dfx'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gss='git status -s'
alias gst='git status'
# function get_brach(){
    # gcb=$(git branch)
    # if [ '${gcb:0:1}' == '*' ]
    # then
        # return '${GIT_CURRENT_BRANCH##\*}'
    # fi
    # return ''
# }
# GIT_CURRENT_BRANCH=$(git branch)
# echo "${GIT_CURRENT_BRANCH##\*}"
# echo $(get_brach)
# alias ggpull='git pull origin $(get_brach)'
# alias ggpush='git push origin $(get_brach)'
alias ggpull='git pull origin '
alias ggpush='git push origin '
alias glld='git pull origin develop'
alias gshd='git push origin develop'

#code comment
alias author='bash $HOME/dev/template/author.sh'
alias copyright='bash $HOME/dev/template/copyright.sh'

#
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# bash history config
# 忽略特定命令
HISTIGNORE="[   ]*:ls:ll:cd:vi:pwd:sync:exit:history*"
# 历史文件大小 10m
HISTFILESIZE=1000000000
# 保存历史命令条数 10w
HISTSIZE=1000000

# powerline status config
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh

# autojump
# source /etc/profile.d/autojump.sh
function _update_ps1() {
    PS1="$(~/.powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
