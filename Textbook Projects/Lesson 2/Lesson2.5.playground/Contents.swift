import UIKit


/************** ARRAYS*****************/
let numbers = [4, 5, 6]
if numbers.contains(5) {
  print("There is a 5")
}

// ways to declare array
var myArr: [Int] = []
var myArr2: Array<Int> = []
var myArr3 = [Int]()


var myArray = [Int](repeating: 0, count: 10)
print(myArray)


let count = myArray.count
if myArray.isEmpty { print("Empty") }


var names = ["Amy"]
names.append("Joe")
names += ["Keith", "Jane"]
print(names)

names.insert("Bob", at: 0)
print(names)

var names2 = ["Amy", "Brad", "Chelsea", "Dan"]
print(names2)
let chelsea = names2.remove(at: 2)
print(names2)
let dan = names2.removeLast()
print(names2)
names2.removeAll()
print(names2)



let array1 = [1,2,3]
let array2 = [4,5,6]
let containerArray = [array1, array2] // [ [1,2,3], [4,5,6] ]
let firstArray = containerArray[0]  // [1,2,3]
let firstElement = containerArray[0][0] // 1


/************** DICTIONARIES*****************/

var scores = ["Richard": 500, "Luke": 400, "Cheryl": 800]

print(scores["Richard"]!)

// ways to initialize a dictionary
var myDictionary = [String: Int]()
var myDictionary2 = Dictionary<String, Int>()
var myDictionary3: [String: Int] = [:]



if let oldValue = scores.updateValue(100, forKey: "Richard") {
    print("Richard’s old value was \(oldValue)")
    print("Richard’s new value was \(scores["Richard"]!)")
}



var scores2 = ["Richard": 100, "Luke": 400, "Cheryl": 800]
scores2["Richard"] = nil // ["Luke": 400, “Cheryl": 800]

if let removedValue = scores2.removeValue(forKey: "Luke") {
  print("Luke’s score was \(removedValue) before he stopped playing")
}


let players = Array(scores.keys)
let points = Array(scores.values)

print("\(players) : \(points)")


if let lukesScore = scores["Luke"] {
  print(lukesScore)
}


