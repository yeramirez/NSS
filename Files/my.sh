#!/bin/bash
# This is a basic bash script

greeting="hello"
echo $greeting, world \(planet\)!

a=Hello
b="Good Morning"
c=16

echo $a
echo $b
echo $c

echo "$b! I have $c apples."

echo

d=$(pwd)
echo $d

echo

a=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "The ping was $a"

echo

d=2
e=$((d+2))
echo 'e plus 2 = '$e

((e++))
echo 'e plus 1 = '$e

((e--))
echo 'e minus 1 = '$e

((e+=5))
echo 'e plus 5 = '$e

((e*=3))
echo 'e times 3 = '$e

((e/=3))
echo 'e divided by 3 = '$e

((e-=5))
echo 'e minus 5 = '$e

echo

f=$((1/3))
echo $f
g=$(echo 1/3 | bc -l)
echo $g

echo

[[ "cat" == "cat" ]]
echo $?

[[ "cat" = "dog" ]]
echo $?

[[ 20 -gt 100 ]]
echo $?

a=""
b="cat"
[[ -z $a && -n $b ]]
echo $?

echo

y="hello"
z="world"
w=$y$z
echo $w
echo ${#y}
echo ${#z}
echo ${#w}
x=${w:3:4}
echo $x
echo ${w: -4}

fruit="apple banana banana cherry"
echo $fruit
echo ${fruit/banana/durian} #Replaces the first instance of banana
echo ${fruit//banana/durian} #Replaces all instances of banana
echo
echo ${fruit/#apple/durian} #Will replace if it is in the very beginning
echo ${fruit/#banana/durian} #Will not work b/c it is not the first item
echo ${fruit/%cherry/durian} #Will replace the last item

echo ${fruit/%banana/durian} #Will not replace b/c it is not the last item
echo ${fruit/c*/durian}

echo

flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; tput setaf 1)
none=$(tput sgr0)
echo -e $flashred"ERROR: " $none$red"Something went wrong."$none

echo

printf "Name\t%s\nID:\t%04d\n" "Scott" "12"
echo
today=$(date "+ %m-%d-%Y")
time=$(date "+ %H:%M:%S")
printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$d"

a=()
b=("apple" "banana" "cherry") #Notice it does not use commas
echo ${b[2]}
b[5]="kiwi"
b+=("mango")
echo ${b[@]}
echo ${b[@]: -1}

echo

declare -a myarray
myarray[color]=blue
myarray["hello"]= "HQ West"
echo ${myarray["hello"]} is ${myarray[color]}

echo
echo

freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
greentext="\033[32m"
bold="\033[1m"
normal="\033[0m"
logdate=$(date "+ %Y%m%d")
logfile="$logdate"_report.log

echo -e $bold"Quick system report for "$greentext"$HOSTNAME"$normal
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tBash Version:\t%s\n" $BASH_VERSION
printf "\tFree Space:\t%s\n" $freespace
printf "\tFiles in dir:\t%s\n" $(ls | wc -l)
printf "\tGenerated on:\t%s\n" $(date "+ %m/%d/%y") #US date format

echo

r=5
if [ $r -gt 4 ]; then
	echo $r is greater than 4!
else
	echo $r is not greater than 4!
fi

echo

t="This is my #1 string"
if [[ $t =~ [0-9]+ ]]; then
	echo "There are numbers in the string: $t"
else
	echo "There are no numbers in the string: $t"
fi

echo

i=0
while [ $i -le 10 ]; do
	echo i:$i
	((i+=1))
done

echo

j=0
until [ $j -ge 10 ]; do
	echo j:$j
	((j+=1))
done

echo

for i in 1 2 3
do
	echo $i
done

echo

for i in {1..100}
do
	echo $i
done

echo

for (( i=1; i<=10; i++ ))
do
	echo $i
done

echo

arr=("apple" "banana" "cherry")
for i in ${arr[@]}
do
	echo $i
done

echo

declare -a arr
arr["name"]="Scott"
arr["id"]="1234"
for i in "${!arr[$i]}"
do
	echo "$i: ${arr[$i]}"
done

echo

a="dog"
case $a in
	cat) echo "Feline";;
	dog|puppy) echo "Canine";;
	*) echo "No match!";;
esac

echo

function greet {
        echo "Hi $1!"
}

echo "And now, a greeting!"
greet Scott

echo

function numberthings {
        i=1
        for f in $@; do
                echo $i: $f
                ((i+=1))
        done
}

numberthings $(ls)
numberthings pine birch maple spruce

echo

for i in $@
do
        echo $i
done

echo "There were $# arguments."

while getopts u:p: option; do
        case $option in
                u) user=$OPTARG;;
                p) pass=$OPTARG;;
        esac
done

echo "User: $user / Pass: $pass"

echo "What is your name?"
read name

echo "What is your password"
read -s pass

read -p "What's your favorite animal?" animal

echo name: $name, pass: $pass, animal: $animal

echo

select animal in "cat" "dog" "bird" "fish"
do
        echo "You selected $animal!"
        break
done

echo

select option in "cat" "dog" "quit"
do
        case $option in
                cat) echo "Cats like to sleep.";;
                dog) echo "Dogs like to play catch.";;
                quit) break;;
                *) echo "I'm not sure what that is."
        esac
done

echo

rand=$RANDOM
secret=${rand:0:1}

function game {
        read -p "Guess a random one-digit number!" guess
        while [[ $guess != $secret ]]; do
                read -p "Nope, try again!" guess
        done
        echo "Good job, $secret is it! You're great at guessing!"
}

function generate {
        echo "A random number is: $rand"
        echo -e "Hint: type \033[1m$0 game\033[0m for a fun diversion!"
}

if [[ $1 =~ game|Game|GAME ]]; then
        game
else
        generate
fi
