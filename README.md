# Tic Tac Toe Play Loop

## Objectives

1. Use a loop within a method.
2. Use a looping method within a CLI.
3. Call a method within a loop.

## Overview

In this lab you're going to build a `#play` method for Tic Tac Toe that initiates a simple loop and calls `#turn`. It won't be a real game loop, but an very simplified version. Our `#play` method will initiate a loop that runs 9 times, playing an entire game.

## Instructions

### 1. Helper Methods in `lib/play.rb`

A bunch of helper methods have been provided that represent the logic required for a turn of tic tac toe. This includes `#display_board`, `#move`, `#position_taken?`, `#valid_move?`, and `#turn`. You should read the code in that file and try to understand how these methods work and come together in the `#turn` method to represent a turn of tic tac toe with move validation.

There are no tests for these methods and if they stop working as they do currently, your lab will break because your `#play` method will depend upon a functioning `#turn` method. Edit these methods at your own risk.

### 2. `bin/play` CLI

Before you begin building the `#play` method in `lib/play.rb`, you should first take a look at the CLI provided in `bin/play`. This code will require your `lib/play.rb` library, intialize a starting board, and welcome the user. You can run it with `./bin/play` or `ruby bin/play` from your Command Line terminal. You'll see:

```
Welcome to Tic Tac Toe!
   |   |   
-----------
   |   |   
-----------
   |   |   
```

The CLI shows the start of the game but doesn't start playing the actual game. Your `#play` method will provide that logic. It'll be easier to code `#play` if you can actually use the CLI to see how your method changes the behavoir of the game. Edit `bin/play` to include a call to `#play` passing it the `board` as an argument. You can add that line to the `bin/play` CLI in advance of actually defining the `#play` method in `lib/play.rb`. If you try running your CLI now, you'll get a `NameError` about an undefined method `play`, which is fine, because that's what we're about to define.

You can make sure your CLI is working by running `learn spec/01_cli_spec.rb` or `rspec spec/01_cli_spec.rb`.

### `#play`

You must build a `#play` method in `lib/play.rb` (you can add it anywhere but the bottom would be nice).

The `#play` method simply accepts a board and should start a loop and call `#turn`. What mechanism you use for the loop should not really matter as long as it loops at least 9 times. Be careful to make sure the loop terminates otherwise you'll get an infinite loop in your `bin/play` and when you run the tests through `learn` or `rspec`. You'll notice you're in an infinite loop if you run the test or bin and it just never terminates and hangs.

As you code and try to get the tests to pass, play with your CLI and make sure that it is looping, that it is allowing you to play multiple turns of Tic Tac Toe, even if they are unrealistic according to the rules of the game. A working `#play` method will produce a CLI that behaves as follows:

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

### Conclusion

This play loop is pretty good. The two issues with it are that the turns do not switch between X and O and the game does not terminate after a player wins.
