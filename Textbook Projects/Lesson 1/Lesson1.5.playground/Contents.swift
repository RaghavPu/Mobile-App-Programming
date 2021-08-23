import UIKit

//***** LOGICAL AND COMPARISON OPERATORS *******/
/*
 == | Comparison | two items must be equal
 != | Comparison | two items must not be equal
 >  | Comparison | left value greater
 >= | Comparison | left value greater than or equal to
 <  | Comparison | right value greater
 <= | Comparison | right value greater than or equal to
 && | Logical    | AND (both statements have to be true
 || | Logical    | OR (only one of the statements have to be true
 !  | NOT        | NOT (returns the opposite of the conditional statement
 */

let temperature = 10
if temperature >= 100 {
  print("The water is boiling.")
} else {
    print("The water is not boiling.")
}


var finishPosition = 2

if finishPosition == 1 {
  print("Congratulations, you won the gold medal!")
} else if finishPosition == 2 {
  print("You came in second place, you won a silver medal!")
} else {
  print("You did not win a gold or silver medal.")
}


//***** BOOLEAN VALUES ******//
let number = 1000
let isSmallNumber = number < 10
print(isSmallNumber)

let speedLimit = 65
let currentSpeed = 72
let isSpeeding = currentSpeed > speedLimit
print(isSpeeding)



// NOT operator
var isSnowing = false

if !isSnowing {
    print("It isn't snowing.")
}


// AND operator
let temperature2 = 70

if temperature2 >= 65 && temperature2 <= 75 {
  print("The temperature is just right.")
} else if temperature2 < 65 {
  print("It is too cold.")
} else {
  print("It is too hot.")
}


// OR operator
var isPluggedIn = false
var hasBatteryPower = true

if isPluggedIn || hasBatteryPower {
    print("You can use your laptop.")
} else {
  print("😱")
}



//****** SWITCH STATEMENTS *****/
let numberOfWheels = 2
switch numberOfWheels {
case 0:
    print("Missing something?")
case 1:
    print("Unicycle")
case 2:
    print("Bicycle")
case 3:
    print("Tricycle")
case 4:
    print("Quadcycle")
default:
    print("That s a lot of wheels!")
}


// Compounding the switch case
let character = "z"

switch character {
case "a", "e", "i", "o", "u":
    print("This character is a vowel.")
default:
    print("This character is a consonant.")
}

// Ranges for switch cases
let distance = 20
switch distance {
case 0...9:
    print("Your destination is close.")
case 10...99:
    print("Your destination is a medium distance from here.")
case 100...999:
    print("Your destination is far from here.")
default:
    print("Are you sure you want to travel this far?")
}



//******* TERNARY OPERATOR *****/
var largest: Int

let a = 15
let b = 4

// Method 1
if a > b {
  largest = a
} else {
  largest = b
}

// Method 2
largest = a > b ? a : b

// Method 3
largest = max(a, b)
