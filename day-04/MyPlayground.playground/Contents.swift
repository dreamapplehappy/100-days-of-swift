//import UIKit

var str = "Hello, playground"

// For loops
let counts = 1...10
for num in counts {
    print("number is \(num)")
}

let fruits = ["apple", "banana", "orange", "pear"]
for fruit in fruits {
    print("fruit is \(fruit)")
}

for _ in 5...9 {
    print("just play")
}

// While
var number = 0
while number <= 10 {
    number += 1
    print(".\(number)")
}
print("number is \(number)")

// repeat
repeat {
    print("repaet play...")
} while false

var n = 0
repeat {
//    print("repeat \(n)")
    n += 1
} while n < 6

// TODO 如何检测死循环


let numArr = [1, 2, 3]
let otherArr = [1, 2, 3]
print(numArr == otherArr)

print(otherArr.shuffled())

var shuffledArr = [Int]()
repeat {
    shuffledArr = numArr.shuffled()
    print("\(shuffledArr)")
} while shuffledArr == numArr

// Exiting loops

var countDown = 10
while countDown > 0 {
    print("\(countDown)")
    countDown -= 1
    if countDown == 5 {
        break
    }
}

// Exiting multiple loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        print("\(i) * \(j) = \(i * j)")
        if i * j == 50 {
            break outerLoop
        }
    }
}

// Skipping items
for n in 1...10 {
    if n % 2 == 1 {
        continue
    }
    print("\(n)")
}

// Infinite loops
var counter = 0
while true {
    print(" ")
    counter += 1
    if counter == 273 {
        break
    }
}
print("done!")
