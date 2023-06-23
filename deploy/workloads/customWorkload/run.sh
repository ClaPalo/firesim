#!/bin/bash

    # Specify the folder path where the executables are located
    folder_path="/root/"
    
    # Specify the folder path for the output files
    output_folder="/root/outputs"
    
    # Create the output folder if it doesn't exist
    mkdir -p "$output_folder"
    
    # Change directory to the specified folder
    cd "$folder_path" || exit
    
    # Loop through each file in the folder
    for file in ./*; do
        # Check if the file is executable
        if [[ -x "$file" ]]; then
            # Run the executable and redirect the output to the output folder
            output_file="$output_folder/${file##*/}.txt"
            ./"$file" > "$output_file"
            echo "Created output file: $output_file"
        fi
    done
    echo "Runs finished"
