---
title: "Cowspeak Man Page"
layout: "cowspeak"
author: "Sourav Goswami"
categories: help
---

NAME

       cowspeak - Display an animal with a random quote or your own text.

SYNOPSIS

       cowspeak, the program displays an animal with a random quote or your own text.

OPTIONS

      --art/-a
                   Display a tutorial on adding your own art.

       --blink/-b
                   Blink the texts (not supported in all terminals yet).

       --borderh=<ch>/-brh=<ch>
                   Horizontal border character.

       --borderv=<ch>/-brv=<ch>
                   Vertical border character.

       --bubble=<text>/-bbl=<text>
                   Specify the character of speech balloons.

       --documentation/-d
                   Display the whole documentation including this help.

       --download/-dl
                   Download missing files and database from Github.

       --file=<path>/-f=<path>
                   Specify the ASCII file path to display your own ASCII art.

       --fill=<char>/-fc=<char>
                   Fill the white space with a specific character.

       --force-update/-fu
                   Update cowspeak forcefully even if no updates available.

       --help/-h
                   Display this help.

       --invert/-inv
                   Invert everything text! Read from right to left in English!!

       --manual/-m
                   Display a manual. Same as documentation.

       --net=<url>/-n=<url>
                   Read data from a website (in curl format).

       --no-art/-na
                   Don't display the animal.

       --no-colour/-nc
                   Don't colourize the output.

       --no-text/-nt
                   Don't show any text, and only show the animal.

       --read=<file>/-r=<file>
                   Read a file.

       --reverse/-rev
                   Cowspeak reads upside down!

       --rotate-colour/-rc
                   Rotate the output colours in each line.

       --show-arts/-sa
                   Show all available installed arts in the default directory.

       --text=<text>/-t=<text>
                   Display a custom text.

       --version/-v
                   Display the current version of cowspeak.

       --update/-u
                   Update cowspeak if possible.

       --welcome/-w
                   Show a welcome screen and some OS details.

EXAMPLES

          No argument:
                           Show a random existing character with a random fortune and colours.

          Specify the horizontal border character
                      (the following example will draw the border with * character):

                           cowspeak --borderh='*'

                           cowspeak -brh='*'

                      Note that if you specify more than a character, the animal will select any one at its
       own will.

          Specify the horizontal border character
                      (the following example will draw the border with * character):

                           cowspeak --borderv='*'

                           cowspeak -brv='*'

                      Note that if you specify more than a character, the animal will select any one at its
       own will.

          Specify the speech bubbles character
                      (the following example will draw the border with * character):

                           cowspeak --bubble='*'

                           cowspeak -bbl='*'

                      Note  that  if  you  specify  more  than one character, the animal will use the whole
       string.

          For custom text:
                           cowspeak --text='text' or -t='text'

          To display your own ASCII art:
                           cowspeak --file='path/file.art'

          To display your own art with your text:
                           cowspeak --file=directory/file.art --text='your text'

          To read a file from the storage:
                           cowspeak --read='path/file.extension' or -r='path/file.extension'

          Pipe another program's output to cowspeak (also accepts arguments):
                           echo hello | cowspeak

                           echo hello | cowspeak --argument -short_argument

          To read from the internet in curl format:
                           cowspeak --net=http://www.example.net

                           cowspeak --net=http://www.example.net --argument -short_argument

          Cowspeak can show you a welcome screen and provide some OS details.
          It's helpful if you connect to multiple terminals on multiple machines.
          To get the welcome screen, run:
                           cowsepak --welcome or cowspeak -w

          [NOTE: If you pass an invalid argument, Cowspeak will likely ignore it without any warning.]
