#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired

#Displaying setuid files
echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo ""


#task 1
#script modified like that it displays setgid file on the second listing.
# Displaying setgid files
echo "Setgid files:"
#setgid is special file permission that is applicable for executable file
#echo command prints the exact given output as enclosed in "".
echo "=============="
#echo command prints the exact given output as enclosed in ""
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 4
#only command display files with the permissions set to 2000.
#find command is used to searching for the files.
# / signifies home or root directory.
#2> /dev/null redirects to /dev/null if error is encountered.
#sort -k is used for sorting file on the basis of key.
# | pipe is used for combining two or more commands.
echo ""
#echo command prints the exact given output as enclosed in ""


#task 2
#script is modified for displaying 10 largest regular files in system.
# Displaying latest files.
echo "Largest files:"
#echo command prints the exact given output as enclosed in ""
echo "============="
#echo command prints the exact given output as enclosed in ""
find / -type f -exec du -Sh {} + 2>/dev/null | sort -rh | head -n 10
#find command is used to for files searching.
# / signifies home/root directory.
#2> /dev/null redirects to /dev/null if error is encountered.
#du command estimates the disk usage.
#du -sh compares the human readable numbers and it shows the total of for each argument.
#sort -rh sorts value in human readable format and also reverses results.
#{} are used to summarize the disk usage of each file.
# | pipe is used for combining two or more commands.
# head -n 10 displays first 10 files.
