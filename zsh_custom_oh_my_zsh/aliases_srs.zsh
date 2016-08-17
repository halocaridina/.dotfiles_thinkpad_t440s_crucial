setopt NO_HUP
setopt NO_CHECK_JOBS
setopt print_exit_value

# enable color support of ls and file types
if [ "$TERM" != "dumb" ]; then
        eval "`dircolors -b ~/.config/dircolors/dircolorsrc_srs`"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
fi

# Various aliases

alias sx='startx -- -keeptty -nolisten tcp > /tmp/xsession-errors.log 2>&1'

alias restart_udev='sudo udevadm control --reload'
alias view_recent_alerts='sudo journalctl -p err..alert -b'
alias fw_clear='sudo iptables-restore < /etc/iptables/empty.rules'

alias l='ls -Flh'
alias ll='ls -Falh'

alias mnt_office_intel="sshfs srsantos@office_intel:/Users/srsantos /home/srsantos/Documents/Remote_FS/Office_intel && /usr/bin/notify-send -u low 'Remote FS Mounted' 'Now accessible.' -i /usr/share/icons/gnome-colors-common/scalable/places/network-server.svg"
alias mnt_ubuntu_server="sshfs srsantos@ubuntu_server:/home/srsantos /home/srsantos/Documents/Remote_FS/Ubuntu_server && /usr/bin/notify-send -u low 'Remote FS Mounted' 'Now accessible.' -i /usr/share/icons/gnome-colors-common/scalable/places/network-server.svg"
alias umnt_office_intel="fusermount -u /home/srsantos/Documents/Remote_FS/Office_intel && /usr/bin/notify-send -u low 'Remote FS Unmounted' 'Bye, Bye.' -i /usr/share/icons/gnome-colors-common/scalable/places/network-server.svg"
alias umnt_ubuntu_server="fusermount -u /home/srsantos/Documents/Remote_FS/Ubuntu_server && /usr/bin/notify-send -u low 'Remote FS Unmounted' 'Bye, Bye.' -i /usr/share/icons/gnome-colors-common/scalable/places/network-server.svg"

alias ubuntu='ssh ubuntu'
alias office='ssh office'
alias skynet='ssh skynet'
alias cyberdyne='ssh cyberdyne'
alias dmc='ssh dmc'
alias uv='ssh uv'

alias open_secure_sd='sudo cryptsetup luksOpen /dev/mmcblk0p1 secure_sd'
alias close_secure_sd='sudo cryptsetup luksClose secure_sd'

alias battery_level='cat /sys/class/power_supply/BAT0/uevent | grep POWER_SUPPLY_CAPACITY='
alias i3_exit='i3-msg exit'
alias sys-info='inxi -Fxz'

alias rm_DS_Stores='find . -name ".DS_Store" -delete'

alias music_mpv='mpv --no-video'
alias music_mpv_random_playlist='mpv --no-video --shuffle --playlist <(find "$PWD" -type f)'

alias webcam_screenshot='mpv av://v4l2:/dev/video0'
alias webcam_mencoder_video='mencoder tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0:forceaudio:immediatemode=0:alsa:adevice=hw.0,0 -ofps 30 -ovc lavc -lavcopts vcodec=mjpeg -oac mp3lame -lameopts cbr:br=64:mode=3 -o'
alias webcam_ffmpeg_video='ffmpeg -f v4l2 -video_size 640x480 -thread_queue_size 1024 -pixel_format uyvy422 -framerate 29.97 -i /dev/video0 -f alsa -thread_queue_size 1024 -i hw:0,0 -acodec libmp3lame -ab 96k -c:v libx264 -aspect 4:3 -strict -2 -y -threads 4'

# Export variables

export PAGER='vimpager'
export LESS='eMq'
export EDITOR='vim'
export GCC_COLORS='error=01;38;5;160:warning=01;38;5;220:note=01;38;5;10:caret=01;38;5;33:locus=01:quote=01'
export GREP_OPTIONS=
export GREP_COLORS='fn=00;38;5;33:mc=00;36:ms=31:mt=01;38;5;200:ln=01;38;5;14'

# History
##
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
unsetopt correct_all

#Set zsh auto completion colors to dircolorsc
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
