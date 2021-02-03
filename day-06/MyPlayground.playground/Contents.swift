import UIKit

var str = "Hello, playground"

// closures
let driving = {
    print("I am driving in my car")
}
driving()

func createAClosure() -> ()->() {
    return {
        print("I am a closure")
    }
}

let ac = createAClosure()
ac()

let closure1 = { (name: String) in
    print("Hello, \(name)")
}
closure1("dreamapple")


let closure2 = { (name: String) -> String in
    return "Hello, \(name)"
}
let str1 = closure2("dreamapple")
print(str1)

let closure3 = { () -> Int in
    return 6
}
let num6 = closure3()
print(num6)

let acceptMyClosure = { (action: () -> Void) in
    print("before action")
    action()
    print("after action")
}
let closure5 = {
    print("I am closure5")
}
acceptMyClosure(closure5)

acceptMyClosure {
    print("every thing you want")
}
