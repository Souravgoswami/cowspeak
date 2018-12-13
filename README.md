# cowspeak
let animals talk on your terminal (needs ncurses (tput) in Linux) (./cowspeak --help for more info)

Screenshots:

![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/1.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/2.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/3.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/4.png)
![alt text](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/5.png)

The Documentation Says:

```
Hi, my name is cowspeak. I speak a quote on your terminal.

Usage: Run me from the command line without any arguments, and I will show you a fortune.

All the Available arguments:

  --art or -a                   Display a tutorial on adding your own art.
  --blink or -b			Blink the texts.
  --documentation or -d         Display the documentation.
  --download or -dl		Download missing files from Github.
  --file=<path> or -f=<path>	Specify the path of your own ASCII art.
  --help or -h                  Display help.
  --invert or -inv		Invert the output (right to left in English)!
  --manual or -m                Display a manual. Same as documentation.
  --net=<url> or -n=<url>	Read data from a website (in curl format).
  --no-art or -na		Don't display the animal.
  --no-colour or -nc		Don't colourize the output.
  --no-text or -nt		Don't show any text, and only show the animal.
  --read=<file> or -r=<file>	Read a file.
  --reverse or -rev		Cowspeak reads upside down!
  --rotate-colour or -rc	Rotate the output colours in each line.
  --show-arts or -sa		Show arts in the default directory.
  --text=<text> or -t=<text>	Display a custom text.
  --version or -v		Display the current cowspeak version.

Examples:
	For custom text:
		cowspeak --text='text' / cowspeak -t='text'

	To display your own ASCII art:
		cowspeak --file='path/file.art'

	To display your own art with your text:
		cowspeak --file=directory/file.art --text='your text'

	To read a file from the storage:
		cowspeak --read='path/file.extension' or cowspeak -r='path/file.extension'

	Pipe another program's output to cowspeak (also accepts arguments):
		echo hello | cowspeak
		echo hello | cowspeak --argument -short_argument

	To read from the internet in curl format:
		cowspeak --net=http://www.example.net
		cowspeak --net=http://www.example.net --argument -short_argument

Help:
cowspeak -h or --help for the help message.
cowspeak -d or --documentation or --manual or -m for this documentation.
Creating Custom Art:
You can make your own art. Run cowspeak --art or cowspeak -a for more information.
Update Download all the files:
If you are missing some files, then please take a moment to download all the files from Github.
To do that, run:
	cowspeak --download or -d
	It will download all the necessary files. This will download less than 1 MiB files from the internet.
	NOTE: This argument will write files to ./cowspeak_files/ directory.
```
