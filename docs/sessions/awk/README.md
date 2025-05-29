---
tags:
  - session
  - lesson
  - awk
  - gawk
---

# AWK

!!! info "Learning outcomes"

    - Learners can use `awk`
    - Learners have practiced using a book on AWK
    - Learners can use `awk` in pipes
    - Learners can use `awk` to read a specific column
    - Learners can use `awk` to transform text
    - Learners can use regular expressions in `awk`
    - Learners have practiced reading bash commands

## Why is AWK important?

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

## Exercise 1: printing selected fields

Read the text at
[chapter 6.2.1: 'Printing selected fields'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_01).

### Exercise 1.1: understanding the first part

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

### Exercise 1.2: understanding the `awk` part

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

### Exercise 1.3: how `awk` deals with missing columns

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

### (optional) Exercise 1.4: `awk` versus `cut`

Try to use `cut` (and only `cut`!)
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

## Exercise 2: printing selected fields

Read the text at
[chapter 6.2.2: 'Formatting fields'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_02)

### Exercise 2.1: understanding the first part

The first code example in this subsection uses multiple pipes.
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

### Exercise 2.2: understanding the second part

The first code example in this subsection uses multiple pipes.
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

### Exercise 2.3: understanding the `awk` part

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

### Exercise 2.4: understanding the single quote

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

### (Optional) Exercise 2.5: using commas between elements to print

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

## Exercise 3: regular expressions

Read the text at
[chapter 6.2.3: 'The print command and regular expressions'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_03)

### Exercise 3.1: understanding the first part

The first code example in this subsection uses a pipe.
Run the command until the pipe. What
do you see? How do you explain in English what this does?
Use the `df` manual.

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    df -h | awk '/dev\/hd/ { print $6 "\t: " $5 }'
    ```

    The command until the pipe is:

    ```bash
    df -h
    ```

    Running it shows something similar to this:

    ```bash
    $ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    tmpfs           1.6G  2.9M  1.6G   1% /run
    /dev/nvme0n1p2  468G  226G  219G  51% /
    tmpfs           7.6G   29M  7.6G   1% /dev/shm
    tmpfs           5.0M  8.0K  5.0M   1% /run/lock
    efivarfs        438K  293K  141K  68% /sys/firmware/efi/efivars
    /dev/nvme0n1p1  511M   73M  439M  15% /boot/efi
    tmpfs           1.6G  148K  1.6G   1% /run/user/1000
    ```

    Using the manual of `df`:

    ```bash
    man df
    ```

    In English: show the file system space usage (`df`)
    in a human-readable format (`-h`, also `--human-readable`).


---

### Exercise 3.2: understanding the `awk` part

Run the command in full. What do you see?

Tip: if you see nothing, use `df -h | awk '/dev\// { print $6 "\t: " $5 }'

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    df -h | awk '/dev\/hd/ { print $6 "\t: " $5 }'
    ```

    Running it shows something similar to this:

    ```bash
    $ df -h | awk '/dev\/hd/ { print $6 "\t: " $5 }'
    ```
    
    On the computer used, this shows no output.

    Running the alternative:

    ```bash
    $ df -h | awk '/dev\// { print $6 "\t: " $5 }'
    / : 51%
    /dev/shm : 1%
    /boot/efi : 15%
    ```

    It shows the percentage of disk space in use for all the
    devices that have `dev` in the same. 

---

### Exercise 3.3: understanding the regular expression

This `awk` command uses a regular expression. What is it **exactly**?
If it is formatted 'weirdly', why is that?

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    df -h | awk '/dev\/hd/ { print $6 "\t: " $5 }'
    ```

    The exact regular expression is the exact text between the
    (unescaped) slashes:

    ```bash
    dev\/hd
    ```
    
    This is formatted 'weirdly', as it uses `\/` instead of
    just `/`. This is because `awk` uses `/` to indicate the
    start and end of a regular expression. Hence, for the same
    character to be part of that regular expression, it is escaped
    using a backslash.
    
---

### Exercise 3.4: understanding the `\t`

In the `awk` command, there is a `\t` in the printing
part. What does it do, and why is it written like that?

??? tip "Answer"

    The first code example in this subsection is:

    ```bash
    df -h | awk '/dev\/hd/ { print $6 "\t: " $5 }'
    ```

    The `\t` prints a tab.
    
    It is written like that,
    as `\t` is simply decided as the way how we write a tab,
    similar to the convention that `\n` is a newline.
    
---

## (optional) Exercise 4: can `awk` do ...?

AWK is a Turning complete language,
hence the answer to 'Can AWK do ...?'
(applied to text)
is always true.

Below are some question you may have
and how to solve this in `awk`.

Pick those topics you are interested in.

---

### (optional) Exercise 4.1: Can `awk` display all columns?

Can `awk` display all columns? Or: upon a match,
can `awk` display the whole line?

The answer is: yes!

Read the text at
[subsection 6.2.1: 'Printing selected fields](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_01).

Use a pipe to direct the output of `ls -l` to `awk`,
where the whole line is printed.

??? tip "Answer"

    The symbol `$0` is used for 'all columns'/'the whole line':

    ```bash
    ls -l | awk '{ print $0 }'
    ```

    On its own, this program is not useful: it just echoes its input.
    
    `$0` becomes useful when used with other `awk` features, such
    as matching lines for a regular expression:

    ```bash
    $ ls -l | awk '/Feb/ { print $0 }' 
    drwxr-xr-x  10 richel richel 4096 Feb 27 09:44 Documents
    drwxrwxr-x   6 richel richel 4096 Feb  7 07:18 inkcut_venv
    drwxrwxr-x   2 richel richel 4096 Feb 25 11:38 misc
    drwx------   2 richel richel 4096 Feb 25 13:45 my_folder
    ```

---

### (optional) Exercise 4.2: Can `awk` display the line number?

Can `awk` display the line number?

The answer is: yes!

To do so, print the variable `NR`, as shown in the (useless)
program below:

```bash
awk '{ print NR }'
```

Use a pipe to direct the output of `ls -l` to `awk`,
where the line number and the value in the first column are printed

??? tip "Answer"

    ```bash
    ls -l | awk '{ print NR,$1 }'
    ```

---

### (optional) Exercise 4.3: Can `awk` display the number of columns?

Can `awk` display the number of column?

The answer is: yes!

To do so, print the variable `NF`, as shown in the
program below:

```bash
awk '{ print NF }'
```

Use a pipe to direct the output of `ls -l` to `awk`,
where the number of columns are printed

??? tip "Answer"

    ```bash
    ls -l | awk '{ print NF }'
    ```

---

### (optional) Exercise 4.4: Can `awk` display the last column?

Can `awk` display the last column?

The answer is: yes!

To do so, print the variable `$NF`, as shown in the
program below:

```bash
awk '{ print $NF }'
```

Use a pipe to direct the output of `ls -l` to `awk`,
where the value in the first and last column are printed

??? tip "Answer"

    ```bash
    ls -l | awk '{ print $1,$NF }'
    ```

---

### (optional) Exercise 4.5: Can `awk` count the number of lines?


Can `awk` count the number of lines?

The answer is: yes!

Read the text at
[chapter 6.3.3: 'The number of records'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_03.html#sect_06_03_03).

Use a pipe to direct the output of `ls -l` to `awk`,
where the number of lines is printed.

??? tip "Answer"

    A good first guess, but incorrect, is to use the command
    below, which is good for numbering lines:

    ```bash
    ls -l | awk '{ print NR }'
    ```

    The last number is indeed the number of lines.

    The AWK way to solve it, is to use the `END` clause,
    which is only run at the end:

    ```bash
    ls -l | awk 'END { print NR }'
    ```

    `NR` only becomes useful when used with other `awk` features,
    such printing a descriptive text around it:

    ```bash
    ls -l | awk 'END { print "Number of lines:", NR }'
    ```

    There are many ways to print the number of lines,
    such as to combine the incorrect `awk` way with `tail`:

    ```bash
    ls -l | awk '{ print NR }' | tail -n 1
    ```

    Clumsy, but it works.

    Alternatively, `wc` is made exactly for the purpose of counting lines:

    ```bash
    ls -l | wc --lines
    ```

---

### (optional) Exercise 4.6: Can `awk` display the line number?

Can `awk` display the line number?

??? tip "Answer"

    ```bash
    $ awk '{print NR,$0}' file.dat
    ```

Similar to `cat --number`

---

### (optional) Exercise 4.7: Can `awk` work on comma-seperated files?

Read the text at
[chapter 6.2.4: 'The input field separator'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_03.html#sect_06_03_01).

Can `awk` work on comma-seperated files?

??? tip "Answer"

    ```bash
    $ awk 'BEGIN { FS="," } {print NR,$0}' file.dat
    ```

    Alternatively;

    ```bash
    $ awk --field-separator "," '{print NR,$0}' file.dat
    ```


### (optional) Exercise 4.8: Can `awk` show something once at the start?

Read the text at
[chapter 6.2.4: '6.2.4. Special patterns'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_04).

TODO

??? tip "Answer"

    ```bash
    $ awk { BEGIN { print "Counting ..."} { print NR } }' file.dat
    ```

---

### (optional) Exercise 4.9: Can `awk` show something once at the end?

Read the text at
[chapter 6.2.4: '6.2.4. Special patterns'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_02.html#sect_06_02_04).

TODO

??? tip "Answer"

    ```bash
    $ awk { { print NR } END { print "Counting ..."} }' file.dat
    ```

---

### (optional) Exercise 4.10: Can `awk` use variables?

Can `awk` use variables?

Read the text at
[chapter 6.3.4: 'User defined variables'](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_06_03.html#sect_06_03_04).

!!! note "Finding the length of the longest line"


    <!-- markdownlint-disable MD013 --><!-- A bash one-liner cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    $ awk '{ BEGIN { max = 0 } { if (length($0) > max) max = length($0) } } END { print max }' file.dat
    ```

    <!-- markdownlint-enable MD013 -->

---

??? note "For teachers"

    What is the difference between AWK and `awk`?

    What can AWK not do?

    When not to use AWK?

## Conclusions

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

## Learning AWK

!!! info "Learning AWK"

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
