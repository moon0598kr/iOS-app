//import UIKit
//import Foundation

import Darwin
////var i = 0
////while i < 10 {
////    print(i)
////    i += 1
////}
//
//var i = 10
//print("---- While")
//while i < 10 {
//    print(i)
////
////    if i == 5 {
////        break
////    }
//    i += 1
//}
//
//print("---- Repeat")
//i = 10
//repeat {
//    print(i)
//    i += 1
//} while i < 10
//
//
//let closedRange = 0...10
//let haldClosedRange = 0..<10
//
//var sum = 0
//for i in haldClosedRange {
//    print("----> \(i)")
//    sum += i
//}
//
//print("-----> total sum: \(sum)")
//
//
//var sinValue: CGFloat = 0
//for i in closedRange {
//    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
//}
//
//let name = "Jason"
//for _ in closedRange {
//    print("--> \(name)")
//}
//
//let age = 12...59
//
//let taehyeong = "kim"
//for i in age {
//    print("chae")
//    sum += i
//    if i == 25 {
//        print("is mine")
//        break
//    }
//}
//
//
//for i in closedRange {
//    if i % 2 == 0 {
//        print("짝수입니다 \(i)")
//    }
//}
//
//
//for i in closedRange where i % 2 == 0 {
//    print("짝수입니다 \(i)")
//}
//
//for i in closedRange {
//    if i == 3 {
//        continue
//    }
//    print("하이하이 \(i)")
//}
//
//for i in closedRange {
//    for j in closedRange {
//        print("gugu -< \(i) * \(j) = \(i*j)")
//    }
//}
//


let num = 10

switch num {
case 0 :
    print("0")
case 0...10:
    print("0...10")
case 10:
    print("10")
default:
    print("123")
}

let pet = ["bird", "dog"]
switch pet {
case ["bird"] :
    print("it's a bird")
case ["dog"]:
    print("it's a dog")
case ["dog", "bird"]:
    print("dog and bird")
case ["bird","dog"]:
    print("bird and dog")
default:
    print("nothing")
}

let nice = "nice"

switch nice {
case "nice", "anice","chae":
    print("afdfsa")
default:
    print("adfsfasfdsfsadf")
}

let num1 = 5
switch num1 {
case _ where num1 % 2 == 0:
    print("짝수")
default:
    print("wkrtn")
}


//튜플을 switch 문에서도 사용이 가능함
//x 혹은 y가 상관이 없을 때는 _를 사용함
let coordinate = (x: 10, y: 10)

switch coordinate{
case (0,0):
    print("원점이네요")
case (let x,0):
    print("x축이네요, x: \(x)")
case(0,let y):
    print("y축이네요 y: \(y)")
case(let x,let y) where x == y:
//where 문을 사용해서 추가적인 조건을 걸 수도 있음
    print("x랑 y랑 같음 x,y: \(x),\(y)")
default:
    print("좌표어딘가")
}
