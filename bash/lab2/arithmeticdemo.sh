#!/bin/bash
#
#Create a script to prompt the user for 2 numbers. Perform each of the 5 arithmetic operations on the numbers, and display the results in a user-friendly way. Name it arithmeticdemo.sh. 

echo "     Basic Arithmetic Calculator"
echo "--------------------------------------"
echo ""

echo -n "Please enter in a number then press [ENTER]: "
read number1
echo ""
echo -n "Please enter in a 2nd number then press [ENTER]: "
read number2
echo ""
echo -n "Addition:       "
echo $number1"+"$number2" = "$((number1+number2))

echo -n "Subtraction:    "
echo $number1"-"$number2" = "$((number1-number2))

echo -n "Multiplication: "
echo $number1"*"$number2" = "$((number1*number2))

echo -n "Devision:       "
echo $number1"/"$number2" = "$((number1/number2))

echo -n "Percentage:     "
echo $number1"%"$number2" = "$((number1%number2))


