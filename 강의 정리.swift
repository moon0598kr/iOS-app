강의 정리

Local 변수 -> 메소드 안에서만 사용
인스턴스 -> 오브젝트 안에서 사용

변수가 사용 되는 범위 -> scope
Scope를 벗어나면 변수를 사용하지 못함

튜플 (x, y)

While 문 
조건 > 코드 수행 > 조건 > 코드 수행

Repeat 문
코드 수행 > 조건 > 코드 수행 > 조건

Repeat {
 코드
} while I < 10 

For 문
For i in aaa {

} 

For 문에서의 조건물

For I in aaa where <조건> {

}

For 문에서 넘어갈 때

For I in add {
 If <condition> {
   Continue
  }
}

Switch 문에서도
Range -> a…b 사용 가능

Switch 문에서도
Where 문 사용 가능
Switch num1 {
Case _ where num1 % 2 == 0:
 print("짝수")
default:
print("wkrtn")
}


