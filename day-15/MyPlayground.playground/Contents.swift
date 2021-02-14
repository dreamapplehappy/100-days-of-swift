import UIKit

var str = "Hello, playground"

struct Person {
    var name: String
    var age: Int {
        willSet {
            print("willSet \(age) -> \(newValue)")
        }
        
        didSet {
            print("didSet \(oldValue) -> \(age)")
        }
    }
    
    var period: Int {
        get {
            return age / 12
        }
        set {
            age *= 12
        }
    }
    
    func describe() {
        print("My name is \(name) and my age is \(age)")
    }
}

var p1 = Person(name: "dream", age: 20)
var p2 = Person(name: "apple", age: 22)
p1.describe()
p2.describe()
p1.age = 25
print(p1.period)
p1.period = 10

class Student {
    fileprivate var ID: String
    
    init(ID: String) {
        self.ID = ID
    }
}

var s1 = Student(ID: "xxx")
print(s1.ID)
