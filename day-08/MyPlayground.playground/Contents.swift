import UIKit

var str = "Hello, playground"

struct User {
    var name: String
    var age: Int
    var isAdult: Bool {
        return age >= 18 ? true : false
    }
    func getUserName() -> String {
        return name
    }
    mutating func changeUserName(to newName: String) {
        name = newName
    }
}

var dreamapple = User(name: "dreamapple", age: 22)
print(dreamapple)
print(dreamapple.isAdult)
print(dreamapple.getUserName())
dreamapple.changeUserName(to: "happy")
print(dreamapple.name)


struct Progress {
    var task: String
    var amount: Int {
        willSet {
            print("before set amount, amount is \(amount)")
        }
        didSet {
            print("task \(task) is now \(amount)% complete")
        }
    }
}
var progressA = Progress(task: "learn Swift", amount: 0)
progressA.amount = 10
progressA.amount = 80


let str = "I am dreamapple, hello world!"
print(str.count)
print(str.hasPrefix("I"))
print(str.uppercased())
print(str)
print(str.sorted())

var names = ["张三", "李四", "王五"]
print(names)
print(names.count)
names.append("hello")
print(names.firstIndex(of: "hello"))
print(names.remove(at: 0))
print(names)
print(names.sorted())

