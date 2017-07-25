#! /bin/bash
# GOROOT=$HOME/dev/lang/go/goroot
# GOPATH=$HOME/dev/lang/go/workspace
# JAVA_HOME=~/dev/env/jdk1.7.0_55
# CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
# PATH=$JAVA_HOME/bin:$PATH:/usr/lib/go-1.7/bin:$GOROOT/bin:$GOPATH/bin
# PERL5LIB=~/Desktop/perl/mylib:$PERL5LIB
# PYDEVDIR=$HOME/dev/ide/workspaces/pycharm
export JAVA_HOME PATH PERL5LIB GOPATH GOROOT PYDEVDIR

# my alias
alias myflask='. ~/dev/env/python/flask/bin/activate'
# alias mypi='. ~/dev/env/python/pi/bin/activate'
# alias apt='sudo /usr/bin/apt'
# alias nginx='sudo nginx'
# alias tmux='tmux -2'
alias emptycache='sudo sh -c "free && sync && echo 3 > /proc/sys/vm/drop_caches && free"'
alias myhosts='sudo sh ~/git/ynconfig/host_conf.sh'
alias python=python2
alias pip=pip2
alias hosts='wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts -O hosts_tmp && cat ~/git/ynconfig/hosts_t540p hosts_tmp > hosts_tmp2 && sudo cp hosts_tmp2 /etc/hosts && rm hosts_tmp hosts_tmp2'

#code comment
# alias author='bash $HOME/dev/template/author.sh'
# alias copyright='bash $HOME/dev/template/copyright.sh'

#
# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

