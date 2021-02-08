import UIKit

var str = "Hello, playground"

class Dog {
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func makeNoise() {
        print("汪汪汪...")
    }
    
    deinit {
        print("......")
    }
}

var dog = Dog(name: "littleBlack", color: "black")

class BlackDog: Dog {
    init(name: String) {
        super.init(name: name, color: "black")
    }
    
    override func makeNoise() {
        print("汪汪汪.....")
    }
}

var bDog = BlackDog(name: "littleBlack")
print(bDog.name, bDog.color)
dog.makeNoise()
bDog.makeNoise()

final class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var dogCopy = dog
print(dog.color)
dogCopy.color = "White"
print(dogCopy.color, dog.color)

struct Singer {
    var name = "ABC"
}

var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "AAA"
print(singerCopy.name, singer.name)

for _ in 1...2 {
    _ = Dog(name: "A", color: "black")
}

class M1 {
    var name = "M1"
}

struct M2 {
    var name = "M2"
}

let m1 = M1()
let m2 = M2()

print(m1.name)
m1.name = "MM1"
print(m1.name)

// m2.name = "MM2"


