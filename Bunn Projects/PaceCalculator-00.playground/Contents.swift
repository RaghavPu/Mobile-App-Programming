import UIKit

//******** PACE CALCULATOR *******//

// Step 1
let raceDistance: Double = 5
var timeElapsed: Double = 6.25
var distTravelled: Double = 1


// Step 2
let pace = distTravelled / timeElapsed
let remainingTime = (raceDistance - distTravelled) / pace
let totalTime = remainingTime + timeElapsed;

// Step 3
print("At the current pace, it will take an additional \(remainingTime) minutes to finish the race.")
print("At the current pace, the total time will be \(totalTime) minutes for the \(raceDistance) kilometers.")
print("\n")



//******** GPA PLANNING CALCULATOR *******//
var currentGPA = 2.8
let targetGPA = 3.0
var currentCredits = 25
let additionalCredits = 15

var currTotal = currentGPA * 25
var targetTotal = Double(additionalCredits + currentCredits) * targetGPA
var remainingTotal = targetTotal - currTotal
var gpaForAdditionalCredits = remainingTotal / Double(additionalCredits)

print("To achieve a target GPA of \(targetGPA), the GPA for the next \(additionalCredits) credits needs to be \(gpaForAdditionalCredits) or higher.")
print("\n")




//******** RESTAURANT CHECK CALCULATOR *******//
var subTotal: Double = 150
var serviceDescription = "excellent"

var discount: Double
if subTotal <= 50 {
    discount = 10
} else if subTotal < 100 {
    discount = 20
} else {
    discount = subTotal * 0.3
}

var tipPercentage: Double
if serviceDescription == "bad" {
    tipPercentage = 0
} else if serviceDescription == "so-so" {
    tipPercentage = 0.1
} else if serviceDescription == "good" {
    tipPercentage = 0.15
} else if serviceDescription == "excellent" {
    tipPercentage = 0.2
} else if serviceDescription == "superior" {
    tipPercentage = 0.25
} else {
    tipPercentage = 0
}

var total = (subTotal - discount) * (1 + tipPercentage)

print("Subtotal: \(subTotal)")
print("Discount: \(discount)")
print("Tip: \(tipPercentage * 100)%")
print("Your order total is \(total).")

