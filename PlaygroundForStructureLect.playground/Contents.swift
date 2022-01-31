import UIKit
import Foundation
import Darwin
import os

//Structure 관계가 있는 것들을 묶어서 표현
//object = Data + Method

//Structure :
//Value Types
//Copy
//Stack 이라는 공간에서 생성

//Class :
//Reference Types
//Share : 참조
//Heap 이라는 공간에서 생성

//Class는 하나의 인스턴스를 포인팅 함으로 변수의 값을 변경시키면 Class에도 적용됨
//Structure는 각각의 변수를 생성하고 각각의 인스턴스를 포인팅 함으로 변수의 값을 변경시켜도 이 전의 인스턴스에는 영향을 주지 않음


// --- Class vs. Structure

class PersonClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct PersonStruct {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let pClass1 = PersonClass(name: "Taehyeong", age: 25)
let pClass2 = pClass1

pClass2.name = "KimTaeHyeong"

pClass1.name
pClass2.name

var pStruct1 = PersonStruct(name: "Taehyeong", age: 25)
var pStruct2 = pStruct1

pStruct2.name = "KimTaeHyeong"

pStruct1.name
pStruct2.name

// 문제 : 가장 가가운 편의점 찾기

// 맨처음 시작 시 코드

struct Location {
    let x: Int
    let y: Int
}

struct Store {
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}


// 현재 스토어 위치들
let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")

// 거리구하는 함수
func distance(current: Location, target: Location) -> Double {
    // 피타고라스..
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}


//가장 가까운 편의점 구해서 프린트하는 함수
func printClosestStore(currentLocation: Location, stores: [Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores {
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: currentLocation)
        }
    }
    print("Closest store: \(closestStoreName), isDeliverable: \(isDeliverable)")
}



// Stores Arry 세팅, 현재 내 위치 세팅
let myLocation = Location(x: 2, y: 5)
let stores = [store1, store2, store3]

// printClosestStore 함수 이용해서 현재 가장 가까운 편의점 출력하기
printClosestStore(currentLocation: myLocation, stores: stores)


//

struct thStruct{
    let favSong : String
    let favFood : String
    let age : Int
}

func thFunc (infor: thStruct) {
    let thinfor = "\(infor)"
    print(thinfor)
}

let thDic : Dictionary<String,Any> = ["favSong" : "Lovesong", "favFood" : "Chicken", "age" : 25]

var taehyeongInfo = thStruct(favSong: "Lovesong", favFood: "Chicken", age: 25)
thFunc(infor: taehyeongInfo)

var taeHyeongInfo2 = thStruct(favSong: thDic["favSong"] as! String, favFood: thDic["favFood"] as! String, age: thDic["age"] as! Int)
thFunc(infor: taeHyeongInfo2)

var chae = thStruct(favSong: "Tae", favFood: "JVo", age: 23)

thFunc(infor: chae)

//

// 도전 과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 어레이와 강사이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

// CustomStringConvertible 프로토콜
// description이라는 프러퍼티를 사용해야 CustomStringConvertible 프로토콜을 이용할 수 있음
struct Lecture : CustomStringConvertible {
    var description: String{
        return "Title: \(lectureName), lecturerName: \(lecturerName)"
    }
    
    let lectureName : String
    let lecturerName : String
    let studentNumber : Int
}

func printLecture(from lecturer: String, lectures: [Lecture] ) {
    var lectureName = ""

    for lecture in lectures {
        if lecturer == lecture.lecturerName {
            lectureName = lecture.lectureName
        }
    }
    

//    let lectureName = lectures
//                        .first {
//                            $0.lecturerName == lecturer
//                            //nil인 경우 ""
//                        }?.lecturerName ?? ""
    
    
    print("아 그 강사님 강의는 요 : \(lectureName)")
}

let lecture1 = Lecture(lectureName: "math", lecturerName: "김태형", studentNumber: 5)
let lecture2 = Lecture(lectureName: "korean", lecturerName: "민상원", studentNumber: 12)
let lecture3 = Lecture(lectureName: "iOS", lecturerName: "박다영", studentNumber: 2)
let lectures = [lecture1, lecture2, lecture3]

printLecture(from: "김태형", lectures: lectures)
printLecture(from: "Jack", lectures: lectures)

print(lecture1)

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
///protocol이란?
///protocol : 한글로는 규약, 구현 되어야하는 메서드, 프러퍼티 등
///어느 서비스를 이용해야 할 대 해야 할 일들의 목록 이라고 생각하면 됨.
///뮤직 service -> 아이디 생성, 결제 처럼 해야 할 일들을 말함


//Object = Data + Method
//Data
//Properties
//Store structure의 데이터에 관련된 것들을 Property라고 함
//어떤 값을 저장한 변수들을 Stored Property라고 함
//어떤 값을 직접 저장하진 않고 가공하거나 계산된 값을 제공하는 것을 Computed Property라고 함


struct Person {
    //Stored Property
    //Stored Property의 이름이 바뀐 시점을 알 수 있음
    //값이 바뀐 경우에 대해서 willSet과 didSet을 통해 Observation 할 수 있음
    var firstName : String {
        willSet {
            print("willSet \(firstName) --> \(newValue)")
        }
        //Stored Property에서만 가능한 didSet
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName : String
    //나중에 실행되는 Property
    //Cost가 큰 경우에 사용할 수 있음
    //나중에 접근되며 모든 사용자에게 접근하지 않는 Property의 경우 Lazy Property를 사용할 수 있음
    lazy var isPopular : Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    //Computed Property 같은 경우는 var만 이용가능함
    //Computed Property는 read only임
    //업데이트나 삭제할 수 없음
    //관계만 정리 해놓으면 세팅도 가능함
    //세팅을 가능하게 하려면 getter, setter를 구현해야 함
//    var fullName : String {
//        get {
//            return "\(firstName) \(lastName)"
//        }
//
//        set {
//
//            //빈칸을 기준으로 String을 앞 뒤로 나눔
//            //각 할당된 내용을 위의 firstName과 lastName으로 할당함
//            if let firstName = newValue.components(separatedBy: " ").first {
//                self.firstName = firstName
//            }
//            if let lastName = newValue.components(separatedBy: " ").last {
//                self.lastName = lastName
//            }
//        }
//    }
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    
//    func fullName() -> String {
//        return "\(firstName) \(lastName))"
//    }
    //Type Property
    //인스턴스가 아님
    static let isAlien : Bool = false
    
}

var person = Person(firstName: "Kim", lastName: "Taehyeong")

//person.firstName
//person.lastName
//
//person.firstName = "Jim"
//person.lastName = "Chae"
//
//person.firstName
//person.lastName
//
//person.fullName
//person.fullName = "Jay Park"
//
//person.firstName
//person.lastName
//
//// Type Property : 생성된 인스턴스와 상관없이 Structor 혹은 class의 속성 자체를 보여주거나 정하고 싶을 때 사용함
///
//
//Person.isAlien
//
//person.isPopular

/////////////////////////////
/////////////////////////////
///Property vs Method
///Property : 호출시 (저장된)값을 하나 반환함
///Method : 호출 시 어떤 작업을 함
///만약에 Method가 그냥 값을 리턴하는 작업을 한다면 ?..
///기준
///1. Setter가 필요한가?
///네 -> Computred Property
///아니오.
///2. 계산이 많이 필요한가? 혹은 DB access나 File io가 필요한가?
///네 -> Method
///아니오 -> Computed Property


//Struct와 관련된 func가 있을 경우 굳이 따로 분리할 필요 없이 Struct 안에 func를 구현하는 방법도 있음.

struct Lecture1 {
    var title: String
    var maxStudetns : Int = 10
    var numOfRegistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxStudetns - numOfRegistered
        return remainSeats
    }
    
    //Struct와 관련된 메서드를 썼는데 메서드가 Struct안의 Stored Property를 변경시킬 경우 mutating을 사용해야 함
    mutating func register() {
        //등록된 학생 수 증가시키기
        numOfRegistered += 1
        
    }
    
    //Type Property가 아닌 Type Method도 만들 수 있음
    static var target : String = "Anybody want to learn something"
    
    static func 소속학원이름() -> String {
        
        return "패캠"
    }
    
    
}

var lec = Lecture1(title: "iOS Basic")


//func remainSeats(of lec: Lecture1) -> Int {
//    let remainSeats = lec.maxStudetns - lec.numOfRegistered
//    return remainSeats
//}

let exampleLecture = Lecture1(title: "Swift Basic", maxStudetns: 1283, numOfRegistered: 123)

//lec.remainSeats(exampleLecture)

lec.register()
lec.register()
lec.register()
lec.register()
lec.register()
lec.register()

lec.remainSeats()

Lecture1.target
Lecture1.소속학원이름()

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -23)

//확장해서 내가 필요한 메서드를 더 만들 수 있음
//외부에서 새로운 메서드를 추가할 수 있다는 걸 알면 됨
// 제곱, 반값
extension Math {
    static func square(value: Int) -> Int {
       return value * value
    }
    
    static func half(value: Int) -> Int {
       return value / 2
    }
}

Math.square(value: 5)
Math.half(value: 20)

var value: Int = 3

//extension을 이용하면 Apple에서 제공하는 Struct에서도 원하는 기능을 넣을 수 있음
extension Int {
    func square() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self / 2
    }
}

//먼저 필요한 것들을 선언 해주고, 구현하는 방법도 있음
value.square()
value.half()
