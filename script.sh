#!/bin/bash

# Setze die erforderlichen Variablen
repository="https://github.com/ALPIZch/data.git"
ordner="/DATA/AppData/scripts/ALPIZ/lehrstellen"
commit_message="Updated external Data"

# Führe die gewünschten Befehle aus
in2csv data.xls > export.csv
csvtojson export.csv | jq > data.json

# Erstelle einen temporären Ordner
temp_dir=$(mktemp -d)

# Kopiere den gewünschten Ordner in den temporären Ordner
cp -r "$ordner" "$temp_dir"

# Navigiere in den temporären Ordner
cd "$temp_dir"

# Initialisiere ein neues Git-Repository
git init

# Füge alle Dateien zum Git-Index hinzu
git add .

# Erstelle einen neuen Commit
git commit -m "$commit_message"

# Verknüpfe das lokale Repository mit dem GitHub-Repository
git remote add origin "$repository"

# Pushe den Commit auf das GitHub-Repository
git push -u origin master

# Navigiere zurück zum ursprünglichen Verzeichnis
cd -

# Lösche den temporären Ordner
rm -rf "$temp_dir"
