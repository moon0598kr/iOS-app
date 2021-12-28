import UIKit

var greeting = "Hello, playground"
let value = arc4random_uniform(100)
print("-->> \(value)")

// -- Tuple

let coordinates = (4,6)
let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x: 2, y: 3)


let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let (x3, y3) = coordinatesNamed

x3
y3


// -- Boolean

let yes = true
let no = false

let isFourGreaterThanFIve = 4 > 5

if isFourGreaterThanFIve {
    print(" ->>>참")
} else {
    print(" ->>>거짓")
}

let a = 5
let b = 10

if a > b {
    print("a가 크다")
}
if b > a {
    print("b가 크다")
}

let name1 = "Jin"
let name2 = "Jason"

let isTwoNameSame = name1 == name2

if isTwoNameSame {
    print("이름이 같다")
} else {
    print("이름이 다르다")
}

let isJason = name2 == "Jason"
let isMale = false

let jasonAndMale = isJason && isMale
let jasonOrMale = isJason || isMale

//let greetingMessage : String
//if isJason {
//    greetingMessage = "Hello Jason"
//} else {
//    greetingMessage = "Hello sSomebody"
//}
//print ("MSG: \(greetingMessage)")


    let greetingMessage : String = isJason ? "Hello" : "Hello Somebody"
    print("MSG: \(greetingMessage)")

    let aNumber = 1842
    let bNumber = 132

    let compareNumber = aNumber > bNumber

    let samHang : String = compareNumber ? "CHaeChae" : "jiji"

    var hours = 50
    let payPerHour = 10000
    var salary = 0

    if samHang == "CHaeChae" {
        print("nice")
    }
    if hours > 40 {
        let extraHours = hours - 40
        salary += extraHours * payPerHour * 2
        hours -= extraHours
}

let position = (x:1, y:2, z:3)
let x123 = position.x
let y123 = position.y
let z123 = position.z

x123
y123

let (x321, y321, z321) = position
x321
y321
z321
