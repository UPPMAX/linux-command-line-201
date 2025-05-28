# Lesson plan 2025-06-02 by Richel

- Date: 2025-06-02
- Author: Richel

## Morning 1: smarter command-line

I am in the middle of the schedule:

Time        | Topic                 |Teacher
------------|-----------------------|-------
9:00-10:00  |Linux pipe, `wc`, `cut`|BB
10:00-10:15 |Break                  |.
10:15-11:00 |`grep`                 |RB
11:00-11:15 |Break                  |.
11:15-12:00 |`awk`                  |RB

I should assume the learners can use a pipe,


## `grep`

My learning outcomes are:

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

- Learners can use `.`, `*`, `+`, `?`, `[]`, `[^]`, `{}`, `()` in regular expressions
- Learners can use `grep` for pattern matching
- [Learners have practiced using a book on bash/Linux](https://github.com/UPPMAX/naiss_intermediate_bash_linux/issues/7)

<!-- markdownlint-enable MD013 -->

Add LOs are:

- Learners have experienced that `grep` is a filter
- Learners have sent text to `grep` using a pipe, e.g. `man grep | grep "[^A-Z]`
- Learners know there are multiple flavours of regular expressions:
  use `grep` and `grep -E`

As sources of text, I consider to use:

- 'Frankenstein; Or, The Modern Prometheus',
  from [a plain text file at Project Gutenberg](https://www.gutenberg.org/cache/epub/84/pg84.txt).
- `man grep` or `yelp man:grep` or `man grep | grep "^[A-Z]"`
- [https://www.regexone.com/](https://www.regexone.com/)
- `[Shotts, 2024]`, which can be downloaded
  [here](https://sourceforge.net/projects/linuxcommand/files/AWTLCL/21.10/AWTLCL-21.10.pdf/download)
  and can be found in this repo at `books/the_linux_command_line.pdf`
- man grep | grep "^[[:upper:]]"

Using the `grep` manual and [https://www.regexone.com/](https://www.regexone.com/)
felt like the best options.

Fixing the layout is harder, e.g. getting `mermaid` to work, making the
admonitions prettier (fails).

I will give up on `mermaid`:

![Mermaid does not work](no_mermaid.png)

I think this session is ready now, but I can imagine
writing the next session may influence it,
so let's write the next session first,
before creating a video.

## `awk`

It used to be `sed` and `awk` in an earlier schedule. Commit 
`7282e58552cdbeb7bf70b0f3133ac2bee7702a33` moved `sed` to Day 2. 
I will accept: we (me and BB) are probably both working in the weekend,
so let's accept this change.

My LOs are:

- I can use `awk`
- [Learners have practiced using a book on bash/Linux](https://github.com/UPPMAX/naiss_intermediate_bash_linux/issues/7)

I've inherited the first one from BC and BB and is simple enough,
unlike the ones for `grep`, where I added some details.

I will add some LOs:

- I can use `awk` in pipes
- I can use regular expressions in `awk`
- I can use `awk` to read a specific column
- I can use `awk` to transform text

Non-LOs:

- I can use `awk` to analyse a file: the day is called 'Smart command-line'

Books to use:

- [A practical guide to learning awk](https://opensource.com/downloads/awk-ebook)
- [Effective awk programming](https://www.dbooks.org/effective-awk-programming-1882114280/)



## References

- `[Shotts, 2024]` Shotts, William.
  The Linux command line: a complete introduction. No Starch Press, 2024.
  (in `books/the_linux_command_line.pdf`)
