#!/bin/bash

function extract_number() {
    local input="$1"
    local number=$(echo "$input" | grep -o '[0-9.]*')

    if [[ "$number" == *"."* ]]; then
        local integer_part=$(echo "$number" | cut -d'.' -f1)
        local decimal_part=$(echo "$number" | cut -d'.' -f2)
        if [ ${#decimal_part} -gt 2 ]; then
            decimal_part=$(echo "$decimal_part" | cut -c -2)
        fi
        number="$integer_part.$decimal_part"
    else
        number="$number.00"
    fi

    echo "$number"
}

input1="abcd123.456"
input2="abcd123"

echo $(extract_number "$input1")
echo $(extract_number "$input2")
