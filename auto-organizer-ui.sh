#!/bin/bash

source_dir=$(zenity --file-selection --directory --title="Select Source Directory")
destination_dir=$(zenity --file-selection --directory --title="Select Destination Directory")

if [ -z "$source_dir" ] || [ -z "$destination_dir" ]; then
    zenity --error --text="Please select both source and destination directories."
    exit 1
fi

[[ -d "$destination_dir/Media/Images" ]] || mkdir -p "$destination_dir/Media/Images"
[[ -d "$destination_dir/Documents" ]] || mkdir -p "$destination_dir/Documents"
[[ -d "$destination_dir/Others" ]] || mkdir -p "$destination_dir/Others"
[[ -d "$destination_dir/Media/Videos" ]] || mkdir -p "$destination_dir/Media/Videos"
[[ -d "$destination_dir/Media/Gifs" ]] || mkdir -p "$destination_dir/Media/Gifs"
[[ -d "$destination_dir/Applications" ]] || mkdir -p "$destination_dir/Applications"
[[ -d "$destination_dir/Torrents" ]] || mkdir -p "$destination_dir/Torrents"
[[ -d "$destination_dir/Media/Music" ]] || mkdir -p "$destination_dir/Media/Music"
[[ -d "$destination_dir/Documents/Text" ]] || mkdir -p "$destination_dir/Documents/Text"

(
  echo "0"
  find "$source_dir" -type f | while read -r file; do
    case "$file" in
      *.jpg|*.png|*.webp|*.jpeg|*.bmp|*.tiff|*.svg|*.raw|*.jpeg) mv "$file" "$destination_dir/Media/Images/" ;;
      *.gif) mv "$file" "$destination_dir/Media/Gifs/" ;;
      *.AppImage|*.exe|*.sh|*.dmg|*.deb|*.rpm|*.msi|*.pkg|*.zip|*.tar|*.tar.gz|*.tar.bz2) mv "$file" "$destination_dir/Applications/" ;;
      *.torrent) mv "$file" "$destination_dir/Torrents/" ;;
      *.text|*.md|*.html) mv "$file" "$destination_dir/Documents/Text/" ;;
      *.pdf|*.doc|*.docx|*.odt|*.epub|*.rtf) mv "$file" "$destination_dir/Documents/" ;;
      *.mp4|*.mov|*.mkv|*.avi|*.mpeg) mv "$file" "$destination_dir/Media/Videos/" ;;
      *.mp3|*.ogg|*.aac|*.wav|*.flac|*.ape|*.aiff|*.pcm|*.opus) mv "$file" "$destination_dir/Media/Music/" ;;
      *) mv "$file" "$destination_dir/Others/" ;;
    esac
  done
 echo "Complete!"
)
