import UIKit

var str = "Hello, playground"

// use generics
func mySwap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a1 = 10
var b1 = 20
mySwap(&a1, &b1)
print(a1, b1)
