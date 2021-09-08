import UIKit

struct Person {
    var name: String

    func sayHello() {
        print("Hello, there! My name is \(name)!")
    }
    
}

let firstPerson = Person(name: "Jasmine")
firstPerson.sayHello()



struct Odometer {
  var count: Int = 0
}

let odometer = Odometer()
print(odometer.count)

let odometer2 = Odometer(count: 27000)
print(odometer2.count)


struct Temperature {
  var celsius: Double

  init(celsius: Double) {
    self.celsius = celsius
  }

  init(fahrenheit: Double) {
    celsius = (fahrenheit - 32) / 1.8
  }
    
  init(kelvin: Double) {
    celsius = kelvin - 273.15
  }
}

let currentTemperature = Temperature(celsius: 18.5)
let boiling = Temperature(fahrenheit: 212.0)
let freezing = Temperature(kelvin: 273.15)


print(currentTemperature.celsius)
print(boiling.celsius)
print(freezing.celsius)




struct Odometer2 {
  var count: Int = 0 // Assigns a default value to the `count` property
    
  mutating func increment() {
    count += 1
  }

  mutating func increment(by amount: Int) {
    count += amount
  }

  mutating func reset() {
    count = 0
  }
}

var odometer3 = Odometer2() // odometer.count defaults to 0
odometer3.increment() // odometer.count is incremented to 1
odometer3.increment(by: 15) // odometer.count is incremented to 16
odometer3.reset() // odometer.count is reset to 0





struct Temperature2 {
  var celsius: Double

  var fahrenheit: Double {
    celsius * 1.8 + 32
  }

  var kelvin: Double {
    celsius + 273.15
  }
}


let currentTemperature2 = Temperature2(celsius: 0.0)
print(currentTemperature2.fahrenheit)
print(currentTemperature2.kelvin)










struct StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

var stepCounter = StepCounter()
stepCounter.totalSteps = 40
stepCounter.totalSteps = 100





struct Temperature4 {
  static var boilingPoint = 100
}


let smallerNumber = Double.minimum(100.0, -1000.0)



// NO REFERENCE SEMANTICS FOR STRUCTS
//var someSize = Size(width: 250, height: 1000)
//var anotherSize = someSize
//
//someSize.width = 500
//
//print(someSize.width)
//print(anotherSize.width)


// SHADOWING
struct Temperature5 {
  var celsius: Double

  init(celsius: Double) {
    self.celsius = celsius
  }
}
