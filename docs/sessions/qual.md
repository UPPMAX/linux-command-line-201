# Quality of Life

This chapter is a little different to the others. It is not about a tool or an operator, but about some things that can help you make it nicer to use Linux/Bash on the command line. 

## What's in here 

- We will talk about background processes, learning how to start them with ``&`` and terminate them 
- We will look at some useful terminal shortcuts and their usage
- We will learn how to edit a ".bashrc" file 
- We will learn about using aliases 
- Also a few other small odds and ends 

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


- We will learn about using aliases
- Also a few other small odds and ends

 


