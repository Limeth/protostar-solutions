#!/bin/bash
length="$1"
char="$2"
input="$3"

if (( ${#input} > $length ))
then
    ( >&2 echo "Input is too long and cannot be padded." )
    exit 1
fi

while (( ${#input} < $length ))
do
    input="$input$char"
done

echo -n "$input"
