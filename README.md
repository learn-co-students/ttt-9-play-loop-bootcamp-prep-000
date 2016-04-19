# Tic Tac Toe Play Loop

## Objectives

1. Use a loop within a method.
2. Use a looping method within a CLI.
3. Call a method within a loop.

## Overview

In this lab you're going to build a `#play` method for Tic Tac Toe that initiates a simple loop and calls `#turn`. It won't be a real game loop, but a very simplified version. Our `#play` method will initiate a loop that runs 9 times, playing an entire game.

## Instructions

### Part I: Understanding the Helper Methods in `lib/play.rb`

You'll notice that we've already added some helper methods for you in here that you have yourself created in previous labs. Take a look at our code and notice how it's probably different than how you wrote those methods. Isn't it cool how there are so many ways to write the same method? Now try to understand how these methods work to all come together in the `#turn` method to represent a turn of tic tac toe with move validation.

There are no tests for these methods and if they stop working as they do currently, your lab will break because your `#play` method will depend upon a functioning `#turn` method. Edit these methods at your own risk.

### Part II: The CLI

Before you begin building the `#play` method in `lib/play.rb`, you should first take a look at the CLI provided in `bin/play`. This code will require your `lib/play.rb` library, intialize a starting board, and welcome the user. You can run it with `./bin/play` or `ruby bin/play` from your Command Line terminal. You'll see:

```
Welcome to Tic Tac Toe!
   |   |
-----------
   |   |   
-----------
   |   |   
```

The CLI shows the start of the game but doesn't start playing the actual game. Your `#play` method will provide that logic. It'll be easier to code `#play` if you can actually use the CLI to see how your method changes the behavior of the game. Edit `bin/play` to include a call to `#play` passing it the `board` as an argument. You can add that line to the `bin/play` CLI in advance of actually defining the `#play` method in `lib/play.rb`. If you try running your CLI now, you'll get a `NameError` about an undefined method `play`, which is fine, because that's what we're about to define.

You can make sure your CLI is working by running `learn spec/01_cli_spec.rb` or `rspec spec/01_cli_spec.rb`.

### Part III: The `#play` Method

You must build a `#play` method in `lib/play.rb` (you can add it anywhere but the bottom would be nice).

The `#play` method should:

* Accept an argument of a board
* Start a loop and call `#turn`.

A few things to think about:

* What constitutes a rousing game of tic tac toe? Do the two players simply keep filling out squares forever and ever? Definitely not. Eventually the game must end. In fact, there are only 9 spots on a tic tac toe board, so there are only 9 turns to be placed. Account for this in the loops that your `#play` method contains.
* Which looping construct (`while`, `until`, etc) you use doesn't really matter. What does matter is how and when you terminate the loop. You don't want to get stuck in an infinite loop when you execute your `bin/play` file or when you run the tests through `learn` or `rspec`. You'll notice you're in an infinite loop if you run the test or bin and it never terminates or "hangs" - if you do get stuck, just type `control` + `c` to terminate the test.

As you code and try to get the tests to pass, play with your CLI and make sure that it is looping, that it is allowing you to play multiple turns of Tic Tac Toe, even if they are unrealistic according to the rules of the game (we'll move on to working out who wins the game in a later exercise).

A working `#play` method will produce a CLI that behaves as follows:

```
$ ./bin/play
Welcome to Tic Tac Toe!
   |   |   
-----------
   |   |   
-----------
   |   |   
Please enter 1-9:
1
 X |   |   
-----------
   |   |   
-----------
   |   |   
Please enter 1-9:
1
Please enter 1-9:
2
 X | X |   
-----------
   |   |   
-----------
   |   |    
Please enter 1-9:
3
 X | X | X
-----------
   |   |   
-----------
   |   |   
```

Remember that when you see a number in this sample output it represents user input. In this game, the first move was to position "1", the second move attempted to also move to position "1" but was denied because of validation. The user then entered "2", the board marked an "X" instead of an "O", but the move was completed and another turn followed. The user then entered a "3" and the board was also updated. These turn loops would continue.

**Note:** *Don't* just call the `#turn` method 9 times inside the `#play` method. Use the looping constructs we've learned in previous lessons!

### Conclusion

Once you get all the tests passing, your `#play` loop should be looking pretty good. There are however two issues with it. First, the turns do not switch between "X" and "O" tokens. Second, the game does not terminate after a player wins. Take a moment and brainstorm––what are some ways in which we can tell our game to switch tokens according to whose turn it is? How can we determine if and when a certain player has won?

We'll be building all of these functionalities soon, this is just food for thought for now.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/ttt-9-play-loop' title='Tic Tac Toe Play Loop'>Tic Tac Toe Play Loop</a> on Learn.co and start learning to code for free.</p>
