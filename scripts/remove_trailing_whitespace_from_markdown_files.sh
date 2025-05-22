#!/bin/bash
# Adapted fFrom https://gist.github.com/dtuite/6314519#file-remove_trailing_whitespace-sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/remove_trailing_whitespace_from_markdown_files.sh"
    echo " "
    exit 42
fi

# Remove trailing whitespace from files in the src directory.

# This is useful because (for example) trailing whitespace hinders Vim's 
# paragraph movement.

# INFO: http://stackoverflow.com/a/4438318/574190
# INFO: http://stackoverflow.com/q/1583219/574190

# Get a list of files in the src directory (this is specific to this project)
# which match the passed in matcher.
function find_src_files_of_name {
  find $PWD -type f -name "$1" -print0 
}

# Given a list of files, remove trailing whitespace from them.
function remove_trailing_whitespace {
  # This is specific to OSX. The linux version would not need the single quotes
  # after the -i flag.
  # The e flag indicates extended regular expressions.
  xargs -0 sed -i '' -e 's/[[:space:]]*$//' 
}

find_src_files_of_name '*.md' | remove_trailing_whitespace

