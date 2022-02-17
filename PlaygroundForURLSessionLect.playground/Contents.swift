import UIKit

//URL

let urlString1 = "https://www.naver.com"
let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url1 = URL(string: urlString)
let url = URL(string: urlString)

url?.absoluteString // -> 실제 주소
url?.scheme
url?.host // -> 중요한 주소
url?.path // > 뒤의 path
url?.query // -> 검색어와 같은 쿼리
url?.baseURL

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)

relativeURL?.absoluteString // -> 실제 주소
relativeURL?.scheme
relativeURL?.host // -> 중요한 주소
relativeURL?.path // > 뒤의 path
relativeURL?.query // -> 검색어와 같은 쿼리
relativeURL?.baseURL
//쿼리에 대해서 우리가 스트링이 아닌 object 등으로 할때 유용한 게 있음
//Gdragon을 한글로 할때는 에러가 남
//이 때는 URL Component를 사용해서 구성하는 게 좋음


//// 여기까지 서버에 리퀘스트를 보낼 때 사용하는 URL

// URLComponets

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
urlComponents?.queryItems?.last?.value

