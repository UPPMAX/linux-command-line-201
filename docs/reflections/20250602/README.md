# Reflection 2025-06-02

- [Lesson plan](../../lesson_plans/20250602/README.md)
- [Evaluation](../../evaluations/20250602/README.md)
- [Reflection](../../reflections/20250602/README.md)

## First hour

The first hour I was a teacher in the back, helping out
with the Zoom chat and the shared document.

I was able to make an activity diagram:

Time|Activity
----|-------------------------------
0   |Lecture: Introduction
7   |Lecture: Pipe
11  |Start code-along
27  |Start exercise, 1x interruption
31  |Lecture: `wc`
42  |Start exercise, 0x interruption
45  |Answer question
47  |Lecture: `cut`
60  |Start exercise, 3x interruption
65  |End

### Discussion from shared document, during the first hour

- Q: The `sort` command doesn’t behave quite the same for me as in the example,
  could this be because I’m using a Mac? (see answer below :-) )
    - A: [Richel] Yes: different unix-like systems have slightly different
      tools, with slightly different behavior. We’ll all have to live with
      that :-). In the end, running ‘man sort’ to find how your `sort` works
      exactly is the only way to go.
- Q: What is the difference between “| tee” and > ? I’ve been using > and it
  seems to do the same thing
    - A: [Richel] Well spotted! Besides echoing, `tee`also produces a file as
      a by-product. `tee` is named after a T junction (imagine a river!),
      where 'water’ (in this case: text) is going via two ways
      now. `[Thanks!][Richel: You are welcome :-)]`

## Second hour

This session worked fine. The learners had 22 minutes for exercises.
I put the learners in breakout rooms with 2-3 learners each.
There were around 5 questions in total and around 10 other
interactions.

Time scheduled|Actual time|Activity
--------------|-----------|-----------------------
0             |0          |Prior
10            |?          |Present
15            |13         |Challenge
35            |35         |Feedback and conclusion
45            |43         |Break

I expected the break to be 5 minutes earlier,
because I mistook my time schedule for this session
with the next one in my (paper) logbook.

- [ ] Use 1 session per page

### Discussion from shared document, during the second hour

- Q: Is there any advantage to using egrep instead of grep –E etc.?
  Why have both/teach us both?
    - A: [Birgitte] they are equivalent, it is just personal preference.
      Some people would find it easier to remember/use egrep than grep –E
    - A: [Richel] if you start using tools that check for style,
      you will find out that `egrep` will be warned against.
- Q: Why do some of the options have more versions? Like, long recursive and
  short r? Also some are really not very easily named,
  like - - text is –a
    - A: [Birgitte] I guess again personal preference.
      The long version is usually a better mnemonic in the way it is named,
      while the short version may (as you say) not be,
      but it is quicker to write.

## Third hour

During the break before this hour, I noticed my computer getting slower,
with camera images of myself being shown around once per second.
I've seen this before and it causes Zoom to freeze.
I decided to (1) use ethernet (I forgot!) and (2) restart Zoom.
The Zoom was showing my camera well again.

Due to this, I lost my co-host status. I forgot to ask my colleague on
time to make me co-host again. When I asked, she was not there (which
is fine: I encouraged her to do work!). This meant that I could not
use breakout rooms.

There is something joy in having 11 people work in silent in a Zoom room.
However, there was no way I could see what they were doing. I was
teaching in the blind and I missed seeing what they were doing exactly.

In the shared document, there is just one discussion (see its below)
in which two learners felt intimidated by the book.
One can see in the lesson plan that I think (and I still do!)
it is the best fitting book. But I am not too enthusiastic about it either.
Next time, do something else: either use the `awk` manual
or use material from my AWK course. Or (my favorite) drop `awk`
altogether.

- [ ] Use `man awk` or use custom course materials or remove `awk`

Time scheduled|Actual time|Activity
--------------|-----------|-----------------------
0             |0          |Prior
5             |?          |Present
10            |?          |Challenge
30            |30         |Feedback and conclusion
40            |40         |Break

### Discussion from shared document, during the third hour

- Q: Can you recommend a short online intro to awk (not a whole book)
  just like a couple pages with the most important?
    - A [Richel]: I think this book is closest to that:
      it is not an AWK book at all. I have seen only one course that uses
      the one-liner approach (which happens to be mine :-))
      at <https://uppmax.github.io/awk_course/> .
      Does that answer your question?
        - Thanks. I will read it! I meant something like what for the other
          section with pipe and wc/cut.
            - [Richel] I don’t make those cheat sheets on **purpose**:
              it takes away your learning. You are encouraged to make one:
              it is great for learning :-)
                - Not sure that works for me. I’ll check your other course,
                  and do some googling. Thanks!
                    - [Richel] Great! Asking AIs is all the hype nowadays
                      too ...
                        - Tried it. Got like 8 wrong of 10 so wasn’t cool :-(
                            - [Richel] Too bad it does not work!
                              The book used, however, only shows 4 lines of
                              AWK of which 3 are used.
                              Maybe that is little enough...
                            - There is a cheat sheet here:
                              [AWK cheat sheet](https://quickref.me/awk.html)
                                - [Richel] Well done!
                                - Thanks for finding this! I also get intimidated
                                  having to look in a book for a short course
                                  like this, so prefer a short text like that.
                                  Would have preferred one styled to the course
                                  so I know what we are expected to know
