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



//******* TYPE SAFETY *********//
let playerName = "Julian"
var playerScore = 1000
var gameOver = false

// Type Safety feature will not allow you to change types after declaration
//playerScore = playerName

var wholeNumber = 30
var numberWithDecimals = 17.5

// Type Safety also applies between double values and integer values
//wholeNumber = numberWithDecimals


//**** NUMBER TRICK *****//
var largeUglyNumber = 1000000000
var largePrettyNumber = 1_000_000_000



//******* TYPE INFERENCE *******//
let cityName = "San Francisco"
// “San Francisco” is obviously a `String`, so the compiler automatically assigns the type of cityName to a `String`.
let cityName2: String = "San Francisco"

let pi = 3.1415927
// 3.1415927 is a number with decimal points, so the compiler automatically assigns the type `pi` to a `Double`.
let pi2: Double = 3.1415927

let number: Double = 3
print(number)


//****** WAYS TO USE TYPE *******//
let firstName: String
firstName = "Layne"

let middleInitial: Character = "R"

struct Car {
    var make: String
    var model: String
    var year: Int
}
let myCar: Car


/*
 You cannot declare a variable but not initialize it, if it does not have a type
 For example: var x   --> doesn't work |||||| var x: Int    --> proper way to do it
 
 You cannot print a variable that is initialized
 */

