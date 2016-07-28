#!/bin/bash
ls -l | awk '{

#print length($1)

split ($1, chars, "")

permissions[1] = 4;
permissions[2] = 2;
permissions[3] = 1;
pvalues[1] = 0;
pvalues[2] = 0;
pvalues[3] = 0;

if(chars[2] == "r") {pvalues[1] += permissions[1]}
if(chars[3] == "w") {pvalues[1] += permissions[2]}
if(chars[4] == "x") {pvalues[1] += permissions[3]}
if(chars[5] == "r") {pvalues[2] += permissions[1]}
if(chars[6] == "w") {pvalues[2] += permissions[2]}
if(chars[7] == "x") {pvalues[2] += permissions[3]}
if(chars[8] == "r") {pvalues[3] += permissions[1]}
if(chars[9] == "w") {pvalues[3] += permissions[2]}
if(chars[10] == "x") {pvalues[3] += permissions[3]}

print pvalues[1]pvalues[2]pvalues[3] " Owner:" $3 " File-Size: " $5 " Date " $6  " " $7 " " $8 ;
}'

ls -l | awk 'END { print "Number of Directories: " NR }'

ls -l | awk '{ if ($7 % 2 == 0) print $6 " " $7 " " $9" is an even dated file"; else print $6 " "  $7 " " $9 " is an odd dated file" }'

ls -l | awk '{ if ($7 == 4) print $9 " is the first file!"; else print $9 " was not the first file" }'


