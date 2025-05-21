# Pipe 

!!! note "Learning objectives" 

    - learn about the operator pipe 
        - when to use it
        - how to use it
    - try some examples with pipe  

!!! note 

    The operator ``pipe`` (or pipeline) is used to chain commands; i.e. pipes are used when you want to take the output of one command and use it as input for another command. It is symbolized by a ``|`` between the commands. 

    This is often called “to pass output to another command”.

In many cases it is possible to do the same with an intermediate file (or more), but it is often better to just combine the commands with one or more pipes.

Pipes are very useful, and will be used in several of the following sections! 

## Syntax 

Using a pipe between two or more commands look like this:

```bash
<command 1> | <command 2> | <command 3> | ...  | <command N> 
```

## Some commands 

We will use a number of Linux commands in this section for illustrating how pipes work. They were all covered in the Basic Linux course and are listed in prerequisites, but here is a brief reminder of their function: 

??? note "Click to reveal" 

    - **less**: forward and backward navigation and also has search options. Usage ``less FILE``. Exit with: ``q``
    - **more**: forward navigation and limited backward navigation in a file named FILE. Usage: ``more FILE``. Exit with: ``q`` 
    - **cat**: a tool for file-related operations (view, concatenate, create, copy, merge, and manipulate file contents). Usage: ``cat [option] FILE`` where option is various optional options
    - **find**: The find command is used for file and directory search. You can search by name, size, modification time, or content. Usage: ``find [path] [options] [expression]`` where common options are 
        - **-type f**: only search for files
        - **-type d**: only search for directories
        - **-name NAME**: only search for files with a specific name NAME or pattern
        - **-size [+/-]n**: Searches for files based on size. +n finds larger files, -n finds smaller files. ‘n‘ measures size in characters.
        - **-mtime n**: Finds files based on modification time. n represents the number of days ago.
        - **-exec command {} \;**: Executes a command on each file found.
    - **sort**: The sort command is used in Linux to print the output of a file in given order.
        - **-n**: compare according to string numerical value
        - **-f**: ignore case
        - **-b**: ignore leading blanks
        - **-k keydef**: by size where keydef is start and stop position 
    - **head**: prints the first lines of a file. Usage: ``head -n FILE``
    - **tail**: prints the lines at the end of a file. Usage: ``tail -n FILE``
    - **echo**: displays lines of text or strings that are passed as arguments. Usage: ``echo [option] [string]`` 

## Examples of piping 

!!! hit 

    "Type along! 

To run the examples, go to the "exercises" -> "piping-wc-cut" directory where there are files that are suitable to run these examples on. 

!!! note "List all files and directories and give as input to `more`" 

    This is useful if there are many files in the directory and you would like to see them/scroll through them. 

    ```bash
    $ ls -l | more 
    ```

    Output: 

    ![ls-more](../images/ls-more.png)


### Sort a list of files by size 

```bash
$ ls -l | sort -k 5
```

### 

find  $HOME/exercises/script/image -type f -name "*.png" -exec cp {} myimages \;   
find myimages -type f -name "*er*"



### Use head and tail to print lines in a particular range in a file.  

$ cat sample2.txt | head -7 | tail -5

### Use ls and find to list and print all lines matching a particular pattern in matching files. 

$ ls -l | find ./ -type f -name "*.txt" -exec grep "program" {} \;

### Use cat, grep, tee and wc command to read the particular entry from user and store in a file and print line count. 

$ cat result.txt | grep "Rajat Dua" | tee file2.txt | wc -l

### cat contents.txt |wc -l

### ls | head -3 | tail -1

### ls | head -3 | tail -1 > myoutput

### ls -l /etc | tail -n +2 | sort

### command 2>&1 | less

### echo yes | command > output.txt

### If ‘|&’ is used, command1’s standard error, in addition to its standard output, is connected to command2’s standard input through the pipe; it is shorthand for 2>&1 | 

###    Find all files with extension .txt in the directory you are standing in and below:

find . -type f -name "*.txt"

2. Find all files with file as part of the name in the directory expressions/patterns while standing in exercises/script

find ../patterns/ -type f -name "*file*"

