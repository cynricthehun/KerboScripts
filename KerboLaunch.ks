// Author: Joey Meyer
// Date: 3/23/2017
PRINT "=========================================".
PRINT "THIS IS THE FIRST SCRIPT I WROTE IN kOS.".
PRINT "=========================================".

clearscreen.

LOCK throttle to 1.0.
LOCK steering to up.
LOCK SAS to on.

Print "Checking Ship Status".
PRINT "There is " + SHIP:LIQUIDFUEL + " Liquid Fuel on the ship.".
PRINT "There is " + SHIP:OXIDIZER + " Oxygen on the ship.".
PRINT "There is " + SHIP:ELECTRICCHARGE + " Electricrity on the ship.".
PRINT "There is " + SHIP:MONOPROPELLANT + " Monopropellant on the ship.".
PRINT "There is " + SHIP:INTAKEAIR + " Intake Air on the ship.".
PRINT "There is " + SHIP:SOLIDFUEL + " Solid Fuel on the ship.".

Print "Count Down to Launch.".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
  print "..." + countdown.
  wait 1.
  if countdown <= 1 {
    print "Beginning " + stage.
    STAGE.
  }
}

UNTIL SHIP:MAXTHRUST > 0 {
    WAIT 0.5. // pause half a second between stage attempts.
    if ship:LIQUIDFUEL < 0.1 {
      PRINT "Starting" + Stage.
      STAGE.
    }
}

WAIT UNTIL SHIP:ALTITUDE > 30000.
SET THROTTLE TO 0.
WAIT UNTIL FALSE.
