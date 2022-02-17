//
//  BountyViewController.swift
//  BountyList
//
//  Created by Ipageon_김태형 on 2022/02/01.
//

import UIKit

//테이블 뷰의 셀은 몇 개? 라는 질문과
//테이블 뷰는 어떻게 보여줄까? 라는 질문은
//UITableViewDataSource 라는 것을 통해 답함

//테이블 뷰를 클릭하면 어떡해? 라는 질문은
//UITableViewDelegate 라는 것을 통해 답함


//Code상에서 UITableViewDataSource와 UITableViewDelegate만을 구현할 게 아니라,
//Storyboard에서도 ViewController에 DataSource, Delegate를 연결해주어야 함
class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    // MVVM
    
    // Model
    // - BountyInfo
    // -> BountyInfo를 만들자
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel 한테서 받아야겠다
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰 레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에 데이터를 넘겨줄 것임
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showDetail" {
            
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                //DetailViewController의 name에 클릭된 nameList의 index안의 정보를 넘겨주어 할당
                vc?.viewModel.update(model: bountyInfo)
                
                //DetailViewController의 bounty에 클릭된 bountyList의 index안의 정보를 넘겨주어 할당
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //guard문을 사용해서 nil 값이 불러와질 경우를 대비함
        //guard문의 경우는 띄어쓰기가 한 번 더 안들어감 -> 가독성이 좋음
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        
        return cell
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
//            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//            cell.imgView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//
//            return cell
//        } else {
//            return UITableViewCell()
//        }
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        
        //sender를 indexPath.row로 세팅
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

//Cell은 보통 Custom Cell을 이용함
class ListCell : UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
        
    }
}

class BountyViewModel {
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 3000000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList : [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        
        return sortedList
        
    }
    
    var numberOfBountyInfoList : Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedList[index]
    }
}
