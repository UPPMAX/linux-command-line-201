# Pipe 

!!! note "Learning objectives" 

    - learn about the operator pipe 
        - when to use it
        - how to use it
    - try some examples with pipe  

!!! note 

    The operator ``pipe`` is used to chain commands; i.e. pipes are used when you want to take the output of one command and use it as input for another command. It is symbolized by a ``|`` between the commands. 

    This is often called “to pass output to another command”.

In many cases it is possible to do the same with an intermediate file (or more), but it is often better to just combine the commands with one or more pipes.

Pipes are very useful, and will be used in several of the following sections! 

Using a pipe between two commands look like this:

```bash
<command> | <command>
```

We will use a number of Linux commands in this section for illustrating how pipes work. They were all covered in the Basic Linux course and are listed in prerequisites, but here is a brief reminder of their function: 

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
- **head**: prints the first lines of a file. Usage: ``head -n FILE``
- **tail**: prints the lines at the end of a file. Usage: ``tail -n FILE``

