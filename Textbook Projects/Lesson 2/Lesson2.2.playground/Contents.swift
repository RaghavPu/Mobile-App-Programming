import UIKit

/*
 
 
 func functionName (parameters) -> ReturnType {
   // body of the function
 }
 
 
 */


func displayPi() {
  print("3.1415926535")
}
displayPi()


func triple(value: Int) {
  let result = value * 3
  print("If you multiply \(value) by 3, you’ll get \(result).")
}
triple(value: 2)


func multiply(firstNumber: Int, secondNumber: Int) {
  let result = firstNumber * secondNumber
  print("The result is \(result).")
}
multiply(firstNumber: 5, secondNumber: 3)


func sayHello(to person: String, and anotherPerson: String) {
  print("Hello \(person) and \(anotherPerson)")
}
sayHello(to: "Miles", and: "Riley")


func add(_ firstNumber: Int, to secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}
let total = add(14, to: 6)
print(total)



func display(teamName: String, score: Int = 0) {
  print("\(teamName): \(score)")
}

display(teamName: "Wombats", score: 100) // "Wombats: 100"
display(teamName: "Wombats") // "Wombats: 0"
