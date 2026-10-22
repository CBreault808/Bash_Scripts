#!/bin/bash

read -rp "Enter temperature (-128 to 134): " TEMP

if [[ ! "$TEMP" =~ ^-?[0-9]+$ ]]; then
    echo "Error";
elif [ "$TEMP" -lt -128 ] || [ "$TEMP" -gt 134 ]; then
    echo "Error";	
elif [ "$TEMP" -lt 50 ]; then
    echo "Cold";
elif [ "$TEMP" -lt 76 ]; then
    echo "Fine";
else 
    echo "Hot";
fi
