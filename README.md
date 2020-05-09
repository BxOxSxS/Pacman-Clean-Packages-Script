# Pacman Clean Packages Script
This is small script that get packages from command `pacman -Qdtq` then let you choose which do you want to select to remove

## How to use
After starting script it will ask you one-by-one what to do with package
* Use `y` to select the package to be removed
* Use `n` to do not remove package
* Use `c` to cancel script
* Use `s` to skip next packages

After selecting script will tell you how many packages you have chosen and call pacman with sudo to remove packages, you can cancel that action
