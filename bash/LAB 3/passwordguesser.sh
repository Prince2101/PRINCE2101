#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same
# it also demonstrates using conditional execution

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data (i.e. TestString)
# TASK 2: Improve it by rewriting it to use the if command
#         The if command should test if they got it right, in which case it should tell them they got it right
#         The if command should tell them they got it wrong
# TASK 3: Improve it by giving them 5 tries to get it right before failing
#           *** Do not use the exit command, and do not use a loop (e.g. while or for)



# Since we are not supposed to use loop nested if condition is used for 5 times to evaluate if user input is same as declared password.
# echo commanf is used to print string as it is in terminal.

echo "Enter Your Guess"
read myString
# reading user input and storing value in myString.
referenceString="password"
# declaring reference password.

if [ $myString = $referenceString ]
# checking if declared password is same as user input.
then
# condition to be executed if condition is true.
echo ""
echo "CONGRATULATIONS! You've entered correct password."
echo ""
else
# condition to be executed if condition is false.
	echo "You've entered incorrect password try again"
	read myString1
	# reading user input and storing value in myString1 for second try.
	if [ $myString1 = $referenceString ]
	# checking if declared password is same as user input.
	then
	# condition to be executed if condition is true.
	echo ""
	echo "CONGRATULATIONS! You've entered correct password."
	echo ""
	else
	# condition to be executed if condition is false.

		echo "You've entered incorrect password try again"
		read myString2
		# reading user input and storing value in myString2 for third try.
		if [ $myString2 = $referenceString ]
		# checking if declared password is same as user input.
		then
		# condition to be executed if condition is true.
		echo ""
		echo "CONGRATULATIONS! You've entered correct password."
		echo ""
		else
		# condition to be executed if condition is false.

			echo "You've entered incorrect password try again"
			read myString3
			# reading user input and storing value in myString3 for fourth try.
			if [ $myString3 = $referenceString ]
			# checking if declared password is same as user input.
			then
			# condition to be executed if condition is true.
			echo ""
			echo "CONGRATULATIONS! You've entered correct password."
			echo ""
			else
			# condition to be executed if condition is false.

				echo "You've entered incorrect password try again"
				read myString4
				# reading user input and storing value in myString4 for fifth try.
				if [ $myString4 = $referenceString ]
				# checking if declared password is same as user input.
				then
				# condition to be executed if condition is true.
				echo ""
				echo "CONGRATULATIONS! You've entered correct password."
				echo ""
				else
				# condition to be executed if condition is false.
				echo "You've enetered incorrect password 5 times. please try again later"

fi
# closing if statement

fi
# closing if statement

fi
# closing if statement

fi
# closing if statement

fi
# closing if statement
