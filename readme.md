#macOS Semi-Automated Fresh Install

This is a small guide on how I semi-automated the process of fresh installing macOS. It was tested so far on macOS Sierra, but most of the code was obtained from others that did it on previous versions of the OS.

## Erase and Install
That's the basic right, just erase your HD with Mac OS Extended Journaled and install the system.

## Running the Shell Scripts
With the system installed, download both shell scripts and put them on your home folder – /users/raff in my case – or any other folder if you know how to "cd" your way there.

To run the scripts, use the syntax below:

`bash system-configuration.sh`
`bash apps-configuration.sh`

_The apps-configuration will take a long time since you'll be downloading tons of files to your computer._

## Installing apps that aren't automated
While apps-configuration.sh is running, you can advance and start installing other apps that can't be automated by cask or homebrew.

My list is below:
- 
