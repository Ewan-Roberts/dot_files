
//day of the week
while true; do tput clear; date +%A | figlet ; sleep 9999; done

while true; do tput clear; date +"%H : %M : %S" | figlet ; sleep 1; done

// just date
 while true; do tput clear; date +%F | figlet ; sleep 9999; done

// just date but like the day Wed or whatever
while true; do tput clear; date +%a%t%t%t%d-%m | figlet ; sleep 9999; done

//just time
 while true; do tput clear; date +"%H : %M" | figlet ; sleep 60; done

// get weather
 while true; do curl wttr.in/London; sleep 9999;done

// get detailed weather
while true; do curl wttr.in/London?format=v2; sleep 9999;done
