#!/bin/bash
#
# Run the bash style checker
# 
# Usage:
#
#   ./scripts/run_bash_check.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/run_bash_check.sh"
    echo " "
    exit 42
fi

shellcheck $(find . | grep "sh$" | grep -v exercises)

