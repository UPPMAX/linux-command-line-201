# Archiving

This section will cover compressing/decompressing files and directories. We will focus on (g)zip and tar. 

!!! note "Objectives" 

    **Questions**

    How do I compress and decompress files and directories under Linux?
    How do I create an archive (tarball)?

    **Learning objectives**

    Learn about compressing and decompressing files and directories with gzip
    Learn about archiving (creating a tarball) with tar

## Compressing and decompressing - (g)zip 

Compressing files on Linux are generally done with utilities like <a href="http://www.gnu.org/software/gzip/gzip.html" target="_blank">gzip</a>, <a href="http://www.bzip.org/" target="_blank">bzip2</a>, or <a href="http://en.wikipedia.org/wiki/ZIP_%28file_format%29" target="_blank">zip</a>. 

### gzip

Compression utility designed as a replacement for compress, with much better compression and no patented algorithms. The standard compression system for all GNU software.

**Common options**: 

- **-d**: Decompress the file(s) instead of compressing them. Shortcut is ``gunzip`` 
- **-r**: Recursively compress/decompress directories and their contents.
- **-k**: Keep the original file(s) after compression.
- **-v**: Display verbose output, showing the compression ratio and other details.



## Archiving - tar 
