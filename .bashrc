
#Pathing constants
mainDrive="/c"
bulk="/d"

userHome="$mainDrive/Users/Samue"
appData="$userHome/AppData"
roaming="$appData/Roaming"

desktop="$userHome/Desktop"
desk=$desktop

code="$desktop/code"

python="$code/python"
scripts="$python/scripts"
pythonActive="$python/active"
pythonProjects="$python/projects"
pythonScripts="$scripts"
pythonUtils="$scripts/my_utils"
pythonTests="$python/tests"
pythonKata="$python/kata"

ytdl="$pythonActive/ytdl"

poly_files="$code/poly_files"

temp="$code/temp"

bash="$code/bash"
bs="$bash/scripts"
bsn="$bash/snippets"
brc="~/.bashrc"

java="$code/java"

javascript="$code/javascript"
js="$javascript"

cpp="$code/cpp"

automation="$code/automation"

utilities="$code/utils"
utils="$utilities"

templates="$code/templates"

ctf="$code/ctf"

video="$desktop/video"
savedVideos="$bulk/saved_yt_videos"

music="$bulk/music"

sublimeConfig="$roaming/Sublime Text 3/Packages/User"

#PATH changes
PATH="$PATH:$utils/"
PATH="$PATH:/c/Users/nword33/Downloads/youtube-dl"
PATH="$PATH:/c/Gradle/gradle-6.2.1/bin"

#remotes (lowercase for hostname, uppercase for user@host)
username="sellerts"
unix1="unix1.csc.calpoly.edu"
Unix1="$username@$unix1"
webdevserver="ec2-34-221-236-150.us-west-2.compute.amazonaws.com"
Webdevserver="$username@$webdevserver"
frankserver="frank.ored.calpoly.edu"
Frankserver="sellerts466@$frankserver"
frank_iden="-i ~/.ssh/466key.pem"

#connecting to servers
alias poly="ssh $Unix1"
alias webdev="ssh $Webdevserver"
alias frank="ssh $frank_iden $Frankserver"

#editing bash
alias src="source $brc"
alias editbash="vi $brc && src && hash -r"
alias eb="editbash"
alias ebs="subl $brc"
alias rs="src && hash -r && reset"
alias editprofile="subl /etc/profile && reset && hash -r"
alias ep="editprofile"

#running/developing python
alias p='for f in *.py; do python "$f"; done'
alias pi='python -i'
alias pt='cd $temp && GetTemplate a.py && subl a.py && echo "Changed to temp Directory"'
alias pt2='cd $temp && GetTemplate a2.py a.py && subl a.py && echo "Changed to temp Directory"'
alias pt3='cd $temp && GetTemplate a3.py a.py && subl a.py && echo "Changed to temp Directory"'
alias pth='GetTemplate a.py && subl a.py && echo "a.py created in: $PWD"'
alias pip="pip3.8" #workaround
alias pdb="vp -m pdb"
alias pytohn="python" #common typo
alias pup="vpip install --upgrade"

#virtual environments
alias venv="python -m venv venv"
alias activate="source venv/Scripts/activate"
alias act="activate"
alias deac="deactivate"

function cact {
    eval "$('/c/Users/Samue/anaconda3/Scripts/conda.exe' 'shell.bash' 'hook')"
}
alias cdeac="conda deactivate"

#ytdl stuff
alias ytlog="subl '$ytdl/log.txt'"
alias ytdl="cd '$ytdl' && python '$ytdl/ytdownload.py'"
alias yt='youtube-dl -f bestvideo+bestaudio --merge-output-format mkv -o "%(title)s.%(ext)s"'
alias yta='youtube-dl -x -f bestaudio --audio-format mp3 -o "%(title)s.%(ext)s"'

#git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gf="git fetch"
alias gpl="git pull"
alias gp="git push"
alias gcl="git clone"

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
alias cdpk="cd $pythonKata"

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
alias cdcpp="cd $cpp"
alias cdpl="cd $poly_files"

#cd alias's that are gross
alias cdsubl='command cd "$sublimeConfig"'

#easy way to save a directory and swap to and from it
alias save='export SAVED_DIR=$PWD'
alias sw='if [ $PWD == $SAVED_DIR ]; then command cd $OTHER_SAVED_DIR; else export OTHER_SAVED_DIR=$PWD; command cd $SAVED_DIR; fi'

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
alias python3.7="C:/Users/Samue/AppData/Local/Programs/Python/Python37/python.exe"
alias open="explorer.exe"
alias chrome='"/C/Program Files (x86)/Google/Chrome/Application/chrome.exe"'

#misc template aliases
alias gl="GetTemplate LICENSE.txt"
alias getpyinit="GetTemplate __init__.py"

#misc
alias server="python -m http.server 8000 &"
alias music="__temp=$(pwd) && cd $desktop/Music && vlc --random --qt-start-minimized . && cd $__temp &"
alias compressAudio="ffmpeg -codec:a libmp3lame output.mp3 -i"
alias l="ls --color=always --group-directories-first -lhAb |  awk {'print \$5\"\t\"\$9'} | sed '1iSIZE\tNAME' | column -t -s \$'\t'"
alias req="pip freeze > requirements.txt"
alias reqs="mv requirements.txt old_requirements.txt && req"
alias pprint="pygmentize -g -O style=monokai,linenos=1"
alias pp="pprint"

#curl programs
alias wttr="curl wttr.in"
alias coin="curl rate.sx"
alias bat="curl rate.sx/BAT"
alias ip="curl ipinfo.io"

#enable autocd
shopt -s autocd cdspell

#only save unique commands to history
export HISTCONTROL=ignoredups

#stop EOF from closing bash
export IGNOREEOF=9999

#change prompt display (new version same, but faster)
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS1="\[\e[1m\]\[\e[31m\][\[\e[33m\]\u\[\e[32m\]@\[\e[34m\]\h \[\e[35m\]\W\[\e[31m\]]\[\e[37m\]\$ \[\e[0;10m\]"

#make python REPL run my startup script
export PYTHONSTARTUP="$pythonUtils/repl_startup.py"

#overriding cd to allow for fuzzy matching
function cd() {
    command cd $1 2> /dev/null
    exit_code="$?"

    if [ $exit_code == "1" ]; 
    then
        closest=$(fuzzymatch -w $1 $(command echo */))
        echo "closest match: $closest"
        command cd $closest
    fi
}

#creates a .gitignore file. Uses template if no params, otherwise uses getignore script to query gitignore.io
function gi(){
    if [ $# -eq 0 ]; then
        GetTemplate .gitignore
    else
        getignore $@
    fi
}

# "virtual python" automatically (de)activates virtual environments
function vp {
    if [ -d "./venv" ] 
    then
        ./venv/Scripts/python.exe $@
    else
        python $@
    fi
}

# "virtual pip" for installing packages in a virtual environment
function vpip {
    if [ -d "./venv" ] 
    then
        ./venv/Scripts/pip.exe $@
    else
        pip $@
    fi
}

function GetTemplate {
    if [ $# -eq 1 ]; then
        cp $templates/$1 .
    else
        cp $templates/$1 ./$2
    fi
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

function gettests {
    GetTemplate tests.py test_funcs.py

    if [ -d "./venv" ] 
    then
        vpip install pytest coverage
    fi
}

#Run tests on python files, defaults to *.py when run with no arguments
function check {
    if [ -d "./venv" ] 
    then
        activate
    fi
    
    if [ $# -eq 0 ]; then
        pyflakes *.py
        coverage run --source . --omit "venv/*" -m pytest --doctest-modules
    else
        pyflakes $@
        coverage run --source . --omit "venv/*" -m pytest --doctest-modules $@
    fi

    coverage report -m

    if [ -d "./venv" ] 
    then
        deactivate
    fi
}

#Generates a coverage report and opens it in the browser
function report {
    coverage html
    open ./htmlcov/index.html
}

#Remove files and folders generated by testing
function clean {
    rm -rf ./htmlcov ./__pycache__ ./.pytest_cache ./.coverage ./*,cover
}

function scale {
    convert $1 -resize $3 $2
}

function upscale {
    waifu2x-caffe-cui.exe -i $1 -m noise_scale --scale_ratio $2 --noise_level 1 -p cpu -c 480 --tta 0 --output_extension png --model_dir "models/upconv_7_anime_style_art_rgb"
}

function compressVideo {
    filename=$(basename -- "$1")
    filename="${filename%.*}"

    ffmpeg -i "$1" -vcodec libvpx-vp9 -b:v 1M -acodec libvorbis "$filename.webm"
}

function qr {
    curl "qrenco.de/$1"
}

function dict {
    curl "dict://dict.org/d:$1"
}

cdt
