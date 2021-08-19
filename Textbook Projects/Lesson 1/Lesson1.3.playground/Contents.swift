import UIKit

// = operator
// assignment operator
let favoritePerson = "Sister"

// reassignment operator
var shoeSize = 8
shoeSize = 9


//******* ARITHMETIC OPERATORS *******/
// +. -. *, /, %
var opponentScore = 3 * 8
var myScore = 100/4

var totalScore = opponentScore + myScore
print(totalScore)

myScore += 3 // myScore = myScore + 3


let totalDistance = 3.9
var distanceTraveled = 1.2
var remainingDistance = totalDistance - distanceTraveled
print(remainingDistance)

// Int Division
let x = 51
let y = 4
let z = x/y
print(z)


let x2: Double = 51
let y2: Double = 4
let z2 = x2 / y2
print(z2)

// Compound Assignment
var score = 10
score += 3
score -= 5
score *= 2
score /= 2

let dividend = 10
let divisor = 3
let quotient = dividend / divisor  // quotient has a value of 3
let remainder = dividend % divisor // remainder has a value of 1

/*
 Order of operations work the same as they do in normal math
 x = 2, y = 3, z = 5
 x + y * z = 17
 (x + y) * z = 25
 */


//**** TYPE CASTING ****/
let x3 = 3
let y3 = 0.1415927
let pi3 = Double(x3) + y3
