# Reflection 2025-06-03

One learners used Dardel.
Apparently, `nano` is absent on Dardel.
I will ask NPC to add `nano` on Dardel.

- [ ] Ask NPC to install `nano` on Dardel


Q: If the variables we create are not persistent, how do they work in the context of a script? Will they be persistent if we write the variable in the script? I guess so... 

A [Richel]: you are right 😊: the variables in a script exist as long as the script runs.   

Is a hard link the same as copying? 

A [Richel]: No: it means that the same file is at two locations at the same time. For example, if you delete the file from any of the two locations, it will be gone at both locations.  

A. [Birgitte] Yes, and same if you edit one of them, then the other is also edited 

Can you explain the concept of “standard error”? I am confused with the stats concept... 

A [Richel]: any program can create different types of output. Regular output goes to ‘the standard output’ (also called stdout). In a similar fashion, programs can write their error messages to a different ‘thing’ (called a ‘stream’), called ‘standard error’ or ‘stderr’. When this stream is displayed on screen, it sometimes is colored red, to indicate the text was sent to the standard error stream. Does that help? Yes thanks   

In uppmax we got a file with the error, to know if the script worked or not, do we have the same at dardel PDC, or we have to do the “search” of the stderr as you guys just taught us? 

A [Richel]: as far as I know, this works exactly the same, where one uses $? To get the exit code of a previous command, e.g. 

 

#!/bin/bash 

./run_something.sh 

if [[ $? -ne 0 ]]; then 
  echo “ERROR happened!” 
fi 

 
Does that help you? If not, or there is another problem, you can always contact me at richel.bilderbeek@uppmax.uu.se 😊 

Why would you use tar to archive your files when you can just compress them with gzip? 

A [Richel]: both tools achieve similar results, so you can use either. It can be, however, that you want to un-compress a file on –for example- an old version of windows that does not support tar out-of-the-box. In that case, you may prefer to use gzip.  

Similar to (11): why do we first use tar and then compress rather than compress a directory directly? Tar makes it into one file? 

A [Richel]: Yes, tar can compress multiple files into one. And you are right: it can also compress a folder with files. There is little difference: if you compress a folder (with files), then tar will re-create that folder (with files). Did that answer your question? 

Sort of. I just was wondering what is the functional difference. The procedure is different (first tar to make several files into one ‘tarball’, then compress, second using zip directly just directly compresses all the files in the folder). Does it is mean that zip directly applies compression on every file individually and tar + gzip would apply compression on the tarball (so only 1 file). Is there a performance difference there? [Answer is on next page 😊 ] 

A [Richel]: I don’t know the exact technical details here. Sure, I can google 😊. Maybe creating a script and measuring directly is easier. I would bet on timings being identical. 

I will look into it, maybe experiment a bit, thanks! 

A [Richel]: Fun! 

What is “nohup” doing along with &?  

A [Richel]: nohup allows one to run something that continues after ending a terminal (‘to hang up’ was how terminals one day were ended). ‘&’ allows one to run something in the background, which means a terminal can be used for running commands wile a process is running. Together, they allow for commands that run in the background while you remain logged in to the computer.  

Could you "overwrite” existing commands (e.g. ls) with an alias? If you prefer list format e.g. ls –l, might be nice to only have alias ls=/usr/bin/ls -l. Will the bash alias be prioritized over system’s ls? 

A [Richel]: yes. I just tried it and it works! 

 

alias ls="/usr/bin/ls -l" 

 