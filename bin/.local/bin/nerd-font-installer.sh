#!/bin/bash

declare -a fonts=(
    FiraCode
    FiraMono
    Hack
    JetBrainsMono
    Ubuntu
    UbuntuMono
)

fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${zip_file}"
    echo "Downloading $font"
    wget --quiet "$download_url"
    echo "Installing $font ..."
    unzip -qq -o "$zip_file" -d "$fonts_dir"
    rm -f "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete
find "$fonts_dir"/* -regex '.*[^f]$' -delete

echo "Updating font cache ..."
fc-cache -f
