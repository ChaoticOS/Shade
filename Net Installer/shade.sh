#! /bin/bash

# Colors
b='\033[1m'
u='\033[4m'
l='\033[8m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'

function showlogo {
    clear
    printf """$c$b
    chaOS Presents
      _____ _               _
     / ____| |             | |
    | (___ | |__   __ _  __| | ___
     \___ \| '_ \ / _\` |/ _\` |/ _ \\ $endc$enda         Shade : A Operating System Customisation Project$c$b
     ____) | | | | (_| | (_| |  __/    $endc$enda                Licensed under$r$b chaOS © 2020$enda$c$b
    |_____/|_| |_|\__,_|\__,_|\___     $endc$enda        Github : https://github.com/ChaoticOS/Shade$c$b
                              Aqua

    $endc$enda\n""";
}

showlogo
