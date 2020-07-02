#!/bin/bash
# This script demonstrates how the shift command works


# TASK 1: instead of just adding arguments to an array, use a case statement to recognize some options
#          Options to recognize: -h for help, -v for verbose mode, -d N for debug mode with N being a single digit number
#          If the help option is recognized, print out help for the command and exit
#          If the verbose option is recognized, set a variable to indicate verbose mode is on
#          If the debug optionis recognized, set a variable with the debug level from the number given after the -d on the command line
#             display an error if the user gave the -d option without a single digit number after it
#          Anything that wasn't recognized on the command line should still go into the myargs array


# create an empty array to put the command line arguments into
myargs=()
# loop through the command line arguments

while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # add whatever is in $1 to the myargs array
  # checking if $2 contains any oprions such as -h, -v and -d
  case $2 in # checking value of $2 for various possibilities. case command works as alternative for if command.
	-h)
	echo $($1 --help) # check if -h option is recognized and if so display help menu for $1 i.e command before -h option
 	exit

	;; # used to close case
	-v)
	echo ""
	v="on"
	myargs+=("$1 verbose $v") # if verbose mode is recognized we notify user that verbose mode for command is recognized and is stored in array.

	echo "Verbose mode on for $1"
	echo ""

	;; # used to close case
	-d)
	if [ -z "$3" ] # checking if debug option is provided with a number. [ -z ] is used to identify is string is empty
	then
      		echo "No option provided with debug option." # if no option provided notify user and exit
		exit
	else # to be executed if statement is false
		myargs+=("$1 "-d"  $3") # adding command to myargs array with debug number provided
		echo

	fi
	;; # used to close case

	*)
	case $1 in # using nested case not to add -v and -d in list
		-v) # not adding -v on array again
		;;
		-d) # not adding -d on array again
		;;
		*) #adding everything except -d and -v on myargs array
		myargs+=("$1")  # if none of above option are recognized add data to myargs
		echo "Added \'$1\' to the arguments array" # notify user about added data
	esac

  esac # exiting case statement
shift # this initializes value of simulataneous $ to $1
	# tell the user we shifted things
	echo "Shifted command line, leaving $# things left to process."
  	echo "--------------------------"
  # tell the user what we did


  # each time through the loop, shift the arguments left
  # this decrements the argument count for us

  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"

# TASK2: display the settings and myargs contents
#         Tell the user if vebose mode is on
#         Tell the user if debug mode is on and if it is, what number it is set to
#         Print out the myargs array with a label

for i in "${myargs[@]}" # using for loop to iterate through myargs
	do
	echo $i # printing value of myargs array with simulateous change of index number
	done # exiting for loop
  
