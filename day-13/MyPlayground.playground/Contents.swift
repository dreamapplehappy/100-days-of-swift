import UIKit

var str = "Hello, playground"

let name = "ABC"
var name1 = "ABC"
name1 = "DEF"

var age = 20

var num1: Double = 123456789.0987654321
var num2: Float = 123456.719
print(num1, num2)

var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var arr1 = [1, 2, 3]
print(arr1[0], arr1.first!)

type(of: arr1)
type(of: arr1.first)

var arr2: [Any] = [1, "1", (name: "dreamapple")]

var arr3 = [Int]()
arr3.append(1)

var arr5: [Int] = []
arr5.append(2)

print(arr3 + arr5)


var dic = [
    "name": "hello",
    "age": "20"
]
print(dic["name1", default: "hi"])

var person = "hater"
var action: String = ""

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = ""
}

for n in 1...10 {
    print("\(n) x 10 is \(n * 10)")
}
