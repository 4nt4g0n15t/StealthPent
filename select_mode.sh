#!/bin/bash

echo "Select Mode:"
echo "1. Standard Mode"
echo "2. Paranoid Mode"

read -p "Enter your choice (1 or 2): " mode_choice

if [ "$mode_choice" == "1" ]; then
    cp scripts/standard/* scripts/selected/
    echo "Standard mode selected."
elif [ "$mode_choice" == "2" ]; then
    cp scripts/paranoid/* scripts/selected/
    echo "Paranoid mode selected."
else
    echo "Invalid choice. Exiting."
    exit 1
fi
