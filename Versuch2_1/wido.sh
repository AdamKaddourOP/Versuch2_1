#!/bin/bash

# Prüfen, ob eine Datei als Parameter übergeben wurde
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <interest_list>"
    exit 1
fi

INTEREST_LIST=$1
OUTPUT_DIR="./Lesestoff"

# Prüfen, ob die Interessenliste existiert
if [ ! -f "$INTEREST_LIST" ]; then
    echo "Datei $INTEREST_LIST nicht gefunden!"
    exit 2
fi

# Verzeichnis für die Artikel erstellen
mkdir -p "$OUTPUT_DIR"

while IFS= read -r line; do
    if [ -z "$line" ]; then
        echo "Leere Zeile übersprungen."
        continue
    fi

    echo "Lade Artikel: $line"
    wikit --lang=de "$line" > "$OUTPUT_DIR/$line.txt"
    
    if [ $? -eq 0 ]; then
        echo "Artikel '$line' erfolgreich heruntergeladen."
    else
        echo "Fehler beim Herunterladen von '$line'."
    fi
done < "$INTEREST_LIST"

echo "Alle Artikel wurden verarbeitet."
