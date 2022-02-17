import UIKit

// 처음 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student: Person {
//    var grades: [Grade] = []
//}
//
//// 학생인데 운동선수
//class StudentAthlete: Student {
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//// 운동선인데 축구선수
//class FootballPlayer: StudentAthlete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    //Initializer도 우리의 입맛에 맞게 변경하고 축소할 수 있음
    override init(firstName : String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student: Student) {
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports : [String]
    
    init(firstName: String, lastName: String, sports: [String]) {
        //Phase 1
        self.sports = sports
        //자식 클래스에서 initialize를 할 때, 먼저 자식 클래스의 Stored Property를 세팅하고, 그 후에 부모 클래스의 Property를 세팅함
        super.init(firstName: firstName, lastName: lastName)
        
        //Phase 2
        self.train()
    }
    
    
    // 위가 주 initializer
    // 아래가 부 initializer 간략하고 축소해서 만드는 것
    // 기본 값을 정해두고 (초기화 해두고) 다른 것만 받는 것 같음
    convenience init(name: String) {
        self.init(firstName: name, lastName: "", sports: [])
    }

    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Kim", lastName: "Taehyeong")
let student1_1 = Student(student: student1)
let student2 = StudentAthlete(firstName: "Jay", lastName: "Lee", sports: ["Football"])
let student3 = StudentAthlete(name: "Mike")


//Swift에서 인스턴스를 생성 시점에 Stored Property는 값을 세팅해주어야함.
//Inheritance (상속) 된 자식 클래스의 경우에도 부모 클래스의 Property의 값을 세팅해주어야 함
//Subclass 먼저 세팅하고, SuperClass의 값을 세팅해야함
//이를 '2-phase Initialization' 이라고 함
// - > 클래스 생성 시의 2가지 단계라고 생각하면 됨
// Phase 1 :
// 모든 Stored Property는 모두 Initialize 되어야 한다 라는 것 -> 자식 클래스부터
// Property를 세팅하기 전에
// Phase 2 :
// 부모 Class의 Property 까지 세팅이 완료 된 후에 Property와 메서드의 사용이 가능함
// 만약 이런 규칙이 없다면 Property가 세팅이 되어지지 않은 상태로 인스턴스로 사용이 되고, 버그가 발생할 것임 -> 안정적인 프로그래밍 위해

//designated Initialization(지정 Initialization) vs. convenience Initialization(간편 Initialization)
//규칙 :
//DI는 자신의 부모의 DI를 호출해야함
//CI는 같은 클래스의 이니셜라이저를 꼭 하나 호출해야함
//CI는 궁극적으로는 DI를 호출해야함

//클래스안에는 여러가지 이니셜라이저를 만들 수 있음
//크게 주 이니셜라이저, 부 이니셜라이저가 있음
//부 이니셜라이저들은 다른 이니셜라이저를 부르게 되어있음
//최종적으로 부 이니셜라이저는 주 이니셜라이저를 호출해야 함


//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student: Person {
//    var grades: [Grade] = []
//
//    override init(firstName: String, lastName: String) {
//        super.init(firstName: firstName, lastName: lastName)
//    }
//
//    convenience init(student: Student) {
//        self.init(firstName: student.firstName, lastName: student.lastName)
//    }
//
//
//}
//
//// 학생인데 운동선수
//class StudentAthlete: Student {
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//    var sports: [String]
//
//    init(firstName: String, lastName: String, sports: [String]) {
//        // Phase 1
//        self.sports = sports
//        super.init(firstName: firstName, lastName: lastName)
//
//        // Phase 2
//        self.train()
//    }
//
//
//    convenience init(name: String) {
//        self.init(firstName: name, lastName: "", sports: [])
//    }
//
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//// 운동선인데 축구선수
//class FootballPlayer: StudentAthlete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//
//let student1 = Student(firstName: "Jason", lastName: "Lee")
//let student1_1 = Student(student: student1)
//let student2 = StudentAthlete(firstName: "Jay", lastName: "Lee", sports: ["Football"])
//let student3 = StudentAthlete(name: "Mike")


