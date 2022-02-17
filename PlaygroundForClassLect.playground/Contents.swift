import UIKit
import Foundation


//Object = Data + Method
//Object -> Struct , Class
//Data -> Property
//Method -> Method

//화면에 그려지는 button, label 등 - >component

//두 Object에는 메모리 할당 공간에 따라서 Stack과 Heap으로 나뉨

//Structure -> Values Types, Copy
//Class -> Reference Types, Share (참조)

//Class의 경우에는 새로운 변수에 할당할 경우
//기존 인스턴스를 지칭하게 됨(포인트)
//Reference Type의 동작
//실제로 소유하거나 갖고있는 것이 아닌 지칭하는 것
//Heap 공간

//Stucture의 경우에는 새로운 변수에 할당할 경우
//기존 인스턴스가 아닌 새로운 인스턴스를 지칭함
//Value Type의 동작
//실제로 소유하고 갖고있는 것
//Stack 공간

//Heap과 Stack 둘 다 프로그램 실행을 위한 메모리 공간

//Stack -> 시스템에서 당장 실행을 하거나 바쁘게 컨트롤과 매니징해야 하는 경우
//함수에서 변수를 만들면 Stack, 함수에서 일을 다 처리하고 Return하면 해당 변수는 Stack에
//효율적이고 빠름

//Heap -> 시스템에서 Class같은 Reference 타입을 저장함
//큰 메모리 풀을 갖고있음, 시스템에서 동적인 메모리할당을 요청가능
//Stack처럼 자동으로 데이터를 제거하지 않음 -> 개발자가 잘 제어해야함
//인스턴스를 메모리에 할당 및 제거하기에 구조적으로 효율적이지 않기 때문에 Stack보다 느림

//Stack의 변수 / Reference ->>>>   Heap의 주소
//       변수 / Reference ->>>>   Heqp의 주소

/////////// 보고서 쓸 때 이걸 표로 만들어서 넣어보자 ////////////////

struct PersonStruct {
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    
    //자기 스스로의 Stored Property를 변경할 때, Mutable 한지 판단해야함 (Mutalbe -> 변경가능한)
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class PersonClass {
    //Class가 생성되었을 때, 만든 Property들의 초기값을 설정해주어야 함
    var firstName : String
    var lastName : String
    
    //init -> class 객체를 생성할 때 사용되는 함수
    init(firstName: String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    //class에서는 mutating을 사용하지 않음
    func upperclassName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

//모든 Struct는 Class로 코팅이 가능 함.

var personStruct1 = PersonStruct(firstName: "Kim", lastName: "Taehyeong")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Kim", lastName: "Taehyeong")
var personClass2 = personClass1

personStruct2.firstName = "Jay"
personStruct1.firstName
personStruct2.firstName

personClass2.firstName = "Jay"
personClass1.firstName
personClass2.firstName


personClass2 = PersonClass(firstName: "Bob", lastName: "Lee")
personClass1.firstName
personClass2.firstName


personClass1 = personClass2
personClass1.firstName
personClass2.firstName

//Struct vs Class
//언제 사용할까 ?
//Struct :
//1. 두 Object를 "같다, 다르다"로 비교해야 하는 경우
//두 데이터 자체를 비교할 때
//2. Copy된 각 객체들이 독립적인 상태를 가져야 하는 경우
//각 개체가 다른 상태로 관리되어야 하는 경우
//3.코드에서 오브젝트의 데이터를 여러 스레드에 걸쳐 사용할 경우
//각 스레드가 유니크한 인스턴스를 다룰 때 잠재적 위험을 피할 수 있음
//Value Type을 사용하는 것이 여러 스레드에서 인스턴스를 사용할 때 안전함

//Class :
//1. 두 object의 인스턴스 자체가 같음을 확인해야 할 때
//두 object의 데이터값이나 그런것이 아니라 인스턴스 자체가 같음을 확인해야 할 때 사용
//2. 하나의 객체가 필요하고, 여러 대상에 의해 접근되고 변경이 필요한 경우
//UIApplication

//팁 :
//1. 일단 Struct로 쓰자
//2. 그 후에 쓰임새에 따라서 Struct를 Class로 전환하자
//Swfit는 Struct를 좋아해
//Class보다 Struct의 쓰임이 훨씬많음
//https://developer.apple.com/swift/blog/?id=10
//Stackoverflow 보다는 공식문서를 좀 더 참고하자 !

//처음 주어진 코드
struct Grade{
    var letter : Character
    var points : Double
    var credits : Double
}

class Person {
    var firstName : String
    var lastName : String
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName() {
        print("My name is \(firstName)  \(lastName)")
    }
}

class Student : Person {
    var grades : [Grade] = []
    
//    var firstName : String
//    var lastName : String
//
//    init(firstName : String, lastName : String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName)  \(lastName)")
//    }
}
//A = B 라는 명제가 성립할 때는 상속을 이용 할 수 있음


let jay = Person(firstName: "Jay", lastName: "Lee")
let jason = Student(firstName: "Jasson", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
jason.grades.append(math)
jason.grades.append(history)

jason.grades.count

//A is B (A는 B에 포함)
//Student is Person(Student는 Person에 포함) 상속 가능
//Teacher is Person(Teacher는 Person에 포함) 상속 가능
//Person is Student(Person은 Student에 포함) -> 거짓 명제 상속 불가

// Person : Super Class (Parent Class)
// Student : SubClass (Child Class)

//상속의 규칙
//1. 자식은 한 개의 superclass만 상속
//2. 부모는 여러 자식들을 가질 수 있음
//3. 상속의 깊이는 상관이 없음 - > 대대 손손 상속가능

// 학생인데 운동선수

class StudentAthelete : Student {
    var minimumTrainingTime : Int = 2
    var trainedTime : Int = 0
    
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구 선수
class FootballPlayer : StudentAthelete {
    var footballTeam = "FC Swift"
    
    //원래있던 함수의 내용을 바꾸기 위해 override를 사용함
    override func train() {
        trainedTime += 2
    }
}

var athelete1 = StudentAthelete(firstName: "Kim", lastName: "Yuna")
var athelete2 = FootballPlayer(firstName: "Son", lastName: "HeungMin")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete1.minimumTrainingTime
athelete2.minimumTrainingTime

athelete2.footballTeam
//athelete1.footballTeam

athelete1.train()
athelete1.trainedTime

athelete2.train()
athelete2.trainedTime


athelete1 = athelete2 as StudentAthelete // uppercasting
athelete1.train()
athelete1.trainedTime

//downcasting
if let son = athelete1 as? FootballPlayer {
    print("--> team: \(son.footballTeam)")
}

//상속은 언제 하면 좋을까 ?
//1. Single Responsibility (단일 책임)
// -> 각 클래스는 한 개의 고려 사항만 있으면 됨, 한 가지의 기능, 역할만 사용하도록 클래스를 작성해야 함
//2. Type Safety (타입이 분명해야 할 때)
// -> 클래스간의 명확한 구분
//3. Shared Base Classes (다자녀가 있다!)
// -> 클래스의 기본동작이 구분 되어야 하는 경우, 공통적으로 어떤 동작을 할 경우
//4. Extensibility (확장성이 필요한 경우)
// -> 어떤 객체를 가지고 그 개념은 구체적으로 확장 시킬 때
//5. Identity (정체를 파악하기 위해)
// -> 어떤 상속된 특성을 활용하여 Identity를 확인하기 위해

// => 이러한 습관들을 들면 개발 철학들을 생각하면 짜는게 코딩에 대한 근거가 됨


/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
//Initializer(생성자)

//상속된 자식 클래스가 새로운 생성자를 만드는 것

//처음 코드


    


