---
tags:
  - session
  - lesson
  - awk
  - gawk
---

# `awk`

!!! info "Learning outcomes"

    - Learners can use `awk`
    - Learners have practiced using a book on `awk`
    - Learners can use `awk` in pipes
    - Learners can use `awk` to read a specific column
    - Learners can use `awk` to transform text
    - Learners can use regular expressions in `awk`
    - Learners have practiced reading bash commands

## Why is `awk` important?

AWK is a programming language for text processing
that is included with Linux.

As a Turing-complete programming language,
it can -by definition- solve any computational problem.

!!! note "The different spellings"

    Spelling|Description
    --------|------------------------
    AWK     |The programming language
    `awk`   |The program
    Awk     |A common misspelling

## Exercises

In these exercises, we'll be using the
[Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/),
because this free online book fits this course well
and allows you to continue studying after this course.

### Exercise 1: printing selected fields

Read the text at
[chapter 6.2.1: 'Printing selected fields'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_01).

The single line of code in this subsection uses a pipe.
Run the command until the pipe. What
do you see? How do you explain in English what this does?

??? tip "Answer"

    This is the full command shows in this subsection:

    ```bash
    ls -l | awk '{ print $5 $9 }'
    ```

    The command before the pipe is:

    ```bash
    ls -l
    ```

    When running it, you will see something similar to:

    ```bash
    $ ls -l
    total 4
    drwxrwxr-x   2 richel richel 4096 Jun 10  2024 bin
    drwxr-xr-x   2 richel richel 4096 Jan  8 20:05 Desktop
    drwxr-xr-x  10 richel richel 4096 Feb 27 09:44 Documents
    drwxr-xr-x   3 richel richel 4096 May 28 08:51 Downloads
    ```

    Searching the manual of `ls`, using `man ls`, gives us the
    following description of the `-l` flag:

    ```bash
    -l     use a long listing format
    ```

    Hence, `ls -l` lists files in the current folder
    using a long listing format.

---

The single line of code in this subsection
forwards its output (from `ls`) to `awk`.
Run it. What do you see?
How do you explain in English what this does?

??? tip "Answer"

    The command to run is:

    ```bash
    ls -l | awk '{ print $5 $9 }'
    ```

    When running it, you will see something similar to:

    ```bash
    $ ls -l | awk '{ print $5 $9 }'

    4096bin
    4096Desktop
    4096Documents
    4096Downloads
    ```

    In English: from a list of files (in long format),
    show the 5th and 9th columns.

---

The command shows the 5th and 9th columns of a list of files (in long format).
How does `awk` deal with lines that do not have a 5th and/or 9th column?

??? tip "Answer"

    When running the command, we have already seen the empty first line
    of output:

    ```bash
    $ ls -l | awk '{ print $5 $9 }'

    4096bin
    4096Desktop
    4096Documents
    4096Downloads
    ```

    Hence, if there is no 5th and/or 9th column to display,
    `awk` shows an empty line

---

**Optional**: try to use `cut` (and only `cut`!)
to achieve the same, by selecting the
same columns. This will not work! Observe and explain what you see.

??? tip "Answer"

    To get the most similar output, we need to use columns 6 and 10:

    ```bash
    $ ls -l | cut --delimiter " " --fields 6,10

    richel
    richel 8
    4096 Documents
    ```

    This is not because we actually wanted to use columns 6 and 10:
    Due to the multiple and varying amount of spaces in each line,
    the counting is off.

    If you know the `tr` command, you can remove duplicate spaces:

    ```bash
    $ ls -l | tr --squeeze-repeats " " | cut --delimiter " " --fields 5,9

    4096 bin
    4096 Desktop
    4096 Documents
    4096 Downloads
    ```

    The output does put a space between the columns, we can remove that too:

    <!-- markdownlint-disable MD013 --><!-- A one-line of code cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    $ ls -l | tr --squeeze-repeats " " | cut --delimiter " " --fields 5,9 | tr --delete " "

    4096bin
    4096Desktop
    4096Documents
    4096Downloads
    ```

    <!-- markdownlint-enable MD013 -->

---

### Exercise 2: printing selected fields

- Read the text at
  [chapter 6.2.2: 'Formatting fields'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_02)

- The first code example in this subsection uses multiple pipes.
  Run the command until the first pipe. What
  do you see? How do you explain in English what this does?
  Use the `ls` manual.

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    ls -ldh * | grep -v total | awk '{ print "Size is " $5 " bytes for " $9 }
    ```

    The command until the first pipe is:

    ```bash
    ls -ldh *
    ```

    Running it shows something similar to this:

    ```bash
    $ ls -ldh *
    drwxrwxr-x   2 richel richel 4.0K Jun 10  2024 bin
    drwxr-xr-x   2 richel richel 4.0K Jan  8 20:05 Desktop
    drwxr-xr-x  10 richel richel 4.0K Feb 27 09:44 Documents
    drwxr-xr-x   3 richel richel 4.0K May 28 08:51 Downloads
    ```

    Using the manual of `ls`:

    ```bash
    man ls
    ```

    In English: the command shows the list of files and directories (`ls`) ...

    - in a long format (`-l`)
    - with directories as themselves
      (`-d`, also `--directory`, i.e. not their contents)
    - in a human-readable format (`-h`, also `--human-readable`).

---

- The first code example in this subsection uses multiple pipes.
  Run the command until the second pipe. What
  do you see? How do you explain in English what this does?

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    ls -ldh * | grep -v total | awk '{ print "Size is " $5 " bytes for " $9 }
    ```

    The command until the second pipe is:

    ```bash
    ls -ldh * | grep -v total
    ```

    Running it shows something similar to this:

    ```bash
    $ ls -ldh * | grep -v total
    drwxrwxr-x   2 richel richel 4.0K Jun 10  2024 bin
    drwxr-xr-x   2 richel richel 4.0K Jan  8 20:05 Desktop
    drwxr-xr-x  10 richel richel 4.0K Feb 27 09:44 Documents
    drwxr-xr-x   3 richel richel 4.0K May 28 08:51 Downloads
    ```

    Note that, for the computer used, there is no difference.

    In English: the command shows the list of files
    for lines that have no match (`-v`, also `--invert-match`)
    to the regular expression `total`. 

    Or shorter: it shows the content, excluding a possible
    final line that shows the total file size. 
    
---

The first code example in this subsection uses multiple pipes.
Run the command in full. What do you see?

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    ls -ldh * | grep -v total | awk '{ print "Size is " $5 " bytes for " $9 }'
    ```

    Running it shows something similar to this:

    ```bash
    $ ls -ldh * | grep -v total | awk '{ print "Size is " $5 " bytes for " $9 }'
    Size is 4.0K bytes for bin
    Size is 4.0K bytes for Desktop
    Size is 4.0K bytes for Documents
    Size is 4.0K bytes for Downloads
    ```
    
---

A first thing to notice is that the `awk` command is put
into a single quote `'` (instead of a double-quote, `"`).
Why is that?

??? tip "Answer"

    Text between single quote is used as-is:

    ```bash
    $ echo 'He said: "Hi!".'
    He said: "Hi!".
    ```

    Where the other way around, the `!` triggers
    something:

    ```bash
    $ echo "He said: 'Hi!'."
    bash: !'.: event not found
    ```
    
---

**Optional**:
Zooming in on the printing of `awk`,
i.e. the part `print "Size is " $5 " bytes for " $9`,
we can see that the elements to be printed are
seperated by a space.
This is unlike most (?all) modern languages, where
elements are seperated by a comma. Rewrite the expression
to use a comma between the elements.

??? tip "Answer"

    The first attempt would be:

    ```bash
    ls -ldh * | grep -v total | awk '{ print "Size is ", $5, " bytes for ", $9 }'
    ```

    This, however, gives double spaces now:

    <!-- markdownlint-disable MD013 --><!-- A bash one-liner cannot be split up over lines, hence will break 80 characters per line -->


    ```bash
    $ ls -ldh * | grep -v total | awk '{ print "Size is ", $5, " bytes for ", $9 }'
    Size is  4.0K  bytes for  bin
    Size is  4.0K  bytes for  Desktop
    Size is  4.0K  bytes for  Documents
    Size is  4.0K  bytes for  Downloads
    ```

    <!-- markdownlint-enable MD013 -->

    Removing the spaces between the double-quotes (`"`) solves this:

    ```bash
    ls -ldh * | grep -v total | awk '{ print "Size is", $5, "bytes for", $9 }'
    ```

    The output will look similar to this:

    ```bash
    $ ls -ldh * | grep -v total | awk '{ print "Size is", $5, "bytes for", $9 }'
    Size is 4.0K bytes for bin
    Size is 4.0K bytes for Desktop
    Size is 4.0K bytes for Documents
    Size is 4.0K bytes for Downloads
    ```

---

### Exercise 3: regular expressions

- Read the text at
  [chapter 6.2.3: 'The print command and regular expressions'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_03)

- ...

??? tip "Answer"

    ...


---

## (optional) Exercise 4: can `awk` do ...?

Here we'll experience the flexibility of `awk`.
Pick those topics you are interested in.

---

### (optional) Exercise 4.1: Can `grep` do X?

Can `awk` do X?

---


<!-- markdownlint-disable --><!-- Not checked for markdown style for now -->

This is a very powerful command which finds patterns in a file and can perform arithmetic/string operations. You can use it to transform data files and produce formatted reports.

It allows the user to use variables, numeric functions, string functions, and logical operators.

Things ``awk`` can do:

- Scan a file line by line
- Split each input line into fields
- Compare input line/fields to pattern
- Perform action(s) on matched lines

!!! note

    - In fact, ``awk`` is a scripting language which can do a set of actions on streams of textual data.
    - You can either run it directly on a file or use it as part of a pipeline (with the operator "pipe").
    - You can extract or transform text, and for instance produce formatted reports.
    - Like ``sed`` and ``grep``, it is a filter, and it is a standard feature of most Unix-like operating systems.
    - In short: it searches one (or more) files to find if they contain line(s) that match the pattern given and then it performs the action required.

Awk is abbreviated from the names of the developers - Aho, Weinberger, and Kernighan.

## Syntax

``awk options 'selection-criteria {action }' input-file > output-file``

Important options:

- **-F** - Sets a custom field separator
- **-f** - Reads ``awk`` program from a file
- **'{}'** - Encloses action to take on match

### Built-in variables

``awk`` has built-in variables, which includes the field variables:

- **$1**
- **$2**
- **$3**
- etc.

The field variable **$0** is the entire line.

These field variables break a line of text into individual words or pieces called *fields*.

Aside from the field-variables, ``awk`` also has other built-in variables:

- **NR**: keeps a current count of the number of input records (usually lines). Awk command performs the pattern/action statements once for each record in a file.
- **NF**: keeps a count of the number of fields within the current input record.
- **FS**: contains the field separator character used to divide fields on the input line. Default is "white space" (space or tab). **FS** can be reassigned to another character (typically in BEGIN) to change the field separator.
- **RS**: stores the current record separator character. Since, by default, an input line is the input record, the default record separator character is a newline.
- **OFS**: stores the output field separator, which separates the fields when ``awk`` prints them. Default is a blank space. Whenever print has several parameters separated with commas, it will print the value of OFS in between each parameter.
- **ORS**: stores the output record separator, which separates the output lines when ``awk`` prints them. The default is a newline character. Print automatically outputs the contents of **ORS** at the end of whatever it is given to print.

## Examples

!!! hint

    Code along!

    Good files for this exercise can be found in the "exercises" -> "awk-qol" directory.

!!! note "Search lines for a keyword"

    ```bash
    $ awk '/carnivore/ {print}' file.dat
    ```

!!! note "Print only specific columns"

    ```bash
    $ awk '{print $1,$4}' file.dat
    ```

!!! note "Search for the pattern ‘snow’ in the file 'myfile.txt' and print out the first column"

    ```bash
    $ awk '/snow/ {print$1}' myfile.txt
    ```

!!! note "Print column 3 and 4 from file file.dat"

    ```bash
    $ awk '{print $3 "\t" $4}' file.dat
    ```

!!! note "Print column 2 and 3 from file 'file.dat', but only those rows that contain the letter ‘r’"

    ```bash
    $ awk '/r/ {print $2 "\t" $3}' file.dat
    ```

!!! note "Display line number"

    ```bash
    $ awk '{print NR,$0}' file.dat
    ```

!!! note "Display first and last field, using NF"

    ```bash
    $ awk '{print $1,$NF}' file.dat
    ```

!!! note "Display line from 2 to 5"

    ```bash
    $ awk 'NR==3, NR==6 {print NR,$0}' file.dat
    ```

!!! note "Print the first field and the row number(NR) separated with ' - '"

    ```bash
    $ awk '{print NR " - " $1 }' file.dat
    ```

!!! note "Print third column/field"

    ```bash
    $ awk '{print $3}' file.dat
    ```

!!! note "Print any empty line if such exists"

    ```bash
    $ awk 'NF == 0 {print NR}' file.dat
    ```

!!! note "Finding the length of the longest line"

    ```bash
    $ awk '{ if (length($0) > max) max = length($0) } END { print max }' file.dat
    ```

!!! note "Count the lines in file.dat"

    ```bash
    $ awk 'END { print NR }' file.dat
    ```

!!! note "Print all lines that has more than 20 characters"

    ```bash
    $ awk 'length($0) > 20' file.dat
    ```

!!! note "Check for a specific string in any specific column"

    ```bash
    $ awk '{ if($3 == "fur") print $0;}' file.dat
    ```

Some parts of this section was copied from <a href="https://www.geeksforgeeks.org/awk-command-unixlinux-examples/" target="_blank">https://www.geeksforgeeks.org/awk-command-unixlinux-examples/</a>.

## Exercise

Work with the files in the "exercises" - "awk-qol" directory.

1. Search "myfile.txt" for the keyword "text".
2. Print column 2 only, from "file.dat"
3. Display line numbers on "myfile.txt"
4. Count the lines in "myfile.txt"
5. Check for the string "carnivore" in column 1 of "file.dat"
6. Check for the string "carnivore" in column 2 of "file.dat"

<!-- markdownlint-enable -->

---

!!! info "Conclusions"

    - `awk` can be used pipes: `ls -l | awk '{ print $5 $9 }'`
    - `awk` can be used to read a specific column:
      `ls -l | awk '{ print $5 $9 }'`
    - `awk` can be used to transform text:
      `ls -ldh * | grep -v total | awk '{ print "Size is " $5 " bytes for " $9 }'`
    - `awk` can use regular expressions:
      `df -h | awk '/dev\/hd/ { print $6 "\t: " $5 }'`
    - `awk` can do a lot more

---

!!! info Learning AWK

    <!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

    Learning resource                                                              |Description
    -------------------------------------------------------------------------------|-----------------------------
    [A practical guide to learning awk](https://opensource.com/downloads/awk-ebook)|Book about AWK
    [Gawk: Effective AWK Programming](https://www.gnu.org/software/gawk/manual/)   |Book about AWK
    [Bash Beginners Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/)        |Book with a chapter about AWK
    [Advanced Bash Scripting Guide](https://tldp.org/LDP/abs/html/)                |Book with a chapter about AWK
    [To AWK or not](https://pmitev.github.io/to-awk-or-not/)                       |Course about AWK
    [AWK course](https://richelbilderbeek.github.io/awk_course/)                   |Course about AWK

    <!-- markdownlint-enable MD013 -->
