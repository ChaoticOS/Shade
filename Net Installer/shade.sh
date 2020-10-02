#! /bin/bash
# Shade Aqua v0.2 Build 20 Beta [Net Installer]

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
cl='\e[K'

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
                          Aqua Beta    $endc$enda
                                 
                            Aqua Version 0.2 Build 20

   $b$r Warning: Currently in Development 
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
      [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="X"
  done
}

function initial {
  showlogo
  printf "\n\n$y$b    Loading Script... $endc$enda"
  sudo apt-get update &> /dev/null &&
  { printf "\r$cl$g$b    Script Loaded $endc$enda\n"; sleep 2 ;} ||
  { printf "\r$cl$r$b    Error Occured, Exiting... $endc$enda\n"; sleep 3; exit; }
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
          printf "\n$y$b    Installing Google Chrome... $endc$enda"
          {
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo dpkg --install google-chrome-stable_current_amd64.deb
            sudo apt install --assume-yes --fix-broken
          } &> /dev/null &&
          { printf "\r$cl$g$b    Google Chrome Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;
  
        "Firefox")
          printf "\n\n$y$b    Installing Firefox... $endc$enda"
          {
            sudo apt install firefox -y
          } &> /dev/null &&
          { printf "\r$cl$g$b    Firefox Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        *)
          echo "Unknown Browser"
          ;;
      esac
  done
}

function terminal {
  # Installation of Terminal
  echo "\n                    Terminal Installer\n"
  options=("Gnome Terminal" "Terminator" "Xfce Terminal" "xTerm")
  choose "${options[@]}"

  for i in ${!options[@]}; do
    [[ "${choices[i]}" ]] &&
      case ${options[i]} in
        "Gnome Terminal")
          printf "\n\n$y$b    Installing Gnome... $endc$enda"
          {
            sudo apt install gnome-terminal -y
          } &> /dev/null &&
          { printf "\r$cl$g$b    Gnome Terminal Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        "Terminator")
          printf "\n\n$y$b    Installing Terminator... $endc$enda"
          {
            sudo apt install terminator -y
          } &> /dev/null &&
          { printf "\r$cl$g$b    Terminator Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        "Xfce Terminal")
          printf "\n\n$y$b    Installing Terminator... $endc$enda"
          {
            sudo apt install xfce4-terminal
          } &> /dev/null &&
          { printf "\r$cl$g$b    Terminator Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        "xTerm")
          printf "\n\n$y$b    Installing xTerm... $endc$enda"
          {
            sudo apt install xterm -y
          } &> /dev/null &&
          { printf "\r$cl$g$b    xTerm Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        *)
          echo "Unknown Terminal"
          ;;
      esac
  done
}

function texteditor {
  # Installation of Text Editors
  echo "\n                    Text Editor Installer\n"
  options=("Atom" "Brackets" "Leafpad" "Notepadqq" "Sublime Text")
  choose "${options[@]}"

  for i in ${!options[@]}; do
    [[ "${choices[i]}" ]] &&
      case ${options[i]} in
        "Atom")
          printf "\n$y$b    Installing Atom... $endc$enda"
          {
            sudo snap install atom --classic
          } &> /dev/null &&
          { printf "\r$cl$g$b    Atom Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;
  
        "Brackets")
          printf "\n\n$y$b    Installing Brackets... $endc$enda"
          {
            sudo snap install brackets
          } &> /dev/null &&
          { printf "\r$cl$g$b    Brackets Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        "Leafpad")
          printf "\n\n$y$b    Installing Leafpad... $endc$enda"
          {
             sudo apt-get install leafpad -y
          } &> /dev/null &&
          { printf "\r$cl$g$b    Leafpad Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        "Notepadqq")
          printf "\n\n$y$b    Installing Notepadqq... $endc$enda"
          {
            sudo apt-get install notepadqq
          } &> /dev/null &&
          { printf "\r$cl$g$b    Notepadqq Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        "Sublime Text")
          printf "\n\n$y$b    Installing Sublime Text... $endc$enda"
          {
            sudo snap install sublime-text --classic# Installation Command
          } &> /dev/null &&
          { printf "\r$cl$g$b    Sublime Text Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;
        *)
          echo "Unknown Browser"
          ;;
      esac
  done
}

function dmanager {
  # Installation of Display Manager
  echo "\n                    Display Manager Installer\n"
  options=("gdm3" "lightdm")
  choose "${options[@]}"

  for i in ${!options[@]}; do
    [[ "${choices[i]}" ]] &&
      case ${options[i]} in
        "gdm3")
          printf "\n$y$b    Installing Gnome Display Manager... $endc$enda"
          {
            sudo DEBIAN_FRONTEND=noninteractive apt-get install gdm3 -y
          } &> /dev/null &&
          { printf "\r$cl$g$b    Display Manager Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;
  
        "lightdm")
          printf "\n\n$y$b    Installing lightdm... $endc$enda"
          {
            sudo DEBIAN_FRONTEND=noninteractive apt install lightdm -y 
          } &> /dev/null &&
          { printf "\r$cl$g$b    lightdm Installed $endc$enda\n"; sleep 2;} ||
          { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
          ;;

        *)
          echo "Unknown Display Manager"
          ;;
      esac
  done
  printf "\n$y$b    Please Configure Display Manager $endc$enda"
  sleep 3
  sudo dpkg-reconfigure gdm3

}

function desktopenv {
  # Installation of Desktop Environment
  clear
  showlogo
  printf "\n\n$y$b    Initializing Tasksel... $endc$enda"
  {
    sudo apt-get install tasksel -y
  } &> /dev/null &&
  { printf "\r$cl$g$b    Tasksel Initialized $endc$enda\n"; sleep 2;} ||
  { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
  sudo tasksel
  printf "\n\n$y$b    Updating... $endc$enda"
  {
    sudo apt-get update
    sudo apt-get install snapd -y
  } &> /dev/null &&
  { printf "\r$cl$g$b    Updated $endc$enda\n"; sleep 2;} ||
  { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2; exit; }
}

function main {
  initial
  dmanager
  desktopenv
  browser
  terminal
  texteditor
  clear
  showlogo
  printf "\n\n$y$b    Now Configuring your computer $endc$enda"
  {
    sudo apt-get install gnome-software -y
    sudo apt-get install open-vm-tools -y
  } &> /dev/null &&
  { printf "\r$cl$g$b    Your Computer is now Configure $endc$enda\n"; sleep 2;} ||
  { printf "\r$cl$r$b    Error Occured, Abort $endc$enda\n"; sleep 2;}
  printf "\n\n$c$b    Thanks for using Shade Aqua [Net Installer] from chaOS$endc$enda"
  printf "\n\n$y$b    Rebooting$endcenda"
  sleep 5
}

main