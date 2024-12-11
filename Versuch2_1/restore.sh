#!/bin/bash

for img in *.gpg; do
    if [ "$img" != "encrypt.sh.gpg" ] && [ "$img" != "restore.sh.gpg" ]; then
        echo "Restoring $img..."
        
        # Name anpassen (.gpg entfernen)
        original_name="${img%.gpg}"
        
        # Entschlüsseln mit GPG
        gpg --output "$original_name" --decrypt "$img"
        
        # Löschen der verschlüsselten Datei
        rm "$img"
    fi
done

echo "Restoration process complete."

