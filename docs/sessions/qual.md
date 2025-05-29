# Quality of Life

This chapter is a little different to the others. It is not about a tool or an operator, but about some things that can help you make it nicer to use Linux/Bash on the command line. 

## What's in here 

- We will talk about background processes, learning how to start them with ``&`` and terminate them 
- We will look at some useful terminal shortcuts and their usage
- We will learn how to edit a ".bashrc" file 
- We will learn about using aliases 

## Background processes 

Usually, if you start some program (perhaps with an input), it will start processing it and then give the output, perhaps to screen. In many cases the terminal will then be unable to accept new commands while the processes is running. On the other hand, Linux can do multi-tasking, so how do you get to a situation where you can start another application from your terminal? 

The answer to this is foreground and background processes. 

Normally, the process you start in a terminal runs in the *foreground* and you cannot do anything else in the terminal until it completes. 

With the bash feature of *job control* you can move processes to the background and also back to the foreground. It is also possible to start a job directly in the background. 

### Start a background job/process 

This is done by adding an ``&`` at the end of the command, like this: 

```bash
$ <command> <options> <input> ... & 
```

**Example**: 
```bash 
$ tar -zcvf mydir.tar.gz LOTS-FILE-DIR/ & 
```

The job keeps running in the background. 

### Suspend a foreground job 
 
You can normally suspend a foreground job with the command ``CTRL-Z``. When you do that the shell tells you the job is suspended and it also gives the job a job ID. 

No processing happens on the job while it is suspended. 

### Move a foreground job to the background 

Assume you have started a program/job, like normal, in the foreground and you want to move it to the background. The steps to do that are: 

- Suspend the job with ``CTRL-Z`` to release the terminal 
- Give the command ``bg`` to put the suspended job to the background 
- It will then start running again, but now in the background 
- You can check that it is running with the command ``jobs`` 

**Example**: 
```bash 
bbrydsoe@enterprise:~$ tar -zcvf Downloads.tar.gz Downloads/
Downloads/
Downloads/IMG_20250509_211952.jpg
Downloads/add2(1).m
Downloads/lstopo_lspci(1).txt
Downloads/teamviewer_15.44.5_amd64.deb
^Z
[1]+  Stopped                 tar -zcvf Downloads.tar.gz Downloads/
bbrydsoe@enterprise:~$ bg
[1]+ tar -zcvf Downloads.tar.gz Downloads/ &
bbrydsoe@enterprise:~$ jobs
[1]+  Running                 tar -zcvf Downloads.tar.gz Downloads/ &
```

### Move a background job to the foreground 

To get the job running in the background back to the foreground you can give the command ``fg %JOBID``

**Example for above job**:
```bash
$ fg %1
```

If you do not give a JOBID, then ``fg`` will assume the current suspended job. 

### Restart a suspended job 

You can restart a suspended job in either:

the background:
```bash
bg %JOBID
```

or foreground: 

```bash
fg %JOBID
```

Remember, you can get the JOBID with the command ``jobs``. 

### Terminating a job 

You can terminate a foreground job with ``CTRL-C`` or a background job by sending it to the foreground and then do ``CTRL-C``. 

There are other ways of killing a job, with the command ``kill`` and the process ID (PID), but we will not cover that here other than saying that you can get process IDs from ``ps -efH | grep <suitable string>`` and then ``kill PID`` or ``kill -9 PID`` if nothing else works. 

## Useful terminal shortcuts and their usage

- **TAB**: autocomplete a file/directory or command
- **CTRL-C**: kill the current foreground process
- **CTRL-Z**: suspend the current foreground process 
- **CTRL-A**: move the cursor to the beginning of the line
- **CTRL-E**: move the cursor to the end of the line 
- **CTRL-L**: clear the screen (same as typing ``clear``) 
- **CTRL-K**: delete the line after the cursor
- **CTRL-Y**: paste the most recent thing cut or copied 
- **CTRL-D**: delete a character at the cursor's position 
- **CTRL-U**: delete the whole line 
- **CTRL-W**: delete the word before the cursor 
- **CTRL-P**: go to the previous command in your command history (same as "arrow up", you can see the saved history with ``history``)
- **CTRL-N**: go to the next command in your command history (same as "arrow down") 
- **CTRL-R**: search for a command in your command history 

## How to edit a ".bashrc" file 

The file ".bashrc" is in your home directory ($HOME) and is a script file that is executed on login. It contains some configurations for the terminal session and can be used to modify how i.e. shell history, aliases, paths, and other things are configured. 

First and foremost; ".bashrc" is a "hidden" file. To see those, add the flag/option ``-a`` to ls. 

```bash
$ ls -a 
``` 

If you just want to see what is in it, you can use cat: 

```bash
$ cat $HOME/.bashrc 
``` 

To edit it, use your favourite (command-line) editor. Here ``vi``/``vim`` or ``nano`` are common. 

```bash
$ nano $HOME/.bashrc
```

!!! warning 

    - If you are editing your ".bashrc" file at one of the HPC centres in Sweden, it is usually a bad idea to add any ``module load <software`` to the ".bashrc". A few months on you may have forgotten about it and now you want to use another module which does not load correctly or the program does not run as expected because you have already loaded another version in your ".bashrc". 
    - In general, it is a good idea to make a backup of your ".bashrc" file if you are doing something that might break things. Do ``cp $HOME/.bashrc $HOME/.bashrc.bak`` or similar first. Otherwise, there are usually "skeleton versions" of these files in ``/etc/skel/``. 

### Useful suggestions 

So what should you put in the ".bashrc"? It depends on your work style of course, and what you are working with, but these are some suggestions: 

- Aliases (see next part, very soon)
- Environment variables, Python environments
- PATHs and library paths to own-installed software 
- Customization of the terminal
- Anything you need persistent between sessions 

!!! warning "Important"

    Any changes you make to ".bashrc" will not be active until you have done one of: 

    - logged out and in again
    - ``source .bashrc``
    - ``. .bashrc``

#### Examples 

!!! note "Setting the path in .bashrc" 

    Assuming you have installed some software and now need to set the path to libraries and binaries. 
 
    In this example the new software is installed in /opt/SOFTWARE/ and we add the new path to the old, which included OTHERSOFTWARE installed in your homedirectory (for user username): 

    ```bash
    export PATH=$PATH:/home/username/OTHERSOFTWARE/bin:opt/SOFTWARE/bin
    ```

    We sometimes also need to set the path to the softwares libraries: 

    ```bash
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/username/OTHERSOFTWARE/lib:/opt/SOFTWARE/lib 
    ``` 

!!! note "Customizing the terminal" 

    These includes a comment before that says what they do. Always good to put! 

    ```bash 
    # Change number of commands stored in memory during running to 1000 (those you can access with arrow-up or CTRL-P)
    HISTSIZE=1000

    # Change number of commands stored on disk to 2000 (you can see them with "history")
    HISTFILESIZE=2000

    # Append to the history file, don't overwrite it**
    shopt -s histappend

    # make less more friendly for non-text input files**
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)**
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
    esac

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

    # enable color support of ls 
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    # colored GCC warnings and errors - uncomment to use 
    #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
    ``` 
  
## Aliases

An alias for a command means that there are two commands for the same action. The reason to make an alias is usually to get something that is shorter and/or easier to remember. 

Aliases can be persistent or non-persistent. 

### Non-persistent aliases

These are aliases you just need for a short time, during that specific session. They will go away next time you logout and login, and they will not be available in another shell. 

They are easy to create: 

```bash
$ alias ALIASNAME="command" 
```

!!! note "Example" 
 
    **Making it easier to list all files with info, including hidden files**
    ```bash
    alias lah="ls -lah"   
    ```

    It looks like this: 
    bbrydsoe@enterprise:~/exercises/awk-qol$ lah
    Command 'lah' not found, did you mean:
      command 'lha' from deb jlha-utils (0.1.6-4.1)
      command 'lha' from deb lhasa (0.3.1-4)
      command 'lsh' from deb lsh-client (2.1-13)
    Try: sudo apt install <deb name>
    bbrydsoe@enterprise:~/exercises/awk-qol$ alias lah="ls -lah"
    bbrydsoe@enterprise:~/exercises/awk-qol$ lah
    total 16K
    drwxrwxr-x 2 bbrydsoe bbrydsoe 4,0K maj 26 16:15 .
    drwxr-xr-x 8 bbrydsoe bbrydsoe 4,0K maj 26 19:41 ..
    -rw-rw-r-- 1 bbrydsoe bbrydsoe  182 maj 26 15:43 file.dat
    -rw-rw-r-- 1 bbrydsoe bbrydsoe  224 maj 26 15:45 myfile.txt
    ```

### Persistent aliases 

So what do you do if you want to keep the aliases more permanently, and can use them from session to session? 

- Add them to ".bashrc"
- Possibly add them to a file you create, ".bash_aliases" and then let ".bashrc" load ".bash_aliases"
  ```if [ -f ~/.bash_aliases ]; then
         . ~/.bash_aliases
     fi
  ```

Here we are just going to add them to ".bashrc". 

!!! note "Examples"

    1. Open "$HOME/.bashrc" with ``nano`` or ``vi``/``vim`` or similar. 
    2. If you already have some aliases there, just add new ones after, otherwise scroll to the bottom and make a comment ``# Aliases`` then add your aliases after. 
    3. Common aliases are: 
    ```bash
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias .4='cd ../../../../'
    alias .5='cd ../../../../..'
    alias la='ls -a'
    alias sl="ls"
    alias l="ls"
    alias s="ls"
    alias rm='rm -i' #-i prompts user before deletion
    alias cp='cp -i' #-i prompts user before overwriting
    # If you have some environments you often use  
    alias env1="source ~/project1/env/bin/activate"
    ```

## Exercises 

1. Start a job in the background with ``&`` 
2. Start a job that takes some time to run. Suspend it. Send it to the background. Look that it runs. Return it to the foreground. 
    - Suggestion: Make a tarball of a directory with many files in. 
    - If you do not have a suitable directory, you can instead run the script ``slowcommand.sh`` in "exercises" -> "awk-qol" (make sure it is executable, ``chmod +x slowcommand.sh``)  
3. Try out several of the terminal shortcuts
4. Create a couple aliases (non-persistent) and try them out
5. Add some nice aliases to your ".bashrc", ``source`` the ".bashrc" and try the aliases! 

## Summary 

!!! note "Keypoints"

    - we learned about foreground and background processes
    - we tried some terminal short-cuts
    - we learned about ``alias``
    - we learned about ".bashrc" 

