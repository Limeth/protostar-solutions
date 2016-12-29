#!/bin/bash
# This script encodes a hexadecimal value into a little-endian string
input="$@"

# Remove whitespace from the input
input="$(echo -e "${input}" | tr -d '[:space:]')"

# Prepend zeroes to the last word if the number of characters is smaller than 8
while (( ${#input} % 8 != 0 ))
do
    remainder=$(( ${#input} % 8 ))
    length=$(( ${#input} - $remainder ))

    if (( $length > 0 ))
    then
        pre=`echo "$input" | cut -c 1-$length`
    else
        pre=""
    fi

    post=`echo "$input" | cut -c $(( $length + 1 ))-`
    input="${pre}0${post}"
done

# Convert to little-endian
i=0
length=${#input}
little_endian=""

while (( i < $length ))
do
    word=`echo "$input" | cut -c $(( $i + 1 ))-$(( $i + 8 ))`
    little_endian=$little_endian`echo "$word" | grep -o .. | tac | echo "$(tr -d '\n')"`
    i=$(( $i + 8 ))
done

# Hex-dump
printf "$little_endian" | xxd -r -p
