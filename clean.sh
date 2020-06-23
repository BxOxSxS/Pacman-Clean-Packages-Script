#!/bin/sh
f=.pkg
fc=.cpkg
rm -f $f
rm -f $fc
pacman -Qdtq > $f
echo 'Use `y` to select the package to be removed'
echo 'Use `n` to do not remove package'
echo 'Use `c` to cancel script'
echo 'Use `s` to skip next packages'
echo 'Use `i` to display information about the package using pacman'
echo
n=1
while IFS= read -r line; do
     pkg[$n]=$line
     n=$((n+1))
     done < $f
n3=0
for ((n2=1;n2<${n};n2++))
do
     read -p "$n2/$n ${pkg[${n2}]} " yn
     case $yn in
          [Ss]* ) n2=${n};;
          [Cc]* ) exit ;;
          [Ii]* ) echo && echo Info about ${pkg[${n2}]}: && pacman  -Q --info ${pkg[${n2}]} && n2=$((n2-1)) ;;
          [Yy]* ) echo ${pkg[${n2}]} >> $fc ;n3=$((n3+1));;
          [Nn]* ) ;;
          * ) echo "Please answer yes or no"; n2=$((n2-1)) ;;
     esac
done
echo "Number of selected packages: $n3/$n"
sudo pacman -R - < $fc
rm -f $f
rm -f $fc
