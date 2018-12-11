# cowspeak
let animals talk on your terminal (needs ncurses (tput) in Linux) (./cowspeak --help for more info)

Screenshots:

![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/1.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/2.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/3.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/4.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/5.png)

Documentation:
Hi, my name is cowspeak. I speak a quote on your terminal. I can read quote of the day from brainyquote.com as well.
In that case, If there is no internet connection, then I tell a fortune quote.

Usage: Run me directly from the command line with ruby interpreter or with your shell, I will show you a fortune with no aruguments:
		1. ruby ./cowspeak
		2. chmod 777 ./cowspeak
	    	    ././cowspeak

Available arguments:
  --art or -a                   Display a tutorial on adding your own art.
  --blink or -b			Blink the texts (not supported in all terminals yet).
  --documentation or -d         Display the whole documentation including this help.
  --download or -dl		Download missing files and database from Github.
  --file=<path> or -f=<path>	Specify the ASCII file path to display your own ASCII art.
  --help or -h                  Display this help.
  --invert or -inv		Invert everything text! Read from right to left in English!!
  --manual or -m                Display a manual. Same as documentation.
  --net=<url> or -n=<url>	Read data from a website (in curl format).
  --no-art or -na		Don't display the animal.
  --no-colour or -nc		Don't colourize the output.
  --no-text or -nt		Don't show any text, and only show the animal.
  --read=<file> or -r=<file>	Read a file.
  --reverse or -rev		Cowspeak reads upside down!
  --rotate-colour or -rc	Rotate the output colours in each line.
  --show-arts or -sa		Show all available installed arts in the default directory.
  --text=<text> or -t=<text>	Display a custom text.
  --version or -v		Display the current /usr/bin/cowspeak version.


NOTE: Please run cowspeak --help for more details. Here's some examples:

		Examples:
			For custom text:
				cowspeak --text='text' / ./cowspeak -t='text'

			To display your own ASCII art:
				./cowspeak --file='path/file.art'

			To display your own art with your text:
				./cowspeak --file=directory/file.art --text='your text'

			To read a file from the storage:
				./cowspeak --read='path/file.extension' or ./cowspeak -r='path/file.extension'

			You can also:
				cat text_file.txt | ./cowspeak

			Also, it can read a website (in curl format):
				cowspeak --net=http://www.example.net
	Help:
		./cowspeak -h or --help for the help message.
		./cowspeak --documentation or ./cowspeak -d for this documentation.

	Creating Custom Art:
		You can make your own art. Run ./cowspeak --art or ./cowspeak -a for more information.

	Update Fortune Database:
		This is just an extra feature. Update synchronizes your fortunes.data with https://raw.githubusercontent.com/bmc/fortunes/master/fortunes.
		You need not to update the database for months. It's fine if you never update the database. There are many fun inside the provided database.
		However, if the database gets deleted, run ./cowspeak --download or ./cowspeak -d. You can occasionally run an update - won't harm anything.


