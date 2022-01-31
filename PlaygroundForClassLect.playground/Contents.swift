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




