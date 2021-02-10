import UIKit

var str = "Hello, playground"


var str1: String? = "hello"
var str2 = str1?.uppercased()
print(str2 ?? "hello")

var empty: Int? = nil
empty = 6
empty == nil

print(empty ?? 0)

enum WeatherType {
    case rain, cloud, sunny, wind
}

enum WeatherType1 {
    case rain
    case cloud
    case sunny
    case wind(speed: Int)
}

func getWeatherStatus(weather: WeatherType) {
    if weather == .sunny {
        print("Good!")
    }
}

func getWeatherStatus1(weather: WeatherType1) {
    switch weather {
    case .cloud:
        print("Cloud")
    case .wind(let speed) where speed < 10:
        print("Ha")
    case .rain, .sunny:
        print("rain")
    default:
        print("nothing")
    }
}

getWeatherStatus(weather: .sunny)
getWeatherStatus1(weather: .wind(speed: 9))

class Person {
    var name: String?
}

class Person1 {
    var name = "hello"
}

class Person2 {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Student: Person2 {
    var age: Int
    
    init(age: Int, name: String) {
        self.age = age
        super.init(name: name)
    }
}
