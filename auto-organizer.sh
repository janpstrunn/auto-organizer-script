#!/bin/bash

source_dir="/path/to/folder"
destination_dir="/path/to/folder"

[[ -d "$destination_dir/Media/Images" ]] || mkdir -p "$destination_dir/Media/Images"
[[ -d "$destination_dir/Documents" ]] || mkdir -p "$destination_dir/Documents"
[[ -d "$destination_dir/Others" ]] || mkdir -p "$destination_dir/Others"
[[ -d "$destination_dir/Media/Videos" ]] || mkdir -p "$destination_dir/Media/Videos"
[[ -d "$destination_dir/Media/Gifs" ]] || mkdir -p "$destination_dir/Media/Gifs"
[[ -d "$destination_dir/Applications" ]] || mkdir -p "$destination_dir/Applications"
[[ -d "$destination_dir/Torrents" ]] || mkdir -p "$destination_dir/Torrents"
[[ -d "$destination_dir/Media/Music" ]] || mkdir -p "$destination_dir/Media/Music"
[[ -d "$destination_dir/Documents/Text" ]] || mkdir -p "$destination_dir/Documents/Text"

find "$source_dir" -type f -exec bash -c '
    destination_dir="$HOME/Downloads/Cavalo"
    case "$0" in
        *.jpg|*.png|*.webp|*.jpeg|*.bmp|*.tiff|*.svg|*.raw|*.jpeg) mv "$0" "$destination_dir/Media/Images/" ;;
        *.gif) mv "$0" "$destination_dir/Media/Gifs/" ;;
        *.AppImage|*.exe|*.sh|*.dmg|*.deb|*.rpm|*.msi|*.pkg|*.zip|*.tar|*.tar.gz|*.tar.bz2) mv "$0" "$destination_dir/Applications/" ;;
        *.torrent) mv "$0" "$destination_dir/Torrents/" ;;
        *.text|*.md|*.html) mv "$0" "$destination_dir/Documents/Text/" ;;
        *.pdf|*.doc|*.docx|*.odt|*.epub|*.rtf) mv "$0" "$destination_dir/Documents/" ;;
        *.mp4|*.mov|*.mkv|*.avi|*.mpeg) mv "$0" "$destination_dir/Media/Videos/" ;;
        *.mp3|*.ogg|*.aac|*.wav|*.flac|*.ape|*.aiff|*.pcm|*.opus) mv "$0" "$destination_dir/Media/Music/" ;;
        *) mv "$0" "$destination_dir/Others/" ;;
    esac
' {} \;
