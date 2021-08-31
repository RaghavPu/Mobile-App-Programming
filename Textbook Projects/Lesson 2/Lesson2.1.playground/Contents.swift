import UIKit

var str = "Hello, playground"


/*
 Double quote: \"
 Single quote: \’
 Backslash: \\
 Tab: \t
 Newline (go to the next line—like pressing Return): \n
 */


var myString = ""
if myString.isEmpty {
    print("The string is empty")
}


let string1 = "Hello"
let string2 = ", world!"
let myString2 = string1 + string2


let name = "Rick"
let age = 30
print("\(name) is \(age) years old")


let month = "January"
let otherMonth = "January"
let lowercaseMonth = "january"
if month == otherMonth {
  print("They are the same")
}

if month != lowercaseMonth {
  print("They are not the same.")
}

let greeting = "Hello, world!"
print(greeting.hasPrefix("Hello"))
print(greeting.hasSuffix("world!"))
print(greeting.hasSuffix("World!"))


let greeting2 = "Hi Rick, my name is Amy."
if greeting2.contains("my name is") {
  print("Making an introduction")
}


let newPassword = "1234"

if newPassword.count < 8 {
    print("This password is too short. Passwords should have at least eight characters.")
}

