
#Pathing constants
mainDrive="/c"
bulk="/d"

desktop="$mainDrive/Users/Samue/Desktop"
desk=$desktop

code="$desktop/code"

python="$code/python"
scripts="$python/scripts"
pythonActive="$python/active"
pythonProjects="$python/projects"
pythonScripts="$scripts"
pythonUtils="$scripts/my_utils"
pythonTests="$python/tests"

ytdl="$pythonActive/ytdl"

temp="$code/temp"

bash="$code/bash"
bs="$bash/scripts"
bsn="$bash/snippets"
brc="$bash/profile/.bashrc" #This is for my .bashrc hardlink so that I can use git to track it. Real brc at ~/.bashrc

java="$code/java"

javascript="$code/javascript"
js="$javascript"

automation="$code/automation"

utilities="$code/utils"
utils="$utilities"

templates="$code/templates"

ctf="$code/ctf"

video="$desktop/video"
savedVideos="$bulk/saved_yt_videos"

music="$desktop/music"

#enable autocd
shopt -s autocd cdspell

#change prompt display
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#add utils to PATH
PATH="$PATH:$utils/"

#add youtube-dl to PATH
PATH="$PATH:/c/Users/nword33/Downloads/youtube-dl"

#add scripts to PATH
PATH="$PATH:/c/Users/Samue/Desktop/Code/Python/scripts"
PATH="$PATH:/c/Users/Samue/Desktop/Code/bash/scripts"

#connecting to servers
alias poly="ssh sellerts@unix1.csc.calpoly.edu"
alias minix="ssh sam@localhost -p 2222" 

#editing bash
alias src="source $brc"
alias editbash="vi $brc && src && hash -r"
alias eb="editbash"
alias ebs="subl $brc"
alias ep="editprofile"
alias rs="src && hash -r && reset"
alias editprofile="vi /etc/profile && reset && hash -r"

#running/developing python
alias p='for f in *.py; do python "$f"; done'
alias pi='python -i'
alias pt='cd $temp && GetTemplate a.py && subl a.py && echo "Changed to temp Directory"'

#virtual environments
alias venv="python -m venv env"
alias activate="source env/Scripts/activate"
alias act="activate"
alias deac="deactivate"

#ytdl stuff
alias ytlog="subl '$ytdl/log.txt'"
alias ytdl="cd '$ytdl' && python '$ytdl/ytdownload.py'"
alias yt="youtube-dl -f bestvideo+bestaudio --merge-output-format mkv"
alias yta="youtube-dl -x -f bestaudio --audio-format mp3"

#git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gf="git fetch"
alias gpl="git pull"
alias gp="git push"
alias gi="GetTemplate .gitignore"

#navigation
alias cd..="cd .."
alias cdt="cd $temp"
alias cdc="cd $code"

alias cdp="cd $python"
alias cds="cd $scripts"
alias cdps="cd $pythonScripts"
alias cdpt="cd $pythonTests"
alias cdpu="cd $pythonUtils"
alias cdpp="cd $pythonProjects"
alias cdpa="cd $pythonActive"

alias cdb="cd $bash"
alias cdbs="cd $bs"
alias cdbsn="cd $bsn"

alias cdd="cd $desktop"
alias cdj="cd $java"
alias cdjs="cd $js"
alias cda="cd $automation"
alias cdv="cd $video"
alias cdsv="cd $savedVideos"
alias cdm="cd $music"
alias cdu="cd $utilities"
alias cdtp="cd $templates"

alias save_main='export __SAVED_DIR_MAIN=$PWD'
alias save_return='export __SAVED_DIR_RETURN=$PWD'

alias save="save_main"
alias sw='if [ $PWD != $__SAVED_DIR_MAIN ] ; then save_return && cd $__SAVED_DIR_MAIN ; else cd $__SAVED_DIR_RETURN ; fi'

#killing processes
alias firstint="sed 's/^[^0-9]*\([0-9]\+\).*$/\1/'"
alias psm="ps aux"
alias listkill="xargs kill -9"
alias getandkill="firstint | listkill"

alias killjobs="jobs -p | listkill"

alias killpython="psm | grep python | getandkill"
alias killssh="psm | grep ssh | getandkill"
alias killmintty="psm | grep mintty | getandkill"
alias killbash="psm | grep bash | getandkill"
alias killvlc="psm | grep vlc | getandkill"

alias killall="killvlc && killjobs && killpython && killssh"

#programs
alias subl='"/C/Program Files/Sublime Text 3/subl.exe"'
alias ed="subl"
alias vlc='2>/dev/null "/C/Program Files/VideoLAN/VLC/vlc.exe"'
alias python2="C:/Python27/python.exe"
alias python3.6="C:/Users/Samue/AppData/Local/Programs/Python/Python36/python.exe"
alias open="explorer.exe"
alias chrome='"/C/Program Files (x86)/Google/Chrome/Application/chrome.exe"'

#misc template aliases
alias gl="GetTemplate LICENSE.txt"

#misc
alias server="python -m http.server 8000 &"
alias music="__temp=$(pwd) && cd $desktop/Music && vlc --random --qt-start-minimized . && cd $__temp &"
alias compressAudio="ffmpeg -codec:a libmp3lame output.mp3 -i"
alias l="ls --color=always --group-directories-first -lhAb |  awk {'print \$5\"\t\"\$9'} | sed '1iSIZE\tNAME' | column -t -s \$'\t'"
alias req="pip freeze > requirements.txt"
alias reqs="mv requirements.txt old_requirements.txt && req"

# "virtual python" automatically (de)activates virtual environments and runs python under winpty
function vp {
    if [ -d "./env" ] 
    then
        winpty --mouse ./env/Scripts/python.exe $@
    else
        winpty --mouse python $@
    fi
}

# "virtual pip" for installing packages in a virtual environment
function vpip {
    if [ -d "./env" ] 
    then
        ./env/Scripts/pip.exe $@
    else
        pip $@
    fi
}

function GetTemplate {
    cp $templates/$1 .
}

function man {
    local section=all
    if [[ "$1" =~ ^[0-9]+$ ]]; then section="$1"; shift; fi
    local doc="$(curl -v --silent --data-urlencode topic="$@" --data-urlencode section="$section" http://man.he.net/ 2>&1)"
    local ok=$?
    local pre="$(printf '%s' "$doc" | sed -ne "/<PRE>/,/<\/PRE>/ { /<PRE>/ { n; b; }; p }")"
    [[ $ok -eq 0 && -n "$pre" ]] && printf '%s' "$pre" | less || printf 'Got nothing.\n' >&2
    return $ok
}