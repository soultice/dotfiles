setopt clobber

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

export PATH=$PATH:/home/flo/panel/
export PANEL_FIFO="/tmp/panel-fifo"

export TERM=xterm-256color
export PATH="$HOME/Android/Sdk/tools:$PATH"
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk/"
export JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-amd64'
export SCALA_HOME="$HOME/Programs/scala-2.11.8/"
export PATH="$PATH:$SCALA_HOME/bin"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias reload='source ~/.zshrc'
alias disable_touch='xinput set-prop 12 "Device Enabled" 0'
alias enable_touch='xinput set-prop 12 "Device Enabled" 1'
alias op='gnome-open'
alias batstats='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias rs_wifi='wifi toggle && wifi toggle && sudo service network-manager restart'
alias pacp='pwd|pbcopy'
alias mobile='echo 100 | sudo tee /sys/devices/platform/smapi/BAT0/stop_charge_thresh \
              && echo 80 | sudo tee /sys/devices/platform/smapi/BAT0/start_charge_thresh'
alias station='echo 80 | sudo tee /sys/devices/platform/smapi/BAT0/stop_charge_thresh \
              && echo 40 | sudo tee /sys/devices/platform/smapi/BAT0/start_charge_thresh'
alias awake='wakeonlan -i 46.128.10.104 2C:56:DC:38:AA:30'

# Path aliases

alias ws='cd ~/Dropbox/2015_WS_LMU'
alias stream30='cd ~/Downloads/ && java -jar moonlight-lin64.jar -host 46.128.10.104 -30fps'
alias analyze='baobab'
alias example='f() { echo Your arg was $1. };f'

#functions
ydl () {
    if [ $2 = "" ]
    then
        echo "no path"
        youtube-dl -xi  -f bestaudio --audio-format mp3 -o "%(title)s.%(ext)s" $1
    else
        youtube-dl -xi -f bestaudio --audio-format mp3 -o "$2/%(title)s.%(ext)s" $1
    fi
}

scann () {
    echo $1
    if ["$1" = low ]; then
        res=75
    elif ["$1"= high]; then
        res=600
    fi
    echo res: $res dpi
        scanimage --mode=color --resolution=$res -l 0 > /tmp/scan && convert /tmp/scan ~/$2.png
    rm -f /tmp/scan
}

modebat () {
    if [ "$1" = mobile ]; then
        sudo echo 2>&1| 100 > /tmp/high
        rsync /tmp/high /sys/devices/platform/smapi/BAT0/stop_charge_thresh
        sudo echo 2>&1| 80 > /tmp/low
        rsync /tmp/low /sys/devices/platform/smapi/BAT0/start_charge_thresh
        echo mobile mode
    elif [ "$1" = station ]; then
        sudo echo 2>&1| 80 > /tmp/high
        sudo rsync /tmp/high /sys/devices/platform/smapi/BAT0/stop_charge_thresh
        sudo echo 2>&1| 40 > /tmp/low
        sudo rsync /tmp/low /sys/devices/platform/smapi/BAT0/start_charge_thresh
        echo stationary mode
    fi
}


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/flo/.sdkman"
#[[ -s "/home/flo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/flo/.sdkman/bin/sdkman-init.sh"
