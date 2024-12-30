#!/bin/bash

sh inc.sh

dart fix --apply

flutter clean && flutter build appbundle

# firebase crashlytics:symbols:upload --app=1:839865712716:android:d947678144e9e5c22034e9 build/app/intermediates/stripped_native_libs/release/out/lib


# # Path to the pubspec.yaml file
# pubspec_file="pubspec.yaml"

# # Get the version string from pubspec.yaml using grep and sed
# version_string=$(grep -E "^\s*version:" "$pubspec_file" | sed -E 's/^\s*version:\s*(.+)\s*$/\1/')

# # Split the version string into version name and build number
# IFS='+' read -ra version_parts <<< "$version_string"
# version_name="${version_parts[0]}"
# build_number="${version_parts[1]}"

# # Set your commit message
# COMMIT_MESSAGE="Update Android Version name:$version_name | Build number: $build_number"

# # Add and commit changes
# # git add $pubspec_file 
# # git add .
# # git commit -m "$COMMIT_MESSAGE"

# # Push changes to GitHub
# # git push
# # git push origin master