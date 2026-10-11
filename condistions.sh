#!/bin/bash

number1=$1

if [ $number1 -gt 10 ]
then
    echo "given number  $number1 is greater than 10"
else
    echo "given number  $number1 is lesser than 10"
fi