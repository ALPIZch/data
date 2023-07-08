#!/bin/bash

# Setze die erforderlichen Variablen
repository="https://github.com/ALPIZch/data.git"
ordner="/DATA/AppData/scripts/ALPIZ/lehrstellen/public"
commit_message="Updated static data"


# Ausführen der Befehle
in2csv data.xls > export.csv
csvtojson ./export.csv | jq > data.json
cp data.json /public/data.json

cd public

git init

# Füge alle Dateien zum Git-Index hinzu
git add .

# Erstelle einen neuen Commit
git commit -m "$commit_message"

# Verknüpfe das lokale Repository mit dem GitHub-Repository
git remote add origin "$repository"

# Pushe den Commit auf das GitHub-Repository
git push --set-upstream origin main

