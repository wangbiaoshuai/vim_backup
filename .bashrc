# .bashrc

# User specific aliases and functions

alias vi='vim'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -A --color=auto'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function git_branch {
    branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
    if [ "${branch}" != "" ]; then
        if [ "${branch}" = "(no branch)" ]; then
            branch="(`git rev-parse --short HEAD`...)"
        fi
        echo "($branch)"
    fi
}

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ctags='ctags --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+iaS --extra=+q -R'
LESS+="-erX"
alias ctagsfile="echo -e \"!_TAG_FILE_SORTED\t2\t/2=foldcase/\" > filenametags; find . -not -regex '.*\.\(png\|gif\|o\)' -type f -printf \"%f\t${PWD}/%p\t1\n\" | \
    sort -f >> filenametags"

# english
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"

#chinese
#LANG="zh_CN.UTF-8"
#LANGUAGE="zh_CN:zh"

#PS1='\[\e[1;32m\][\u]:\w\$\[\e[0m\]\[\e[1;33m\]$(git_branch)\[\e[0m\]'

PS1='\[\e[0;32m\][\u]:\w\[\e[m\]\[\e[0;31m\]$(git_branch)\[\e[m\]
\[\e[0;33m\][\#]\$\[\e[m\]'
