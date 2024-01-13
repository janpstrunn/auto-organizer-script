#!/bin/bash

source="$1"
destiny="$2"

[[ -d "$destiny/Media/Images" ]] || mkdir -p "$destiny/Media/Images"
[[ -d "$destiny/Documents" ]] || mkdir -p "$destiny/Documents"
[[ -d "$destiny/Others" ]] || mkdir -p "$destiny/Others"
[[ -d "$destiny/Media/Videos" ]] || mkdir -p "$destiny/Media/Videos"
[[ -d "$destiny/Media/Gifs" ]] || mkdir -p "$destiny/Media/Gifs"
[[ -d "$destiny/Applications" ]] || mkdir -p "$destiny/Applications"
[[ -d "$destiny/Torrents" ]] || mkdir -p "$destiny/Torrents"
[[ -d "$destiny/Media/Music" ]] || mkdir -p "$destiny/Media/Music"
[[ -d "$destiny/Documents/Text" ]] || mkdir -p "$destiny/Documents/Text"

find "$source" -type f -exec bash -c '
    destiny="$1"
    case "$0" in
        *.jpg|*.png|*.webp|*.jpeg|*.bmp|*.tiff|*.svg|*.raw|*.jpeg) mv "$0" "$destiny/Media/Images/" ;;
        *.gif) mv "$0" "$destiny/Media/Gifs/" ;;
        *.AppImage|*.exe|*.sh|*.dmg|*.deb|*.rpm|*.msi|*.pkg|*.zip|*.tar|*.tar.gz|*.tar.bz2) mv "$0" "$destiny/Applications/" ;;
        *.torrent) mv "$0" "$destiny/Torrents/" ;;
        *.text|*.md|*.html) mv "$0" "$destiny/Documents/Text/" ;;
        *.pdf|*.doc|*.docx|*.odt|*.epub|*.rtf) mv "$0" "$destiny/Documents/" ;;
        *.mp4|*.mov|*.mkv|*.avi|*.mpeg) mv "$0" "$destiny/Media/Videos/" ;;
        *.mp3|*.ogg|*.aac|*.wav|*.flac|*.ape|*.aiff|*.pcm|*.opus) mv "$0" "$destiny/Media/Music/" ;;
        *) mv "$0" "$destiny/Others/" ;;
    esac
' {} "$destiny" \;

echo "Complete!"
