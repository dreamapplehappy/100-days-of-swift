import UIKit

var str = "Hello, playground"

func printHelp() {
    let msg = """
Welcome to MyApp!

Run this app
"""
    print(msg)
}

printHelp()

func square(number: Int) {
    print(number * number)
}

square(number: 8)

func square1(number: Int) -> Int {
    return number * number
}

let a = square1(number: 8)
print(a)

func computeNum(number: Int) -> Int {
    number * number
}
let b = computeNum(number: 10)
print(b)
print(computeNum(number: 13))

func computeMoreNum(num: Int) -> Int {
    num > 10 ? 10 * num : num * num
}
let c = computeMoreNum(num: 8)
let d = computeMoreNum(num: 15)
print(c, d)

func greet(name: String) -> String {
    "Hello Swift!, \(name)"
}

print(greet(name: "dreamapple"))
print(("Hello, Swift", 1, 2, 3))

func getUser1() -> [String] {
    ["dream", "apple"]
}
let user1 = getUser1()
print(user1[0])

func getUser2() -> [String: String] {
    ["first": "dream", "last": "apple"]
}
let user2 = getUser2()
print(user2["first", default: "hello"])

func getUser3() -> (first: String, last: String) {
    ("dream", "apple")
}
let user3 = getUser3()
print(user3.first)

func sayHello(to name: String) {
    print("Hello, \(name)")
}
sayHello(to: "dreamapple")

func sayHello1(_ name: String) {
    print("Hello, \(name)")
}
sayHello1("dream")

func greet1(_ name: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(name)")
    } else {
        print("\(name)")
    }
}
greet1("dream", nicely: false)
greet1("dream", nicely: true)


func square6(_ numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square6(1, 2, 3, 4, 5)

enum PasswordError: Error {
    case obvious
}

func checkPwd(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPwd("password")
    print("good password")
} catch {
    print("bad password")
}

func doubleYourNum(num: inout Int) {
    num *= 2
}

var num1 = 10
doubleYourNum(num: &num1)
print(num1)
