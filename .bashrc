# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
	if [ -x /usr/bin/fortune ] && [ -x /usr/bin/cowsay ]; then # a little fun
		fortune | cowsay
	fi
fi

# For when I forget to use sudo
alias fuck='sudo $(history -p \!\!)'

#shortcuts
alias web='cd /var/www/html'

# Preferred ls usage and typo anticipation
alias ls='ls -hAl --color=auto'
alias sl='ls -hAl --color=auto'


alias ~='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'

up()
{
    COUNTER=0
    while [ $COUNTER -lt $1 ]; do
        cd ../
       let "COUNTER+=1"
    done
    
}

goto()
{

	cd $1;
	read -p "Save path as:" path
	echo $path":"$1 >> ~/.goto

	while IFS='' read -r line || [[ -n $line ]]; do
	    echo "$line"
	done < "~/.goto"



}


#clear
alias cls='clear'

#Disk usage
alias howfull='df -h'
alias foldersize='du -h | less'

#unzipping things 
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

#Custom imports

if [ -f ./.ssh_alias ]; then
	. .ssh_alias
fi

if [ -f ./.bashrc_custom ]; then
	. .bashrc_custom
fi
