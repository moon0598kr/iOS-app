import UIKit
import Darwin



// Queue - Main, Global, Custom


// - Main
DispatchQueue.main.async {
    // UI update, 사용자 인터랙션
    let view = UIView()
    view.backgroundColor = UIColor.systemRed
}

// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 진짜 핵중요, 지금 당장 해야하는 것
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것, 사용자가 결과를 기다린다
}

DispatchQueue.global(qos: .default).async {
    // 이건 굳이 사용하지 않아도 됨 qos클래스를 사용하지 않았을 때와 비슷함
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는 것, 네트워킹, 디스크에서 큰 파일 불러올 때
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는 것들, 뉴스 데이터 미리 받기, 위치 업데이트, 영상 다운로드
    // 페이스북 뉴스피드가 이런식으로 이루어짐
}

// - Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)
// 그다지 많이 쓸 일이 없음

// 복합적인 상황

func downloadImageFromServer() -> UIImage {
    // heavy Task
    return UIImage()
}

func updateUI(image: UIImage){
    
}
DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        // updpate UI -> UI를 업데이트를 할 때는 메인을 이용해주는 습관을 들이는 게 좋음
        updateUI(image: image)
    }
    
}
// Sync, Async
//Async
//DispatchQueue.global(qos: .background).async {
//    for i in 0...5 {
//       print("\(i) 앞")
//    }
//}
//
//DispatchQueue.global(qos: .userInteractive).async {
//    for i in 0...5 {
//       print("\(i) 뒤")
//    }
//}

//Sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
       print("\(i) 앞")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
       print("\(i) 뒤")
    }
}

// 앞의 작업이 끝나지 않으면 뒤의 작업이 이루어 질수 없는 그런 작업일 경우에 sync를 사용하기도 함 
