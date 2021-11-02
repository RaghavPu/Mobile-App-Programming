/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var coll: [Any] = [5.5, "Hello", 3, true]
print(coll)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in coll {
    if let i = item as? Int {
        print("The integer has a value of \(i)")
    } else if let i = item as? Double {
        print("The Double has a value of \(i)")
    } else if let i = item as? String {
        print("The String has a value of \(i)")
    } else if let i = item as? Bool {
        print("The Boolean has a value of \(i)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dictionary: [String: Any] = ["First": 5.5, "Second": "3", "Third": 3, "Fourth": true]
print(dictionary)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (key, value) in dictionary {
    if let i = value as? Int {
        total += Double(i)
    } else if let i = value as? String {
        total += 1
    } else if let i = value as? Bool {
        if i {
            total += 2
        } else {
            total -= 3
        }
    }
}

print(total)

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (key, value) in dictionary {
    if let i = value as? Int {
        total2 += Double(i)
    } else if let i = value as? String {
        total2 += Double(i) ?? 0
    } else if let i = value as? Double {
        total2 += i
    }
}

print(total2)

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
