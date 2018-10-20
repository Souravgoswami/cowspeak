# cowspeak
let animals talk on your terminal (needs ncurses (tput) in Linux) (./cowspeak --help for more info)

Documentation:
Hi, my name is cowspeak. I speak a quote on your terminal. I can read quote of the day from brainyquote.com as well.
In that case, If there is no internet connection, then I tell a fortune quote.

Usage: Run me directly from the command line with ruby interpreter or with your shell, I will show you a fortune with no aruguments:
		1. ruby ./cowspeak
		2. chmod 777 ./cowspeak
	    	    ././cowspeak

Pass me some arguments:
	Available arguments are:
		--text= or -t=                   Display a custom text.
		--read or -r=                    Read a file.
		--file= or -f=                   Specify the ASCII file path to display your own ASCII art.
		--help or -h                     Display this help.
		--documentation or -d            Display the whole documentation including this help.
		--art or -a                      Display a tutorial on adding your own art.
		--update or -u                   Update fortune database from Github.

		Examples:
			For custom text:
				cowspeak --text='text' / ./cowspeak -t='text'

			To display your own ASCII art:
				./cowspeak --file='path/file.art'

			To display your own art with your text:
				./cowspeak --file=directory/file.art --text='your text'

			To read a file from the storage:
				./cowspeak --read='path/file.extension' or ./cowspeak -r='path/file.extension'

			NOTE: --text with --read or -t with -r will not read the file, but show the custom text.
					Here's the priority of them, the higher the priority, the higher chances they are considered.

						Priority 1: text
						Priority 2: read
	Help:
		./cowspeak -h or --help for the help message.
		./cowspeak --documentation or ./cowspeak -d for this documentation.

	Creating Custom Art:
		You can make your own art. Run ./cowspeak --art or ./cowspeak -a for more information.

	Update Fortune Database:
		This is just an extra feature. Update synchronizes your fortunes.data with https://raw.githubusercontent.com/bmc/fortunes/master/fortunes.
		You need not to update the database for months. It's fine if you never update the database. There are many fun inside the provided database.
		However, if the database gets deleted, run ./cowspeak --update or ./cowspeak -u. You can occasionally run an update - won't harm anything.
