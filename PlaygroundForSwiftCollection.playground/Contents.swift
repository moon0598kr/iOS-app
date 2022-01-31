import UIKit
//import UIKit
//
//// Array -> 순서가 있음
//// 여기서 순서는 index로 표현
//// 순서가 있는 아이템, 아이템의 순서를 알면 유용할 때 사용
//
//
////배열을 선언 하는 방법
//var evenNumbers: [Int] = [2,4,6,8]
//let evenNumbers2 : Array<Int> = [2, 4, 6, 8]
//var evenNumbers3 : Array<Int?> = []
//
////배열을 추가하는 방법
////append -> 하나의 요소 추가
////+= 반복하여 여러 개의 요소를 추가
////contentsOf -> 여러 개의 요소를 추가
//evenNumbers.append(10)
//evenNumbers += [12, 14, 16]
//evenNumbers.append(contentsOf: [18, 20])
//
////isEmpty라는 것을 사용하여, Array안이 비었는지 Bool값으로 얻을 수 있음
//let isEmpty = evenNumbers.isEmpty
//print("\(isEmpty)")
//
////count를 통해 Array안의 요소 숫자를 알 수 있음
//evenNumbers.count
//
//print(evenNumbers.first)
//
//let firstItem = evenNumbers.last
//
//if let firstElement = evenNumbers.first {
//    print(firstElement)
//}
//
////Array의 가장 작은 값과 큰 값을 불러옴
//evenNumbers.min()
//evenNumbers.max()
//
//
////Array에서 원하는 index의 값을 호출
//var firstItem1 = evenNumbers[0]
//var secondItem = evenNumbers[1]
//var tenthItem = evenNumbers[9]
//
////Range를 사용한 index의 값 호출
//let firstThree = evenNumbers[0...2]
//evenNumbers
//
////포함된 값 확인
//evenNumbers.contains(3)
//evenNumbers.contains(4) // -> 불리언 값으로 나옴
//
////Array에 값을 넣어주는 방법
//evenNumbers.insert(0, at: 0)
//evenNumbers[0]
//
////Array를 없애는 방법
////evenNumbers.removeAll()
////evenNumbers = []
//evenNumbers.remove(at: 0)
//evenNumbers
//
////Array update
//evenNumbers[0] = -2
//evenNumbers
//
//evenNumbers[0...2] = [-2, 0 ,2]
//evenNumbers
//
////Array 값을 바꾸는 방법
////evenNumbers.swapAt(0, 9)
//
//// for 문을 사용 해서 출력
//for num in evenNumbers {
//    print(num)
//}
//
////index를 알 수 있는 for loop
//
//for (index, num) in evenNumbers.enumerated() {
//    print("idx: \(index), value: \(num)")
//}
//
////실제 값들에 영향을 주지 않고, 앞의 element들을 드랍함
//let firstThreeRemoved = evenNumbers.dropFirst(3)
//firstThreeRemoved
//// 뒤의 element들을 드랍함
//let lastRemoved = evenNumbers.dropLast()
//lastRemoved
//
////앞의 element들을 가져옴
//let firstThree1 = evenNumbers.prefix(3)
//firstThree1
//
////뒤의 element들을 가져옴
//let lastThree1 = evenNumbers.suffix(3)
//lastThree1




////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
// Dictionary

////coffee의 이름표 -> key
////Array는 순서 단위
////Dictionary는 key 단위
//
////Dictionary의 선언
//var scoreDic : [String: Int] = ["Kim" : 80, "Jason" : 95, "Jake" : 90]
//var scoredic1: Dictionary<String, Int> = ["Kim" : 80, "jason" : 95, "Jake" : 90]
//
////Dictionary의 호출
//if let score = scoreDic["Jason"] {
//    score
//} else {
//    // score 없음
//}
//scoreDic["Kim"]
//scoreDic["Jerry"]
//
////Dictionary에서 초기화 시킬 땐, :를 넣어주어야 함
////scoreDic = [:]
//scoreDic.isEmpty
//scoreDic.count
//
////기존 사용자 업데이트
//scoreDic["Kim"] = 100
//scoreDic
//
////사용자 추가
//scoreDic["Jack"] = 12
//scoreDic
//
////사용자 제거
//scoreDic["Jack"] = nil
//scoreDic
//
////for loop 문을 이용한 Dictionary 사용
//
//for (name, score) in scoreDic {
//    print("\(name), \(score)")
//}
//
//for key in scoreDic.keys {
//    print(key)
//} // -> 순서는 없다고 생각해야 함
//
//
//// 1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
//// 2. 여기서 도시를 부산으로 업데이트 하기
//// 3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기
//
//var inforDic : [String : String] = ["name" : "KimTaeHyeong", "Job" : "Developer", "City" : "Seoul"]
//
//inforDic["City"] = "Busan"
//
//inforDic
//
//func printInfo (dic : [String : String]) {
//    if let name = dic["name"], let city = dic["City"] {
//        print(name, city)
//
//    } else {
//        print("->>> Cannot find")
//    }
//}
//
//printInfo(dic: inforDic)



////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
///
///
///Set - > 순서가 없고 Uninque한 item들, 중복이 없음

var someArray: Array<Int> = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3 ,1, 2]

someSet.isEmpty
someSet.count

someSet.contains(4)
someSet.contains(1)

someSet.insert(5)
someSet

someSet.remove(1)
someSet

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
///Closure : 이름이 없는 메서드, 함수


var multiplyClosure: (Int, Int) -> Int = { $0 * $1
}
let result = multiplyClosure(4,2)

// 이정도 수준으로 줄이는 게 좋음
var multiplyClosure1: (Int, Int) -> Int = { a, b in return a * b
}
let result1 = multiplyClosure1(12,3)


func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a,b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClosure1)

var addClosure: (Int, Int) -> Int = { a, b in return a + b}
operateTwoNum(a: 12, b: 3, operation: addClosure)

operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
}

let voidClosure : () -> Void = {
    print("iOS Develoer")
}

voidClosure()

// Closure의 Capturing Values

var count = 0

let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()

count

// Closure
// 함수는 Closure의 한 가지 타입,
// Closure의 타입은 Global 함수, Nested 함수, Closure Expressions 3가지가 있음

//Function(Global)
// 이름이 있음
// func 키워드 필요
//Closure
// 이름이 없음
// func 키워드 필요 없음

// 공통점
// 인자 받을 수 있음
// 값 리턴 가능
// 변수로 할당 가능
// First Class Type 임

//First Class Type :
// 변수에 할당할 수 있음
// 인자로 받을 수 있음
// 리턴 할 수 있음

// Closure가 많이 쓰이는 곳
// Completion Block : 어떤 task가 끝나고 어떠한 역할을 수행할 때 사용하는 코드 블럭
// Higher Order Functions : input으로 함수를 받을 수 있는 function을 Higher order Functions라고 함
// -> 인자 자체를 함수로 '바로' 만들어서 사용할 때 Closure를 자주 사용함

// Closure Expression Syntax :
// { (parameters) -> return type in
//    statements
// }

// in을 기준으로 앞쪽이 파라미터와 리턴 타입, 뒤쪽이 수행 블록

// Example 1 : Cho Simple Closure

//파라미터, 리턴타입, 스테이트먼트도 없는 것
let choSimpleClosure = {

}

choSimpleClosure()

// Example 2: 코드 블록을 구현한 Closure

let choSimpleClosureEx2 = {
    print("Hello, closure, corona")
}

choSimpleClosureEx2()
// Example 3: 인풋 파라미터를 받는 Closure

let choSimpleClosureEx3 : (String) -> Void = { name in
    print("나이 이름은 \(name) 입니다!")
}

choSimpleClosureEx3("TaehyeongKim")

// Example 4: 값을 리턴하는 Closure

let choSimpleClosureEx4 : (String) -> String = { name in
    let message = "iOS Developer man man se, \(name)님. 경제적 자유를 얻으실 거에요"
    return message
}

let resultForClosure = choSimpleClosureEx4("taehyeongkim")
print(resultForClosure)

// Example 5: Closure를 파라미터로 받는 함수 구현

func someSimpleFunction(choSimpleClosureEx5 : () -> Void) {
    print("함수에서 호출 되었다")
    choSimpleClosureEx5()
}

someSimpleFunction(choSimpleClosureEx5: {
    print("Hello corona From Closure")
})

// Example 6: Trailing Closure
func someSimpleFunctionEx6(message: String, choSimpleClosureEx6 : () -> Void) {
    print("함수에서 호출 되었다, 메세지는 \(message)")
    choSimpleClosureEx6()
}

someSimpleFunctionEx6(message: "ronarona merona,", choSimpleClosureEx6: {
    print("Hello corona From Closure")
})

someSimpleFunctionEx6(message: "ronarona merona,"){
    print("Hello corona From Closure")
}
// Trailing Closure라는 특성을 이용하여 인자 값의 마지막이 Closure일 경우, Closure 형식을 '생략'할 수 있음
