#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

printf "Enter first number:"
read -r firstnumber
# user input the first number
printf "Enter second number:"
read secondnumber
# user input the second number
printf "Enter third number:"
read thirdnumber
# user input the third number

sum=$(($firstnumber + $secondnumber + $thirdnumber))
# calculating the sum
product=$(($firstnumber * $secondnumber * $thirdnumber))
# calculating the product

cat <<EOF
$firstnumber plus $secondnumber plus $thirdnumber is $sum
product of $firstnumber,$secondnumber and $thirdnumber is $product
EOF
