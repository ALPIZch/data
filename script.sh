#!/bin/bash

# Führe die gewünschten Befehle aus
in2csv data.xls > export.csv
csvtojson export.csv | jq > data.json

cp data.json files/ALPIZ/582582153275