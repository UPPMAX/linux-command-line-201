# Symbolic links 

Symbolic links are also called soft links, or just symlinks. It is a pointer to another file or directory (called the "target").

- It is useful both for ease
    - you avoid using a long path each time you change to a directory, like your project directory
- As well as to avoid changing hard links within other scripts or programs. 
    - This is good if you for instance install a program or use a script that assumes the library it uses is called ``libcoolness.a`` and not ``libcoolness.2.0.a``. You can then just update the symlink instead of renaming the library or updating potentially many instances where it is mentioned in the program.

!!! note "Hard links and soft links" 

    You may have heard symbolic links referred to as "soft links". So what is a hard link? 

    Hard links are also shortcuts for files (not directories), but a hard link cannot be created for a file in a different file system. 

## Syntax 

Soft link/symbolic link:

```bash
ln -s real-file-folder-or-lib link-name
```

Hard link:

```bash
ln source-file linked-file
```

## Verify 

To verify a soft or hard link, run: 

```bash
ls -l source link
```

## Examples 

!!! hint

    You can type along to most of this! Use the files in "exercises" -> "redirects-env-links" for examples. 

### Hard links 

!!! hint

    You can code along!

    Either use one of the files/directories in "exercises" -> "redirect-env-link" or create a file to play with. This should work: 

    ``echo 'This is my test file' > testfile``

!!! note "Create a hard link, files"

    ```bash
    ln testfile linkfile
    ```

    To check what happened, do this: 
    ```bash
    ls -li testfile linkfile
    ```

    My output: 
    ```bash
    $ ls -li
    total 8
    808864781 -rw-r--r-- 2 bbrydsoe folk 21 May 27 16:36 linkfile
    808864781 -rw-r--r-- 2 bbrydsoe folk 21 May 27 16:36 testfile
    ``` 

    808864781 is the inode, which is identical. An inode (index node) is a concept in Linux/Unix. Each object in a filesystem is represented by an inode. It is a data structure which stores basic info about files, directories, or other file system objects. More here if you are interested: <a href="https://www.cyberciti.biz/tips/understanding-unixlinux-filesystem-inodes.html" target="_blank">Understanding UNIX / Linux filesystem Inodes</a>. 

### Soft/symbolic links 

!!! note "Create a symbolic link to a directory" 

    ```bash
    ln -s /path/to/home/exercises/redirects-env-link $HOME/exer
    ``` 

    This creates a symbolic link named “exer” in the home directory, pointing to the location /path/to/home/exercises/redirects-env-link. For me, this would look like this:

    ```bash 
    bbrydsoe@enterprise:~/exercises/redirects-env-link$ pwd
    /home/bbrydsoe/exercises/redirects-env-link
    bbrydsoe@enterprise:~/exercises/redirects-env-link$ ln -s /home/bbrydsoe/exercises/redirects-env-link $HOME/exer
    bbrydsoe@enterprise:~$ cd
    bbrydsoe@enterprise:~$ ls -l
    ...
    drwxrwxr-x  6 bbrydsoe bbrydsoe       4096 nov 13  2023  course-intro-git
    drwxr-xr-x  8 bbrydsoe bbrydsoe       4096 maj 25 14:53  Desktop
    drwxr-xr-x  6 bbrydsoe bbrydsoe       4096 jun 20  2024  Documents
    drwxr-xr-x 22 bbrydsoe bbrydsoe      20480 maj 26 15:13  Downloads
    drwxrwxr-x  2 bbrydsoe bbrydsoe       4096 maj 21 09:10  examples
    lrwxrwxrwx  1 bbrydsoe bbrydsoe         43 maj 26 19:36  exer -> /home/bbrydsoe/exercises/redirects-env-link
    drwxr-xr-x  8 bbrydsoe bbrydsoe       4096 maj 26 15:43  exercises
    -rw-rw-r--  1 bbrydsoe bbrydsoe     296399 jan 16 23:33  exercises.tar.gz
    drwxrwxr-x 31 bbrydsoe bbrydsoe       4096 maj 23 10:54  hpc2n
    drwxrwxr-x  5 bbrydsoe bbrydsoe       4096 apr  5 12:56  HPC2Ndocs
    -rw-rw-r--  1 bbrydsoe bbrydsoe         85 okt 23  2023  hpc2n-faktura.txt
    ...
    ```


!!! note "Create a symbolic link to a file in the same directory as the file" 

    ```bash 
    ln -s /path/to/file/the-file /path/to/file/<new-name> 
    ```

!!! note "Create a symbolic link to a library" 

    This is to give the library the name is is presumably assumed to have in some program that uses it. Here it is in the same directory.     

    This is how it looks for me:  

    ```bash
    ln -s /home/bbrydsoe/exercises/redirects-env-link/libcoolness.2.0.a /home/bbrydsoe/exercises/redirects-env-link/libcoolness.a
    ``` 

!!! note "Create a symbolic link to a library in a different directory" 

    Sometimes a program expects a library to be in another directory than it is. An easy way of solving this is with symlinks - then you do not have to copy the library to perhaps several directories, and redo when it is updated. 

    ```bash
    ln -s /usr/lib64/libfancy.a /usr/lib/libfancy.a
    ```

!!! note "Remove a symlink" 

    You can remove a symbolic link either with 

    ```bash
    unlink <path-to-symlink>
    ```

    or 

    ```bash
    rm <path-to-symlink>
    ``` 

    The main benefit of rm over unlink is that you can remove multiple symlinks at once, like you can with files. 

    For me, it looks like this if I remove the symbolic link ``libcoolness.a`` I created above: 

    ```bash 
    bbrydsoe@enterprise:~/exercises/redirects-env-link$ rm libcoolness.a
    bbrydsoe@enterprise:~/exercises/redirects-env-link$
    ``` 

!!! warning 

    When removing a symlink to a folder, do not include the / at the end since that will make bash think the symbolic link is a folder that you cannot remove directly like this. 

## Summary 

!!! note "Keypoints" 

    - Symbolic links are pointers to another file or directory
    - there are both soft/symbolic links and hard links 
    - they are useful both for ease and to avoid renaming/copying files 
    - you can remove symbolic links with ``rm`` or ``unlink`` 





