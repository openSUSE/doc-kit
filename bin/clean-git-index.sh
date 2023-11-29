#!/usr/bin/env bash
while IFS= read -r line; do
    # Check if the line represents a valid filename
    if [ -f "$line" ]; then
        echo -e "Removing file $line from GIT index"
        git rm --cached $line
    fi
done < ".gitignore"
