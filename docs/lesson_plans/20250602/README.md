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
11:15-12:00 |`sed` and `awk`        |BC

I should assume the learners can use a pipe,
BC should assume they learners can `grep` things.

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

## References

- `[Shotts, 2024]` Shotts, William.
  The Linux command line: a complete introduction. No Starch Press, 2024.
  (in `books/the_linux_command_line.pdf`)
