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

## The store

There is no mention about persistence so I will assume that it will work only
in memory and with no persistence.

