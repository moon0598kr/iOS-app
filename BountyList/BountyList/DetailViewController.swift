//
//  DetailViewController.swift
//  BountyList
//
//  Created by Ipageon_김태형 on 2022/02/01.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    // MVVM
    
    // Model
    // - BountyInfo
    // -> BountyInfo를 만들자
    
    // View
    // - imgView, nameLabel, bountylabel
    // > view들은 viewModel을 통해서 구성되기
    
    // ViewModel
    // - DetailViewModel
    // > 뷰레이어 에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    
    let viewModel = DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//        if let bountyInfo = self.bountyInfo {
//            imgView.image = bountyInfo.image
//            nameLabel.text = bountyInfo.name
//            bountyLabel.text = "\(bountyInfo.bounty)"
//        }
        
//        guard let name = self.name, let bounty = self.bounty else {
//            return
//        }
//        let img = UIImage(named: "\(name).jpg")
//        imgView.image = img
//        nameLabel.text = name
//        bountyLabel.text = "\(bounty)"
        
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

class DetailViewModel {
    var bountyInfo : BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
