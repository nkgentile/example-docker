#!/bin/sh


echo "Replacing environment variables..."

# Check if SANITY_DATASET environment variable is set
if [ -z "$SANITY_DATASET" ]; then
  echo "Error: SANITY_DATASET environment variable is not set"
  exit 1
fi

# Replace __DATASET__ with the value of the SANITY_DATASET environment variable in all files in `/usr/share/nginx/html`
for file in /usr/share/nginx/html/static/*; do
    if [ -f "$file" ]; then
        # Check if the file contains __DATASET__ before making the replacement
        if grep -q "__DATASET__" "$file"; then
            # Perform the replacement
            sed -i "s/__DATASET__/${SANITY_DATASET}/g" "$file"
            # Check if the replacement was successful
            if ! grep -q "__DATASET__" "$file"; then
                echo "Replaced __DATASET__ in $file"
            fi
        fi
    fi
done

echo "Replacement done"
