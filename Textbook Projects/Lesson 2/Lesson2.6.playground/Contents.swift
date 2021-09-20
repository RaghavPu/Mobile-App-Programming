import UIKit

for index in 1...5 {
  print("This is number \(index)")
}

// ... closed range operator
// ..< half-open range operator


for _ in 1...3 {
  print("Hello!")
}


let names = ["Joseph", "Cathy", "Winston"]
for name in names {
  print("Hello \(name)")
}


for letter in "ABCD" {
  print("The letter is \(letter)")
}


for (index, letter) in "ABCD".enumerated() {
  print("\(index): \(letter)")
}


let animals = ["Lion", "Tiger", "Bear"]
for index in 0..<animals.count {
  print("\(index): \(animals[index])")
}


let vehicles = ["unicycle": 1, "bicycle": 2, "tricycle": 3,
"quad bike": 4]
for (vehicleName, wheelCount) in vehicles {
  print("A \(vehicleName) has \(wheelCount) wheels")
}


var numberOfLives = 3

while numberOfLives > 0 {
  print("I still have \(numberOfLives) lives.")
    numberOfLives -= 1
}


for counter in -3...3 {
  print(counter)
  if counter == 0 {
    break
  }
}

//for person in people {
//  if person.age < 18 {
//    continue
//  }
//
//  sendEmail(to: person)
//}
