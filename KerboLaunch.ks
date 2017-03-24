// Author: Joey Meyer
// Date: 3/23/2017
PRINT "=========================================".
PRINT "THIS IS THE FIRST SCRIPT I WROTE IN kOS.".
PRINT "=========================================".

clearscreen.

LOCK throttle to 1.0.
LOCK steering to up.

Print "Count Down to Launch.".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
  print "..." + countdown.
  wait 1.
}

UNTIL SHIP:MAXTHRUST > 0 {
    WAIT 0.5. // pause half a second between stage attempts.
    PRINT "Stage activated.".
    STAGE. // same as hitting the spacebar.
}

WAIT UNTIL SHIP:ALTITUDE > 30000.
