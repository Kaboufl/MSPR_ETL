#!/bin/bash

# Ce script est destiné à faciliter l'aquisition et l'extraction des jeux de données

if [ ! -d "./data" ]; then
  mkdir data
fi

curl -L -o ./data/corona-virus-report.zip https://www.kaggle.com/api/v1/datasets/download/imdevskp/corona-virus-report

curl -L -o ./data/mpox-monkeypox-data.zip https://www.kaggle.com/api/v1/datasets/download/utkarshx27/mpox-monkeypox-data

if [ ! -d "./data/corona-virus-report" ]; then
  mkdir ./data/corona-virus-report
fi
if [ ! -d "./data/mpox" ]; then
  mkdir ./data/mpox-monkeypox-data
fi
unzip -o ./data/corona-virus-report.zip -d ./data/corona-virus-report
unzip -o ./data/mpox-monkeypox-data.zip -d ./data/mpox