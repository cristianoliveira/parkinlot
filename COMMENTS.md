# Comments

Here I will share my thoughts while solving this problem.

## The docopt lib

The requirements of this challenge says we need to have a kind of CLI so
instead of having to implement the argument parsing I choose one Gem for this.
I will use the docopt standard for this. It is a well known standard for creating
CLI in many languages like Python, Golang and Ruby :)

## The classes desing

I will implement the commands in a way that we can have basic the same flow
for both usages REPL and reading from file.

### The store

There is no mention about persistence so I will assume that it will work only
in memory and with no persistence. I created an abstraction for `store` it
will make the code flexible cause if we decide to change it after will be way
easier.

### The core

Since we will have two ways for using the app one as a REPL and one by file
I made this `core` class in order to abstract the act of executing a given command. It
will enable us sharing this between both ways.

### The commands

The commands must follow some interface that is `execute(args)` in order to be
flexible it's use and implementation later the `core` implements some kind of
strategy pattern so the commands can be finded by name.

## Improvements

There are some part of the code that is present in most of the commands. We could
abstracts those validations in some way but for now I think it is enough it makes
the code explicit.
