export TERM=xterm-256color
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...
alias reload='source ~/.zshrc'
alias progsem='cd ~/Dropbox/2015_SS_LMu/Semantik/'
alias disable_touch='xinput set-prop 12 "Device Enabled" 0'
alias enable_touch='xinput set-prop 12 "Device Enabled" 1'
alias op='gnome-open'
alias batstats='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
alias rs_wifi='wifi toggle && wifi toggle'
alias cppa='pwd|pbcopy'

# Path aliases
alias semantik='cd /home/flo/Dropbox/2015_SS_LMu/Semantik/prolog_sem'
alias suchmasch='cd ~/Dropbox/2015_SS_LMu/Suchmaschinen/de_maschin/'
alias programs='cd ~/Programs/'
alias ws='cd ~/Dropbox/2015_WS_LMU'


