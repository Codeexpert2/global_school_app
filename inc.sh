#!/bin/bash
set -e

# Find and increment the version number.
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml

# Get the current version from pubspec.yaml
current_version=$(grep -o 'version: [0-9]*\.[0-9]*\.[0-9]*' pubspec.yaml | grep -o '[0-9]*\.[0-9]*\.[0-9]*')

# Split the version into parts using dot as the delimiter.
IFS='.' read -ra version_parts <<< "$current_version"

# Increment the last part of the version.
((version_parts[2]++))

# Join the version parts back together with dots.
new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"

# According to ChatGPT , Solve this problem by make temp file 
# sed: 1: "pubspec.yaml": extra characters at the end of p command
# Replace the version in pubspec.yaml and create a temporary file
sed "s/version: $current_version/version: $new_version/" pubspec.yaml > pubspec_temp.yaml

# Update the name field in the temporary file
sed "s/name: old_name/name: new_name/" pubspec_temp.yaml > pubspec_updated.yaml

# Overwrite the original file with the updated temporary file
mv pubspec_updated.yaml pubspec.yaml

# Clean up temporary files
rm pubspec_temp.yaml