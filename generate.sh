#!/bin/bash

# Check if a base directory was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <base_directory>"
  exit 1
fi

# Set the base directory to the first argument
base_dir="$1"

# Parameters for folder and file creation
num_folders=5      # Number of subdirectories to create
files_per_folder=5 # Number of YAML files per subdirectory

# Create the base directory if it doesn't exist
mkdir -p "$base_dir"

# Generate unique three-letter folder codes
folder_codes=()
while [ ${#folder_codes[@]} -lt $num_folders ]; do
    code=$(tr -dc 'a-z' </dev/urandom | head -c 3)
    # Check for duplicate codes
    if [[ ! " ${folder_codes[@]} " =~ " ${code} " ]]; then
        folder_codes+=("$code")
    fi
done

# Loop over each folder code to create subdirectories and files
for folder in "${folder_codes[@]}"; do
    folder_path="$base_dir/$folder"
    mkdir -p "$folder_path"
    
    # Create YAML files in the folder
    for (( i=1; i<=files_per_folder; i++ )); do
        unique_id=$(printf "%s%03d" "$folder" "$i")  # e.g., abc001, abc002, etc.
        file_name="exception_${unique_id}.yaml"
        file_path="$folder_path/$file_name"
        
        cat <<EOF > "$file_path"
---
general:
  policy:
    name: 'Test Exception ${unique_id}'
    type: exception
    path: test.high.exception.${unique_id}

control:
  path: f.ci.github.code_scanning.alerts

policy:
- criteria:
    expression: application.name == 'Digital Bank Experience'
  policy:
    required: true
    vulnerabilities:
      critical:
        maximum: 0
        exceptions: []
      high:
        maximum: 0
        exceptions:
        - go/hardcoded-credentials

expiration:
  timestamp: '2025-03-01T14:56:01Z'

override:
  asset:
    types:
    - application
EOF

    done
done

echo "Directory structure generated successfully in '$base_dir'."
