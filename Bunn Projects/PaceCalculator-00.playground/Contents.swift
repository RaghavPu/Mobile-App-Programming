import UIKit

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

