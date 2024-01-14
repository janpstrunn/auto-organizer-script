#!/bin/bash

dir1=$(zenity --file-selection --directory --title="Select Source Directory")
dir2=$(zenity --file-selection --directory --title="Select Destination Directory")

if [ -z "$dir1" ] || [ -z "$dir2" ]; then
    zenity --error --text="Please select both source and destination directories."
    exit 1
fi

[[ -d "$dir2/Media/Images" ]] || mkdir -p "$dir2/Media/Images"
[[ -d "$dir2/Documents" ]] || mkdir -p "$dir2/Documents"
[[ -d "$dir2/Others" ]] || mkdir -p "$dir2/Others"
[[ -d "$dir2/Media/Videos" ]] || mkdir -p "$dir2/Media/Videos"
[[ -d "$dir2/Media/Gifs" ]] || mkdir -p "$dir2/Media/Gifs"
[[ -d "$dir2/Applications" ]] || mkdir -p "$dir2/Applications"
[[ -d "$dir2/Torrents" ]] || mkdir -p "$dir2/Torrents"
[[ -d "$dir2/Media/Music" ]] || mkdir -p "$dir2/Media/Music"
[[ -d "$dir2/Documents/Text" ]] || mkdir -p "$dir2/Documents/Text"

(
  echo "0"
  find "$dir1" -type f | while read -r file; do
    case "$file" in
      *.jpg|*.png|*.webp|*.jpeg|*.bmp|*.tiff|*.svg|*.raw|*.jpeg) mv "$file" "$dir2/Media/Images/" ;;
      *.gif) mv "$file" "$dir2/Media/Gifs/" ;;
      *.AppImage|*.exe|*.sh|*.dmg|*.deb|*.rpm|*.msi|*.pkg|*.zip|*.tar|*.tar.gz|*.tar.bz2) mv "$file" "$dir2/Applications/" ;;
      *.torrent) mv "$file" "$dir2/Torrents/" ;;
      *.text|*.md|*.html) mv "$file" "$dir2/Documents/Text/" ;;
      *.pdf|*.doc|*.docx|*.odt|*.epub|*.rtf) mv "$file" "$dir2/Documents/" ;;
      *.mp4|*.mov|*.mkv|*.avi|*.mpeg) mv "$file" "$dir2/Media/Videos/" ;;
      *.mp3|*.ogg|*.aac|*.wav|*.flac|*.ape|*.aiff|*.pcm|*.opus) mv "$file" "$dir2/Media/Music/" ;;
      *) mv "$file" "$dir2/Others/" ;;
    esac
  done
 echo "Complete!"
)
