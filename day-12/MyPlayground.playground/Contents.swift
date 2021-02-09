import UIKit

var str = "Hello, playground"

var age: Int? = nil
age = 20
print(age ?? 0)

var name: String? = nil
if let yourName = name {
    print("name count is \(yourName.count)")
} else {
    print("...")
}

var weatherForecast: String? = "sunny"
if let forecast = weatherForecast {
    print("The forecast is \(forecast).")
} else {
    print("No forecast available.")
}

let currentDestination: String? = nil
if let destination = currentDestination {
    print("We're walking to \(destination).")
} else {
    print("We're just wandering.")
}

func greet(_ name: String?) {
    guard let yourName = name else {
        print("your name is nil")
        return
    }
    print("hello, \(yourName)")
}

greet("nil")

var str1 = "5"
var num1 = Int(str1)
print(num1!)


var num2 = Int("5")
var num3 = num2 ?? 10
print(num3)


var arr1 = ["a", "b", "c"]
arr1.first?.uppercased()

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

if let _ = try? checkPassword("password") {
    print("OK")
} else {
    print("NOT OK")
}

try! checkPassword("password0")
print("OK")


struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let p1 = Person(id: "abc")
print(p1 ?? 0)

class Animal {}
class Fish: Animal {}
class Dog: Animal {
    func makeNosie() {
        print("Woof!")
    }
}

let animals = [Fish(), Dog(), Fish(), Dog()]
for animal in animals {
    if let dog = animal as? Dog {
        dog.makeNosie()
    }
}
