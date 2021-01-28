import UIKit

var str = "Hello, playground"

let a = 10
let b = 3
let c = a + b
let d = a - b
let e = a * b
let f = a / b
let g = 10 / 3.0
let h = 0.1 + 0.2
let i = 100 % 33

// '90000000000000001' is not exactly representable as 'Double'; it becomes '90000000000000000'
var a1: Double = 90000000000000001

// Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
//var b1 = a + 2.0


let b1 = 376
//let isB1MultipleOf8 = b1.isMultiple(of: 8)


let a2 = 1 + 1
let b2 = "Hello, " + "World"
let c2 = [1, 2] + [3, 4]


// compound assignment operators
var a3 = 10
a3 -= 7
a3 += 13
a3 *= 12
a3 /= 17

// Comparison operator
let a5 = 10
let a6 = 12
a5 > a6
a5 >= a6
a5 != a6
"A" > "B"
"a" < "b"

//enum Size: Comparable {
//    case small
//    case medium
//    case big
//}
//
//print(Size.small < Size.medium)



// Conditions
let a7 = 21
let b7 = 21
if a7 < b7 {
    print("Hello")
} else if a7 == b7 {
    print("Equal")
} else {
    print("Bigger")
}

// Combining conditions
let a8 = 3
let b8 = "a"

3 > 4 && "a" <= "b"
a8 >= 10 || b8 < "f"

// The ternary operator
let firstCard = 10
let secondCard = 20
print(firstCard == secondCard ? "the same" : "not the same")

if firstCard == secondCard {
    print("the same")
} else {
    print("not the same")
}

// Switch statements
let weather = "rain"
switch weather {
case "rain":
    print("Bring an umbrella")
    fallthrough
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// Range operator
let score = 99
switch score {
case 0..<60:
    print("not good")
case 60...80:
    print("well done")
default:
    print("excellent")
}

print(0..<60)

let fruits = ["apple", "banana", "pear", "lemon"]
print(fruits[0])
print(fruits[...])
print(fruits[1...])
print(fruits[1..<3])
