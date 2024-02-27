#!/usr/bin/env bash

echo -ne "
███╗   ███╗██╗   ██╗███████╗██╗ ██████╗    ██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗ 
████╗ ████║██║   ██║██╔════╝██║██╔════╝    ██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗
██╔████╔██║██║   ██║███████╗██║██║         ██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝
██║╚██╔╝██║██║   ██║╚════██║██║██║         ██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗
██║ ╚═╝ ██║╚██████╔╝███████║██║╚██████╗    ██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║
╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝ ╚═════╝    ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
"

#expected to be obtained from something like a config file
MUSIC_DIR=~/music

printf "Welcome to music player.\nType exit in any of the prompt to exit if required\n"

read -p "Volume(0-100)(Default:40%): " USER_VOLUME

case $USER_VOLUME in
    [0-9]*)
        ;;
    "exit")
            exit 0
        ;;
    *)
        USER_VOLUME=40
        ;;
esac

FILE_PATH=`cd $MUSIC_DIR && ls | nl | fzf | cut -f 2`

read -p "A playlist(0) or a song()?: " IS_PLAYLIST

# Valid values for --loop are:
#     no
#     inf
#     yes
#     0-10000 (integer range)

# playlist not working
case $IS_PLAYLIST in
    0)
        mpv "$MUSIC_DIR/$FILE_PATH" --volume="$USER_VOLUME"
        mpv "$MUSIC_DIR" --shuffle --volume="$USER_VOLUME"
        ;;
    [a-zA-Z]*)
        IS_PLAYLIST=`echo $IS_PLAYLIST | tr '[:upper:]' '[:lower:]'`
        if [[ $IS_PLAYLIST -eq "exit" ]]; then
            exit 0
        fi
        ;&
    *)
        read -p "Loop it? N(0)/y/[0-9*] " IS_LOOP

        case $IS_LOOP in
            [Nn])
                mpv "$MUSIC_DIR/$FILE_PATH" --volume="$USER_VOLUME" --loop=no
                ;;
            [Yy]|"inf")
                mpv "$MUSIC_DIR/$FILE_PATH" --volume="$USER_VOLUME" --loop=inf
                ;;
            [0-9*])
                mpv "$MUSIC_DIR/$FILE_PATH" --volume="$USER_VOLUME" --loop=$IS_LOOP
                ;;
            *)
                "Don't know"
                ;;
        esac
        ;;
esac
