
# HUMAN LOOP  

Looping, called *iteration* in programming lingo, is one of code's most powerful tools. It lets us walk through every element in a list, draw repeating shapes, and so much more. The two main commands for iteration, the *while-loop* and the *for-loop*, and though they become second nature with some practice, their syntax can be very confusing at first. In this exercise, we'll perform the actions of these loops with our bodies, then move into the computer and see how they can be used in code.

The slides and other materials used for this exercise can be found in this folder; a bit of background information on the two iteration commands is below.


## WHILE LOOP  
The simplest iteration structure is the while-loop. Its first use dates to some of the earliest programming languages, likely first used in FORTRAN (or FORmula TRANslating System), created in 1953 at IBM. However, like many technical ideas, we can actually trace the while-loop back much further. Muhammad ibn Musa al-Khwarizmi (after whom the term *algorithm* is named) discussed repeating sequences and count-controlled loops as early as the 9th-century. Charles Babbage's Analytical Engine also included looping structures similar to the while-loop.

The basic structure of a while-loop:

    while (condition) {
    	// do something
    }

The loop will repeat until the condition is met; if it never is, the loop runs forever! Typically, we might keep track of a count, stopping the loop when a certain value is reached:

    count = 0
    while (count < 5) {
    	// take a step forward
    	count = count + 1
    }

While-loops can also be intentionally infinite. This might be used for an interactive project where the program should run forever:

    while (true) {
    	// display graphics, read the mouse, etc
    }


## FOR LOOP  
More common today is the for-loop, which combines the syntax of the while-loop into a single statement. The for-loop was popularized in the language ALGOL (ALGOrithmic Language) in the late 1950s. It is a translation of the German word *für*, used in the language Superplan in 1949. The idea of start/end points and a set number of repetitions has similar roots as the while-loop, but can also be found in classical music, where sections are to be repeated a specified number of times.

The structure of a for-loop combines the initial value, condition to stop, and increment of the while-loop into a single statement:

    for (initial value; stopping condition; increment) {
    	// do something
    }

Below is the same counting-based loop we saw above:

    for (count=0; count<5; count=count+1) {
    	// take a step forward
    }

We can also combine two for-loops into a two-dimensional loop! While this sounds crazy, it's how we do things like draw a grid:

    for (y=0; y<height; y=y+10) {
    	for (x=0; x<width; x=x+10) {
    		// draw a square at x/y that is 10x10 pixels
    	}
    }

For examples of how this works in Processing, see this week's `Code` folder.

