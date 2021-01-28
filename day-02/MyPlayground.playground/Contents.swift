import UIKit

var str = "Hello, playground"

// Arrays

let j = "J"
let q = "Q"
let k = "K"
let arr = [j, q, k]

print(arr)
print(arr[1])
print(arr[2])

let arr1: [String] = ["a", "b"]

// Sets
let colors = Set(["white", "blue", "pink"])
print(colors)
let colors2 = Set(["white", "blue", "pink", "white", "blue", "pink"])
print(colors2)

// Tuples
var name = (first: "dreamapple", last: "apple")
name = (first: "dream", last: "apple")
print(name.0)
print(name.1)
name.0 = "hello"
print(name)

// Dictionaries
var students = [
    1: "123",
    2: "234"
]
print(students)
print(students[9] ?? "hello")
print(students[1] ?? "hello")

// Dictionary default values
var students1 = [
    "dream": 20,
    "apple": 21
]
students1["dream"]
students1["dream1", default: 22]
