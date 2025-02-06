#!/bin/bash

# Ensure a search string is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <search_string>"
    exit 1
fi

SEARCH_STRING="$1"
USER="alice_alshifan"

# Ensure the user exists
if ! id "$USER" &>/dev/null; then
    echo "Error: User '$USER' does not exist."
    exit 1
fi

# Find files containing the search string and update permissions
find /home -type f -exec grep -l "$SEARCH_STRING" {} \; 2>/dev/null | while read -r file; do
    if [ -f "$file" ]; then
        # Change file ownership to Alice_<YourFullName>
        chown "$USER" "$file"

        # Set permissions: Read-only for Alice_<YourFullName>, no access for others
        chmod 400 "$file"

        echo "Updated permissions for: $file"
    else
        echo "Skipping non-regular file: $file"
    fi
done

echo "Script execution completed."
