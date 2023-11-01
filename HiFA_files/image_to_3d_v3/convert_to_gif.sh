#!/bin/bash

rm dest
ln -s /mnt/B7B8-1421/tmp2 dest

# Declare an array to store filenames
declare -a files_array

# Read filenames into the array
while IFS= read -r name; do
    files_array+=("$name")
done < <(find dest/ -type f -name "*_rgb.mp4")

# Loop through the array and process each filename
for name in "${files_array[@]}"; do
    # Remove newline characters (if any)
    name=$(echo "$name" | tr -d '\n')

    # Extract the keyword between "trials_" and the following "("
    keyword=$(echo "$name" | awk -F'/' '{split($(NF-2),a,"("); print a[1]}' | sed 's/trials_//')
    
    # Extract the base name without extension
    bn=$(basename "$name" .mp4)
    
    # Generate the new name with the keyword prepended
    newname="${keyword}_${bn}"

    # Print debug information
    echo "Original Name: $name"
    echo "DEBUG: Current name = $name"
    echo "DEBUG: Extracted keyword = $keyword"

    # Convert to GIF
    ffmpeg -i "$name" frame%04d.png
    gifski -o "$newname.gif" frame*.png
    find . -name "frame*.png" -delete
done
