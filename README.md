# Cowspeak 🐮
https://souravgoswami.github.io/cowspeak/

Display a gradient colourful animal with a random quote or your own text in your terminal.

![cowspeak](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/a.jpg)

---

Note that this is only for GNU/Linux systems. It depends on `ruby`. Cowspeak recommends you to have `Ruby 2.4.0+`.

💎 This version is intended to run locally, without any root privileges. To run this version, download the repo as zip or clone it, and then run `cowspeak` (the source code) with ruby. If you want to install cowspeak for all users (as root), then follow the below instructions.

---

## For Debian/Linux Mint/Ubuntu/Kali Linux/Raspbian/Other debian based systems 🐄

   1. Download the latest ![deb file](https://github.com/Souravgoswami/cowspeak-deb/tree/master/Deb).

      Cowspeak Debian edition releases can also be found [here](https://www.opendesktop.org/p/1271477/).

   2. Install the deb file:
            `dpkg -i cowspeak-v<version>.deb`
                Or
             You can use gdebi-gtk / gdebi.
   3. Sometimes the latest deb package may be a month or two older than the latest source code. In that case, after the installation, you may want to check for an update, which will not use more than 30 KiB of internet data:
   
             `sudo cowspeak -u`

   If you don't want to download and install the deb file for some reason, please follow the next section: *"Running Cowspeak on Other Distributions ⚙️"*
    

## Running Cowspeak on Other Distributions ⚙️

If you want to run `cowspeak` in Arch Linux / OpenSUSE / Fedora / CentOS / RedHat etc. other GNU/Linux distributions, then please follow the steps:
    
   + Make sure you have **Ruby 💎**:
   
       + Arch Linux 🏹 : `sudo pacman -S ruby`
         
       + Fedora / CentOS: `sudo yum install ruby`
         
       + For any other distribution, install the Ruby package. When done, follow the next step!

   + Run the ![Root_Installer.rb](https://github.com/Souravgoswami/cowspeak/blob/master/Root_Installer.rb) as root.
         
        Example: `sudo ruby Root_Installer.rb`
         
        Press Enter to Confirm each step.

   + When the above step succeeds, run:
        `sudo cowspeak -dl`
   
## 🐮 Cowspeak Accepts Arguments. All the Available Arguments are 👇
```
Hi, my name is cowspeak. I speak a quote on your terminal.                   
Usage: Run me from the command line without any arguments, and I will        
show you a fortune.                                                          
                                                                             
⬢ All the Available arguments:                                               
    --art or -a                    Display a tutorial on adding your own art.
    --borderh=<ch>/-brh=<ch>       Horizontal border character.              
    --borderv=<ch>/-brv=<ch>       Vertical border character.                
    --bubble=<text>/-bbl=<text>    Specify the character of speech balloons. 
    --documentation/-d             Display the documentation.                
    --file=<path>/-f=<path>        Specify the path of your own ASCII art.   
    --fill=<char>/-fc=<char>       Fill the quote area with a character.     
    --help/-h                      Display help.                             
    --net=<url>/-n=<url>           Read data from a website (in curl format).
    --no-art/-na                   Don't display the animal.                 
    --no-colour/-nc                Don't colourize the output.               
    --no-text/-nt                  Don't show any text, show the animal.     
    --read=<file>/-r=<file>        Read a file.                              
    --show-arts/-sa                Show arts in the default directory.       
    --text=<text>/-t=<text>        Display a custom text.                    
    --version/-v                   Display the current cowspeak version.     
    --welcome/-w                   Show some system details to the user.     
                                                                             
⬢ Other Notable Styles:                                                      
    --blink or -b                  Blink the texts.                          
    --bold                         Bold the texts.                           
    --double-underline             Double underline texts.                   
    --italic                       Italicize texts.                          
    --overline                     Overline texts.                           
    --strikethrough                strikethrough texts.                      
    --underline                    underline texts.                          
    --colour=hex1,hex2,hexN        Add N hex colours to texts.               
                                   (minimum 2 colours)                       
                                                                             
⬢ Update Cowspeak:                                                           
    --download/-dl                 Download missing files from Github.       
    --force-update/-fu             Forcefully update even if current         
                                   version is latest.                        
    --update/-u                    Update cowspeak if any update is          
                                   available.                               
```

## Note on Arguments 📝

You have to pass each argument separately. For example, cowspeak -rc rotates the colour of the output, and -w shows a welcome screen with some system status and information. So if you want to use both, you have to use cowspeak -rc -w (instead of cowspeak -rcw).

If you pass an invalid argument, cowspeak will not inform you. It will simply ignore the invalid argument so you can cheer!

## Screenshots 📸

![alt cowspeak --welcome](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/b.jpg)
 
![cowspeak](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/c.jpg)
 
![cowspeak](https://github.com/Souravgoswami/cowspeak/blob/master/Screenshots/d.jpg)
 

## Bug Report 🐞
Cowspeak considers bugs and security issues very seriously 🐛. If you got any bug in cowspeak, any security issue, or an idea, please let me know via ![GitHub](https://github.com/Souravgoswami/cowspeak/issues/new) or email me souravgoswami@protonmail.com
