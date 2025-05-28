# sed 

The command ``sed`` (stream editor) is one of the most powerful commands. It is used for textual processing - parsing and transforming text. It uses a simple, but compact programming language. 

After the programming language AWK was developed, ``sed`` and ``awk`` are often used together, particularly in scripts. Together they are commonly considered progenitors and inspiration for Perl. 

## Syntax 

```bash
sed [options] 'command' [inputfile...]
```

where 
- **options** are optional flags that modify the behavior of the sed command
- **command** is a command or sequence of commands to execute on the inputfile(s) 
- **inputfile** is one or more inputfiles that is to be processed 

## Common ``sed`` options 

- **-i** - Edit the file in place without printing to the console (overwrite the file).
- **-n** - Suppress automatic printing of lines.
- **-e** - Allows multiple commands to be executed.
- **-f** - Reads ``sed`` commands from a file instead of the command line.
- **-r** - Enables extended regular expressions. 

## Substitution command

This is probably what ``sed`` is most commonly used for: substitution. It is also the original motivation for creating it. 

**Syntax**
```bash
sed 's/regexp/replacement/g' inputFileName > outputFileName
``` 

- **regexp** is a regular expression (pattern) to be searched, including a text. 
- **replacement** is what should be replaced for the matched patterns - literal text or format string the characters ``&`` for "entire match" or the special escape sequences ``\1`` through ``\9`` for the nth saved sub-expression.
- **inputFileName** is the file(s) to be searched
- **outputFileName** is the name(s) of the changed files - if not given the changed content is just shown on screen.  

**s** stands for substitute, **g** for global (all instances), and **/** is the conventional delimiting symbol used. 

### Example 

!!! note "Replace all instances of 'cat' with 'ferret' and send to screen" 

    Use the file "file1.txt" in "exercises -> "sed" 

    ```bash
    sed 's/cat/ferret/g' file1.txt
    ``` 

!!! note "Replace all instances of 'cat' with 'ferret' and write to a file"

    Use the file "file1.txt" in "exercises -> "sed"

    ```bash
    sed 's/cat/ferret/g' file1.txt > output.txt
    ```

!!! note "Replace the nth occurance of a pattern in a line" 

    Let us change the 3rd occurance in the same line of word to book in file3.txt

    ```bash
    sed 's/word/book/3' file3.txt 
    ```

!!! note "Replace all instances of 'cat' or 'dog' with 'cats' or 'dogs' - do not duplicate existing plurals" 

   Use all files named starting with "file" in the "exercises" -> "sed" folder (but not subdirs). Here the changed text is just thrown to screen.  

   ```bash 
   sed -r "s/(cat|dog)s?/\1s/g" file*
   ```

   - (cat|dog) is the 1st (and only) saved sub-expression in the regexp, and \1 in the format string substitutes this into the output. 
   - You can see in the output that i.e. "dogs" did not get turned into "dogss"
   - However, it did not catch things were for instance "cat" is in the middle of a word, like "located" which did get changed to "locatsed" 
   - This could be fixed with ``sed -r "s/(' cat '|dog)s?/\1s/g" file*`` 

## Other common commands 
https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/
https://en.wikipedia.org/wiki/Sed


## Filtering

## In-place editing

