#!/bin/bash
#
# this script rolls a six-sided die
#

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one

# roll the dice and display the result

echo "Enter your first name :"
#echo command is used to print statement as it is in terminal
read name
# read command accepts user input
length=${#name}
# ${#..} calculates the length of string
for ((c=1; c<=$length; c++))
# using for loop such that condition executes until and unless value of c<=length of string. while each time condition executes the value of c is increased by one by use of c++ statement
do
# condition in for loop should be enclosed by do and done which intializes and ends for loop command execution
echo "
Rolling...
$(( RANDOM % 6 + 1)) rolled
"
# Generating random results. As generated results should be less than 6 we use modulo operation 6 + 1.
done
#
