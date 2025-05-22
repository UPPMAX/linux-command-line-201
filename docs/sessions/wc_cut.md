# Linux tools I - wc and cut

!!! note "Learning objectives" 

    - learn about ``wc``
    - try some examples with ``wc``
    - learn about ``cut``
    - try some examples with ``cut``

## wc

The Linux ``wc`` command calculates a file's word, line, character, or byte count (returning the values in that order from left to right). 

### Syntax

```bash
wc <options> file
```

!!! note "Some common options" 

    - **-l**: list number of lines per file
    - **-m**: list number of characters per file
    - **-w**: list number of words per file
 
### Examples

To run the examples, go to the “exercises” -> “piping-wc-cut” directory where there are files that are suitable to run these examples on. 

!!! hint

    Type along!

!!! note "wc on a file"

    ```bash
    $ wc myfile1.txt 
    ```

    Output: 
 
    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc myfile1.txt 
     4 15 80 myfile1.txt
    ```

    ``wc`` counted the number of lines, words, and characters in the file "myfile1.txt". It says there are **4 lines**, **15 words**, and **80 characters**. 

!!! note "wc on several files"

    Let us run ``wc`` on all files with suffix .txt 

    ```bash
    $ wc *.txt
    ```

    Output: 

    ```bash 
      1   9  45 fil2.txt
      1   9  43 fil3.txt
      2  10  48 fil4.txt
      4  22 128 file.txt
      1   6  34 fil.txt
      0   0   0 myfile0.txt
      4  15  80 myfile1.txt
      2  10  48 myfile2.txt
      7  38 203 myfile3.txt
      0   0   0 myfiles.txt
      4  22 128 newfile.txt
     12  12  33 numbers.txt
      0   0   0 thisfile0.txt
      0   0   0 thisfile1.txt
      0   0   0 thisfile2.txt
      0   0   0 thisfile3.txt
      0   0   0 thisfile4.txt
      0   0   0 thisfile5.txt
      0   0   0 thisfile6.txt
      0   0   0 thisfile7.txt
      0   0   0 thisfile8.txt
      0   0   0 thisfile9.txt
      0   0   0 thisfile.txt
     38 153 790 total
    ```

    All lines, words, characters in the files with the extension .txt. Also sums up the total. 

!!! note "wc -l to get only the number of lines in a file" 

    ```bash
    $ wc -l myfile2.txt 
    ```

    Output: 

    ```bash 
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc -l myfile2.txt
    2 myfile2.txt
    ```

!!! note "wc combined with a pipe and sort to get the files with suffix .txt in a given order" 

    ```bash
    $ wc *.txt | sort -n
    ```

    Output: 

    ```bash
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc *.txt | sort -n
      0   0   0 myfile0.txt
      0   0   0 myfiles.txt
      0   0   0 thisfile0.txt
      0   0   0 thisfile1.txt
      0   0   0 thisfile2.txt
      0   0   0 thisfile3.txt
      0   0   0 thisfile4.txt
      0   0   0 thisfile5.txt
      0   0   0 thisfile6.txt
      0   0   0 thisfile7.txt
      0   0   0 thisfile8.txt
      0   0   0 thisfile9.txt
      0   0   0 thisfile.txt
      1   6  34 fil.txt
      1   9  43 fil3.txt
      1   9  45 fil2.txt
      2  10  48 fil4.txt
      2  10  48 myfile2.txt
      4  15  80 myfile1.txt
      4  22 128 file.txt
      4  22 128 newfile.txt
      7  38 203 myfile3.txt
     12  12  33 numbers.txt
     38 153 790 total
    ``` 

!!! warning "wc with no input" 

    If you just do ``wc`` without giving any files as input, it will assume it should wait for input. If you just want to escape this, you can do it with CTRL-C (Press the CTRL key and hold it down, then press the C key). 

!!! note "wc - capturing output"

    Assume you have a large number of files that you want to run ``wc`` on. Then it will not work well to just get the output thrown to screen. It would be much better to get the output to a file, and you can do that this way: 

    ```bash
    $ wc -l *.txt > filelength.txt
    ``` 

    This will take the number of lines for each file and put to the file "filelength.txt". You can then look inside that file:

    ```bash 
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ wc -l *.txt > filelength.txt
    bbrydsoe@enterprise:~/exercises/piping-wc-cut$ cat filelength.txt 
      1 fil2.txt
      1 fil3.txt
      2 fil4.txt
      4 file.txt
      1 fil.txt
      0 myfile0.txt
      4 myfile1.txt
      2 myfile2.txt
      7 myfile3.txt
      0 myfiles.txt
      4 newfile.txt
     12 numbers.txt
      0 thisfile0.txt
      0 thisfile1.txt
      0 thisfile2.txt
      0 thisfile3.txt
      0 thisfile4.txt
      0 thisfile5.txt
      0 thisfile6.txt
      0 thisfile7.txt
      0 thisfile8.txt
      0 thisfile9.txt
      0 thisfile.txt
     38 total
    ``` 

    If you have a lot if files, and so a lot of entries in the "filelength.txt", it might be better to use something like "less" to look in it so you can look through the file instead of getting it all output to screen. 

!!! note "<img src="../images/shell-logo_small.png"> Exercise"

    The “exercises” -> “piping-wc-cut” directory is where there are files that are suitable to run these examples on.

    1. Use the correct option to ``wc`` to count the number of words in "file.txt" 
    2. Use the correct option to ``wc`` to count the number of characters in "numbers.txt" 
    3. How many lines are there in total in all the files in the directory "piping-wc-cut"? 

## cut



