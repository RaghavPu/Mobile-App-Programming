import UIKit

let name = "John"
print(name)
// CANNOT REASSIGN CONSTANT --> name = "James"

var age = 29
age = 30
print(age)


let defaultScore = 100
var playerOneScore = defaultScore
var playerTwoScore = defaultScore

print(playerOneScore)
print(playerTwoScore)

playerOneScore = 200
print(playerOneScore)


/*
 Data Types:
 Integer: 4
 Double: 13.45
 Boolean: true false
 String: "Hello, World"
 */

struct Person {
    let firstName: String
    let lastName: String
    
    func sayHello() {
        print("Hello there! My name is \(firstName) \(lastName)")
    }
}


let aPerson = Person(firstName: "Jacob", lastName: "Edwards")
let anotherPerson = Person(firstName: "Candance", lastName: "Salinas")


aPerson.sayHello()
anotherPerson.sayHello()


