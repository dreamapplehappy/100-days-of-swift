import UIKit

var str = "Hello, playground"

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("Hello, your ID is \(thing.id)")
}

displayID(thing: User(id: "ID"))


protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {}

extension Int {
    func squared() -> Int {
        return self * self
    }
    var isEven: Bool {
        return self % 2 == 0
    }
}

let num = 9
num.isEven
num.squared()

extension String {
    mutating func append1(_ other: String) {
        self += other
    }
}

var str1 = "Hello"
str1.append1(", World")
print(str1)


let arr1 = ["A", "B", "C"]
let s1 = Set(["D", "E", "F"])

extension Collection {
    func summarize() {
        print("numbers is \(count)")
        
        for name in self {
            print(name)
        }
    }
}

arr1.summarize()
s1.summarize()

let arr2 = [4, 2, 8]
let s2 = [4, 5, 6]
let d2 = [1: 6, 2: 2, 3: 10]

arr2.allSatisfy {
    $0 % 2 == 0
}

s2.allSatisfy {
    $0 % 2 == 0
}

d2.allSatisfy {
    $0.value % 2 == 0
}

protocol Politician {
    var isDirty: Bool { get set }
    func takeBribe()
}
extension Politician {
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}

struct ABC: Politician {
    var isDirty: Bool
}

var abc = ABC(isDirty: true)
abc.takeBribe()
