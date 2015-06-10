#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Should run with sudo. Tip: type (sudo !!) "
    exit
fi
chmod +x content.bat
./content.bat > index.html

