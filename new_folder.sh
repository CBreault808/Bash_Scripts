#!/bin/bash

mkcd_rename() {

    # Create a temporary unique directory name
    local temp_dir
    temp_dir=$(mktemp -d -p . tmp_dir_XXXXXX)

    # Enter the new directory
    cd "$temp_dir" || return

    # Prompt user for a new directory name
    echo "Currently inside temporary directory: $temp_dir"
    read -rp "Enter a new name for this directory [Default: New Directory]: " new_name

    # Applies a default name if input is empty
    if [ -z "$new_name" ]; then
        new_name="New Directory"
    fi 

    # Catch to handle name collisions (avoids overwriting existing folders)
    local final_name="$new_name"
    local counter=1
    while [ -e "../$final_name" ]; do 
        final_name="$new_name ($counter)"
        ((counter++))
    done

    # Renames the directory and updates the shell's position
    cd .. 
    mv "$temp_dir" "$final_name"
    cd "$final_name" || return

    echo "Directory renamed to: $final_name"
}

mkcd_rename
