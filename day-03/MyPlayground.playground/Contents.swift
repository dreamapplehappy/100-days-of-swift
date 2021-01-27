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
let isB1MultipleOf8 = b1.isMultiple(of: 8)


let a2 = 1 + 1
let b2 = "Hello, " + "World"
let c2 = [1, 2] + [3, 4]
