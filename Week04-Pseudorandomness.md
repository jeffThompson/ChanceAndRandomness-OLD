![Detail of Manfred Mohr's 1971 plotter drawing "White Noise"](https://raw.githubusercontent.com/jeffThompson/ChanceAndRandomness/master/ImagesAndMedia/Week04-Psuedorandomness/WhiteNoise_ManfredMohr_1971-detail.jpg)

# PSEUDORANOMNESS

>"The computer is a unique device for the arts since it can function soley as an obedient tool with vast capabilities for controlling complicated and involved processes, but then again, full exploitation of its unique talents for controlled randomness and detailed algorithms could result in an entirely new machine – a creative artistic medium." – A. Michael Noll (1970)

This week, we'll transition from analog methods of random number generation to the computer, looking at how randomness can be a creative tool that both breaks the computer's determinism and takes advantage of its capacity to quickly create (seemingly) random values. Randomness and code have long existed side-by-side, first in the form of codes and code-breaking during WWII, later driving simulations for weather prediction and nuclear research. Artists early to use the computer – like A. Michael Noll, Vera Molnar, and Manfred Mohr – often used random values in their work as well.

"Randomness" in the computer presents some interesting intellectual friction though: the numbers it generates aren't really random! Since the computer is a deterministic system (everything is a 0 or a 1, at least until quantum computing becomes mainstream), we can't really create random numbers in the computer. Instead, they are defined by algorithms (instructions in code) which generate numbers that appear to be random, to varying degrees. We'll dig further into this in the coming weeks, but the random number generator (or RNG for short) we'll be using in Processing is called ["linear congruential"](https://rosettacode.org/wiki/Linear_congruential_generator). It uses a simple formula and a "seed" value that starts the process (usually the current date and time, though we can also change it):

    value[next] = 1103515245 * value[current] + 12345 % 2^31

Today we'll start with some Processing basics (and/or a refresher for those of you that have used it before), then start making images with random values. We'll continue this for the next two weeks while you begin work on your final project.

*Above: Detail of Manfred Mohr's 1971 plotter drawing "White Noise."*  

### ACTIVITIES  
- Critique of last-week's projects  
- Processing basics  
- Drawing a robot  
- Lunch break  
- For-loops and `random()`  
- Homework  

<hr>

## MORNING  
**Critique**  
We'll start the day looking at your Random Choice projects.

**Processing basics**  
Starting this week, we'll be transitioning to code, which will let us explore the visual possibilities of randomness. We'll be using [Processing](https://www.processing.org), a programming language created for artists and designers. It's built on Java, one of the most popular programming languages in the world, giving us access to all of Java's power without its mess.

The code examples are all in the `Code` folder for this class, but I'll also distribute them via USB drive too.


**Drawing a robot**  
Today we have amazingly deep programs for making art using computers, like Photoshop and Maya. But the concepts behind these tools is the same as it was in the earliest days of computer graphics: basic shapes, a coordinate system, pixels and colors on a screen. As a little in-class assignment, we'll explore these as our toolset and get more familiar thinking about images as numbers and positions. Building on the code examples you learned so far, generate a drawing of a robot using only code. Use any combination of shapes, color, stroke, transparency, etc to make your robots as detailed as possible.

Create a sketch with this basic structure:

    void setup() {
    	size(800,800);

    	// code to draw your robot here!

    	// save your robot, but be sure to change the filename
    	save("LastnameFirstname_ROBOT.png");
    }

If you already have some coding experience, please try to just use the methods we talked about today – adding fancy code and leveraging what you know will be encouraged later, but for now I'd like you to get used to the coordinate system and Processing's drawing functions. Think about how to leverage these simple tools (gradients drawn with lots of shapes of varying color, for example). Making functions to clean up your code is ok, but no for loops or animation please!

We'll work on these into the afternoon, then take a look at them as a group.

<hr>

## AFTERNOON  
**For-loops and `random()`**  
The power of programming really becomes visible when we add loops: repeating structures that let us draw hundreds or thousands of shapes with just a few lines of code. We'll do a short exercise to help you understand the for-loop's complex syntax, then create some initial random drawings.

You can also try combining some of the analog RNG methods we used last week like dice or yarrow stalks to "seed" Processing's `random()` function!

<hr>

## HOMEWORK  
For the last four weeks of the semester, you'll be working on a larger-scale, self-proposed project that explores chance and randomness. The medium, approach, and idea you work from is completely up to you, but I encourage you to think about a project that connects what we've talked about so far with your own creative practice. The work should show four week's effort, but that might be a single large work, lots of smaller pieces that form a series, or a small but labor-intensive project. Our last class meeting will be a critique of that work.

For next week, please write up a proposal of the work you want to do. This should be written like a cover letter, grant application, or project pitch: formal language and carefully proofed. 

Your proposal should include:  
- 1–2 sentence "elevator pitch" version of your project idea  
- What: longer description of what you want to make, with as much detail as possible (2–3 paragraphs)  
- How chance and/or randomness relates to your project idea (\~1 paragraph)  
- Why: talk about why you're interested in this project and how it connects with your creative practice (1–2 paragraphs)  
- Who: what artists, designers, musicians, and other creative work inspires this project and your work generally; include not just names but a short explanation (2–3 examples, though more is ok!)  

Please print your proposals and bring them to class next week. You should also start the project: ideation, prototyping, sketching, mockups, research, and/or materials-gathering. We'll discuss your project ideas next class, followed by further explorations of randomness in code.

<hr>

## PROJECTS SHOWN  
- A. Michael Noll  
- Vera Molnar  
- Manfred Mohr  
- Frieder Nake  
- Charles Csuri  

