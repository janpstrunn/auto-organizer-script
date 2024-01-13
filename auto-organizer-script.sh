#!/bin/bash

source_dir="$1"
dst_dir="$2"

[[ -d "$dst_dir/Media/Images" ]] || mkdir -p "$dst_dir/Media/Images"
[[ -d "$dst_dir/Documents" ]] || mkdir -p "$dst_dir/Documents"
[[ -d "$dst_dir/Others" ]] || mkdir -p "$dst_dir/Others"
[[ -d "$dst_dir/Media/Videos" ]] || mkdir -p "$dst_dir/Media/Videos"
[[ -d "$dst_dir/Media/Gifs" ]] || mkdir -p "$dst_dir/Media/Gifs"
[[ -d "$dst_dir/Applications" ]] || mkdir -p "$dst_dir/Applications"
[[ -d "$dst_dir/Torrents" ]] || mkdir -p "$dst_dir/Torrents"
[[ -d "$dst_dir/Media/Music" ]] || mkdir -p "$dst_dir/Media/Music"
[[ -d "$dst_dir/Documents/Text" ]] || mkdir -p "$dst_dir/Documents/Text"

find "$source_dir" -type f -exec bash -c '
    dst_dir="$1"
    case "$0" in
        *.jpg|*.png|*.webp|*.jpeg|*.bmp|*.tiff|*.svg|*.raw|*.jpeg) mv "$0" "$dst_dir/Media/Images/" ;;
        *.gif) mv "$0" "$dst_dir/Media/Gifs/" ;;
        *.AppImage|*.exe|*.sh|*.dmg|*.deb|*.rpm|*.msi|*.pkg|*.zip|*.tar|*.tar.gz|*.tar.bz2) mv "$0" "$dst_dir/Applications/" ;;
        *.torrent) mv "$0" "$dst_dir/Torrents/" ;;
        *.text|*.md|*.html) mv "$0" "$dst_dir/Documents/Text/" ;;
        *.pdf|*.doc|*.docx|*.odt|*.epub|*.rtf) mv "$0" "$dst_dir/Documents/" ;;
        *.mp4|*.mov|*.mkv|*.avi|*.mpeg) mv "$0" "$dst_dir/Media/Videos/" ;;
        *.mp3|*.ogg|*.aac|*.wav|*.flac|*.ape|*.aiff|*.pcm|*.opus) mv "$0" "$dst_dir/Media/Music/" ;;
        *) mv "$0" "$dst_dir/Others/" ;;
    esac
' {} "$dst_dir" \;

echo "Complete!"
