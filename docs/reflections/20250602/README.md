# Reflection 2025-06-02



- Q: The `sort` command doesn’t behave quite the same for me as in the example, could this be because I’m using a Mac? (see answer below 😊 ) 
    - A: [Richel] Yes: different unix-like systems have slightly different tools, with slightly different behavior. We’ll all have to live with that 😊. In the end, running ‘man sort’ to find how your `sort` works exactly is the only way to go. 
- Q: What is the difference between “| tee” and > ? I’ve been using > and it seems to do the same thing 
    - A: [Richel] Well spotted! Besides echoing, `tee `also produces a file as a by-product. `tee` is named after a T junction (imagine a river!), where 'water’ (in this case: text) is going via two ways now. [Thanks!][You are welcome 😊] 
- Q: Is there any advantage to using egrep instead of grep –E etc.? Why have both/teach us both?  

    - A: [Birgitte] they are equivalent, it is just personal preference. Some people would find it easier to remember/use egrep than grep –E  
    - A: [Richel] if you start using tools that check for style, you will find out that `egrep` will be warned against.  

- Q: Why do some of the options have more versions? Like, long recursive and short r? Also some are really not very easily named, like - - text is –a 

    - A: I guess again personal preference. The long version is usually a better mnemonic in the way it is named, while the short version may (as you say) not be, but it is quicker to write.  

- Q: Can you recommend a short online intro to awk (not a whole book) just like a couple pages with the most important? 

    - A [Richel]: I think this book is closest to that: it is not an AWK book at all. I have seen only one course that uses the one-liner approach (which happens to be mine 😊) at https://uppmax.github.io/awk_course/ . Does that answer your question? 

        - Thanks. I will read it! I meant something like what for the other section with pipe and wc/Cut.  

            - [Richel ] I don’t make those cheat sheets on purpose: it takes away your learning. You are encouraged to make one: it is great for learning 😊 

                - Not sure that works for me. I’ll check your other course, and do some googling. Thanks! 

                    - [Richel] Great! Asking AIs is all the hype nowadays too ...   

                        - Tried it. Got like 8 wrong of 10 so wasn’t cool 🙁  

                            - [Richel] Too bad it does not work! The book used, however, only shows 4 lines of AWK of which 3 are used. Maybe that is little enough... 

                            - There is a cheat sheet here: https://quickref.me/awk.html  

                                - Well done! 

                                - Thnx for finding this! I also get intimidated having to look in a book for a short course like this, so prefer a short text like that. Would have prefered one styled to the course so I know what we are expected to know  
