import UIKit

var str = "Hello, playground"

struct User {
    var name: String
    var age: Int
    init() {
        name = "Anonymous"
        age = 18
        print("a new user")
    }
}

let user1 = User()
print(user1)

struct Person {
    var name: String
    var age = 18
}
var p1 = Person(name: "dream", age: 20)
print(p1)

extension Person {
    init() {
        self.name = "hello"
    }
}

var p2 = Person()
print(p2)


struct Person1 {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var p3 = Person1(name: "hello")


struct FamilyTree {
    init() {
        print("hi family tree")
    }
}

struct Student {
    var name: String
    lazy var familyTrre = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var s = Student(name: "dream")
s.familyTrre

struct Student1 {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student1.classSize += 1
    }
}

var st1 = Student1(name: "dr")
var st2 = Student1(name: "eam")
print(st1, st2, Student1.classSize)


struct Student2 {
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func identity() -> String {
        print("my name is \(name)")
        return name
    }
}

var stu1 = Student2(name: "dream")
print(stu1.identity())
