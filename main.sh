#!/usr/bin/env bash
#--[ Informações ]------------------------------------------+
#                                                           |
# Nome: Music Download                                      |
# Versão: 1.0.0                                             |
# Criador: Sávio Cavalcante                                 |
# Dependências: yad e youtube-dl                            |
# Data de Criação: 05/01/2020                               |
#                                                           |
#--[ Descrição ]--------------------------------------------+
#                                                           |
# O objetivo do aplicativo é: baixar músicas do Youtube.    |
#                                                           |
#-----------------------------------------------------------+

FORM=$(
  yad --center --title="Music Download"                     \
  --width=400 --heigth=400                                  \
  --text="Baixar músicas do Youtube!" --text-align="center" \
  --form                                                    \
  --field="URL  : " ""                                      \
)

URL=$(echo "$FORM" | cut -d '|' -f 1)

if [[ -n "$FORM" ]]
then
  youtube-dl --extract-audio --audio-format mp3 --output '%(title)s.%(ext)s' "$URL"
else
  exit 1
fi
