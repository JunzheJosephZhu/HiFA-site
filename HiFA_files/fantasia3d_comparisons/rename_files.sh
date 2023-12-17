#!/bin/bash

# Loop through all files in the current directory
for file in *; do
    # Skip if it's a directory
    if [ -d "$file" ]; then
        continue
    fi

    # Replace spaces with underscores and remove quotes and backticks
    newname=$(echo "$file" | sed 's/ /_/g' | tr -d '”' | tr -d '`')

    # Rename the file if the new name is different
    if [ "$file" != "$newname" ]; then
        mv -n "$file" "$newname"
    fi
done

