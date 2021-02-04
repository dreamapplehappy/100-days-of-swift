import UIKit

var str = "Hello, playground"

func runClosure(action: (String) -> Void) {
    print("before closure")
    action("Hello")
    print("after closure")
}

runClosure { (name: String) in
    print("say \(name)")
}


func myReduce(_ nums: [Int], using computeRes: (Int, Int) -> Int) -> Int {
    var current = nums[0]
    for num in nums[1...] {
        current = computeRes(current, num)
    }
    return current
}

let nums1 = [1, 2, 3, 4, 5]
// 如果闭包中只有一个表达式，是不是可以省略掉返回类型的声明？
let result = myReduce(nums1) { (total: Int, next: Int) -> Int in
    total + next
}
print(result)
let a = myReduce([1, 2, 3], using: +)
print(a)


func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
// 这里的 number 可以不再次指定数据类型
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}


func runClosure2(action: (String) -> String) {
    print("before action")
    let actionRes = action("action...")
    print(actionRes)
    print("after action")
}
runClosure2 { (actionName: String) -> String in
    return "hello, \(actionName)"
}
runClosure2 { actionName -> String in
    return "hello, \(actionName)"
}
runClosure2 { actionName in
    return "hello, \(actionName)"
}
runClosure2 { actionName in
    "hello, \(actionName)"
}
runClosure2 {
    "hello, \($0)"
}


func runClosure3(action: (Int, String) -> String) {
    let res3 = action(1, "hello")
    print(res3)
}
runClosure3 {
    "hi, \($1) - \($0)"
}

func travel1() -> (String) -> Void {
    return {
        print("Hi, \($0)")
    }
}
let t1 = travel1()
t1("dreamapple")

func makeRandomGenerator() -> () -> Void {
    return {
        print(Int.random(in: 0...9))
    }
}
let generator = makeRandomGenerator()
generator()


func runClosure5() -> (String) -> Void {
    var count = 0
    return {
        print("Hi, \($0), count is: \(count)")
        count += 1
    }
}
let count5 = runClosure5()
count5("dreamapple")
count5("dreamapple")

func makeRandomGenerator1() -> () -> Int {
    var preNum = 0
    return {
        var num: Int
        repeat {
            num = Int.random(in: 1...3)
        } while preNum == num
        preNum = num
        return preNum
    }
}
let numGenerator = makeRandomGenerator1()

for _ in 0...9 {
    let a = numGenerator()
    print(a)
}
