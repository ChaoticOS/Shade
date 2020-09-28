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
     \___ \| '_ \ / _\` |/ _\` |/ _ \\ $endc$enda         Shade : An Operating System Customisation Project$c$b
     ____) | | | | (_| | (_| |  __/    $endc$enda                 Licensed under$r$b chaOS © 2020$enda$c$b
    |_____/|_| |_|\__,_|\__,_|\___     $endc$enda         Github : https://github.com/ChaoticOS/Shade$c$b
                        Aqua Canary

   $r Warning: This is Incomplete Build 
    $endc$enda\n""";
}

function choose {
  options=("$@")
  unset choices
  menu() {
      showlogo
      echo "Avaliable options:\n"
      for i in ${!options[@]}; do
          [[ "${choices[i]}" ]] &&
          printf $g || printf $r
          printf " %10d. %-25s [%s]\n" $((i+1)) "${options[i]}" "${choices[i]:- }"
          printf $enda
      done
      if [[ "$msg" ]]; then echo "$msg"; fi
  }

  prompt="Check an option (again to uncheck, ENTER when done): "
  while menu && read -rp "$prompt" num && [[ "$num" ]]; do
      clear
      [[ "$num" != *[![:digit:]]* ]] &&
      (( num > 0 && num <= ${#options[@]} )) ||
      { msg="Invalid option: $num"; continue; }
      ((num--)); msg="${options[num]} was ${choices[num]:+un}checked"
      [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="X"
  done
}

function initial {
  showlogo

  printf "\n\n$y$b    Loading Script...$endc$enda"
  {
    sudo apt-get update
    sudo apt-get install tasksel lightdm -y
  } &> /dev/null &&
  { printf "\r$g$b    Script Loaded $endc$enda\n"; sleep 2 } ||
  { printf "\r$r$b    Error Occured, Exiting... $endc$enda\n"; sleep 3; exit; }
}

function browser {
  # Installation of Browsers
  echo "\n                    Browser Installer\n"
  options=("Chrome" "Firefox")
  choose "${options[@]}"

  for i in ${!options[@]}; do
    [[ "${choices[i]}" ]] &&
      case ${options[i]} in
        "Chrome")
          printf "\n$y$b    Installing Google Chrome $endc$enda"
          {
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo dpkg --install google-chrome-stable_current_amd64.deb
            sudo apt install --assume-yes --fix-broken
          } &> /dev/null &&
          { printf "\r$g$b    Google Chrome Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;
  
        "Firefox")
          printf "\n\n$y$b    Installing Firefox...$endc$enda"
          sudo apt install firefox -y &> /dev/null &&
          { printf "\r$g$b    Firefox Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        *)
          echo "Unknown"
          ;;
      esac
  done
}



function desktopenv {
  tasksel
}


function main {
  initial
  browser
  desktopenv
  clear
  showlogo
  printf "\n\n$y$b    Your Computer is now Configured$endc$enda"
  printf "\n\n$y$b    Reboot is Required, Press Y/n to continue : $endc$enda"
  while true; do
    read -r -n 1 -s yn
    case $yn in
        [Yy]* ) Rebooting; sleep 2; reboot;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
}

main