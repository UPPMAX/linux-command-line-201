---
tags:
  - session
  - lesson
  - scripting
  - bash
  - script
---

# Scripting

!!! info "Learning outcomes"

    - Learners can write scripts that require user input
    - Learners can use bash variables
    - Learners can use bash `if` statements
    - Learners can use bash `if` statements with the 'or' and 'and' symbols
    - Learners can use bash `for` statements
    - [Learners have practiced using a book on bash/Linux](https://github.com/UPPMAX/naiss_intermediate_bash_linux/issues/7)                       |RB


???- note "For teachers"

    Lesson plan:

    Time |Duration|Description
    -----|--------|---------
    0-10 |10      |Prior
    10-15|5       |Present
    15-35|20      |Challenge
    35-45|10      |Feedback

    Prior:

    - What is a script?
    - What is bash?
    - What does the program `touch` do?
    - What is a shebang?
    - What is a variable?
    - What is 'user input'?

## Why use scripts?

Scripts allow you to run you (bash) commands in an easy and
reproducible manner.

## Exercises

In these exercises, we'll be using the
book 'Introduction to Bash Scripting for developers',
as this book fits this course well, is free and open source
and allows you to continue studying after this course

![The book](book_cover_282_x_450.png)

### Exercise x:

- Read the text at
  [chapter 2: 'Bash structure'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/002-bash-structure.md)
- Create a file called `greeter.sh` with a shebang
  following that chapter

??? tip "Answer"

    In a terminal, type:

    ```bash
    touch greeter.sh
    ```

    Add the following line to the file:

    ```bash
    #!/bin/bash
    ```

    Remember that if this does not work on your computer, use the more
    flexible shebang:


    ```bash
    #!/usr/bin/env bash
    ```

---


### Exercise x:

- Read the text at
  [chapter 3: 'Hello world'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/003-bash-hello-world.md)
- Modify your bash script called `greeter.sh` in such a way that
  you can run ('execute') it. When it runs, it should show 'Hello World!'
  on the screen. Run the script to verify

??? tip "Answer"

    Edit `greeter.sh` to:

    ```bash
    #!/bin/bash
    echo "Hello World!"
    ```

    For the terminal, make `greeter.sh` executable with:

    ```bash
    chmod +x greeter.sh
    ```

    You can now run it with:

    ```bash
    ./greeter.sh
    ```

---

 
### Exercise x: bash variables

- Read the text at
  [chapter 4: 'Bash Variables'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/004-bash-variables.md)
- Modify your bash script called `greeter.sh` in such a way that
  it uses two variables:
  - `greeting`, which should have value `Hello`
  - `name`, which should have value `World`
  When it runs, it should (still) show 'Hello World!'
  on the screen. Run the script to verify

??? tip "Answer"

    Edit `greeter.sh` to:

    ```bash
    #!/bin/bash
    greeting="Hello"
    name="World"

    echo "$greeting $name!"
    ```

    You can now (still) run it with:

    ```bash
    ./greeter.sh
    ```

---

### Exercise x: counting files

Bash can store the output of other tools in variables.

Write a script that counts and shows the number of files in our current folder:

- Create an executable script called `count_files.sh`.
- In the script, create a variable called `n_files` and initialize it like this:

  ```bash
  n_files=$(ls | wc --lines)
  ```

- Running the script should show: 'You have [n_files] files', where
  `[n_files]` is the number of files


- Run the script to verify

??? tip "Answer"

    Edit `greeter.sh` to:

    ```bash
    #!/bin/bash
    n_files=$(ls | wc --lines)

    echo "You have ${n_files} files"
    ```

    You can now run it with:

    ```bash
    ./count_files.sh
    ```

---

### Exercise x:

- Read the text at
  [chapter 5: 'User input'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/005-bash-user-input.md)
- Modify your bash script called `greeter.sh` in such a way that
  the script asks for a name using the text 'Who to greet?'.
  If the name `World` is typed it, it should (again) show 'Hello World!'
  on the screen. Run the script to verify

??? tip "Answer"

    Edit `greeter.sh` to:

    ```bash
    #!/bin/bash

    echo "Who to greet?"
    read name

    greeting="Hello"

    echo "$greeting $name!"
    ```

    You can (still) run it with:

    ```bash
    ./greeter.sh
    ```

---

### Exercise x:

- Read the text at
  [chapter 9: 'Conditional expressions'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/009-bash-conditional-expressions.md)
- We will modify your bash script called `greeter.sh` in such a way that
  when the name 'Bond' it chosen, the program shows `It is Bond. James Bond!`,
  else it shows the regular greeting. Which conditional will you need?

??? tip "Answer"

    ```bash
    [[ ${arg1} -eq ${arg2} ]]
    ```

---

### Exercise x:

- Read the chapters 'If statement' and 'If Else statement' of
  [chapter 10: 'Conditionals'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/010-bash-conditionals.md),
  do **not read** 'Switch case statements'
- Modify your bash script called `greeter.sh` in such a way that
  when the name 'Bond' it chosen, the program shows `It is Bond. James Bond!`,
  else it shows the regular greeting. Run the script to verify

??? tip "Answer"

    Edit `greeter.sh` to the example below.
    There are multiple solutions.

    ```bash
    #!/bin/bash

    echo "Who to greet?"
    read name

    greeting="Hello"

    if [[ name -eq "Bond" ]]
    then
        echo "It is Bond. James Bond!"
    else
        echo "$greeting $name!"
    fi
    ```

    You can (still) run it with:

    ```bash
    ./greeter.sh
    ```

---


### Exercise x: For loops

- Read only the 'For loops' section of
  [chapter 11: 'Bash loops'](https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/011-bash-loops.md)
- Create a new bash script called `greet_names.sh`.
  The script should:
  - Ask who to great, with the text `Who shall I greet?`.
    The expected input are names separated by spaces, e.g. `Anna Berndt Cindy`
  - Greet all of these people in the form `Hello [name]!`,
    using a for loop to go through the names
  - Run the script to verify

??? tip "Answer"

    Edit `greet_names` to the example below.
    There are multiple solutions.

    ```bash
    #!/bin/bash

    echo "Who shall I greet?"
    read names

    for name in ${names}
    do
        echo "Hello ${name}!"
    done
    ```

    You can run it with:

    ```bash
    ./greet_names.sh
    ```

---

### Exercise x: For loops with bash commands

Instead of iterating over names,
we can iterate over something useful instead,
such as the output of a bash command.

- Create a new bash script called `show_files.sh`.
  The script should:
  - Store the output of `ls` in a variable called `filenames`
  - Per filename, show `I found a file called [filename]!`,
    where `[filename]` is the name of the file
  - Run the script to verify

??? tip "Answer"

    Edit `greeter.sh` to the example below.
    There are multiple solutions.

    ```bash
    #!/bin/bash

    filenames=$(ls)

    for filename in ${filenames}
    do
        echo "I found a file called {filename}!"
    done
    ```

    You can run it with:

    ```bash
    ./show_files.sh
    ```

---

!!! info "Conclusions"

    - `bash` can do most things one expects from a programming language

---

!!! info "Next session"

    - `bash` can do much more




