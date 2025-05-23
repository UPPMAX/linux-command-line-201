<!-- markdownlint-disable MD013 --><!-- Let's break the 80 characters per line -->
<!-- markdownlint-disable MD009 --><!-- Let's stop checking for trailing spaces -->
# Redirects

I/O redirection: Usually, standard input comes from the keyboard etc. and the standard output goes to the screen. There is also standard error. All of these can be redirected with Linux commands. 

!!! note "Objectives" 

    - Learn about redirection
        - standard input
        - standard output
        - standard error 

When running a command which can take input, give output, or do both, redirection lets us *redirect* the input and output to any files or folders we want to. It is also possible to redirect any errors specifically, instead of together with regular output, so you get errors and other output to different files.  

As default, **standard output** and **standard error** are sent to the screen and **standard input** comes from the keyboard/mouse. 

**Example** you run a command, for instance ``ls``; it throws the output to the screen. However, if you want to save it to a file instead you could use **output redirection**. 

Redirects are particularly useful if we are working with large outputs/inputs, multiple outputs/inputs, or wish to save the output for later. 

It may also be that we want to use the output from one command as input for another command - this can be solved with **pipes** as we saw yesterday, but saving the intermittent result to file is also an option. 

There are different types of redirection: 

- overwrite redirection
- append redirection 
- merge redirection 

Let us look at them one at a time and see some examples. 

## Overwrite redirction 

Let us assume you want to save the output of a command to a file and that you do not mind that the existing content of that file is overwritten (or you create a new file). In this situation, **overwrite redirection** is useful. 

- **>**: standard output
- **<**: standard input

### Examples 

**Output of ls to file mylsoutput.txt**
```bash
$ ls > mylsoutput.txt
```

**Anything written after ">" is written to myfile.txt - end with CTRL-C**
```bash
bbrydsoe@enterprise:~$ cat > myfile.txt
This text will go to the file myfile.txt
^C
bbrydsoe@enterprise:~$
``` 

**This gives the input of "myfile.txt" to cat, which prints the content to screen**
```bash
$ cat < myfile.txt
```

**Splitting standard error and standard output - send standard error to file "error-log"**
```bash
./myprogram 2> error.log
```

**Send both standard output and standard error to file "mylog.log"** 
```bash 
./myprogram > mylog.log 2>&1
``` 

## Append redirection 


