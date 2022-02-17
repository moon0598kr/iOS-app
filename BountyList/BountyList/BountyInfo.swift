//
//  BountyInfo.swift
//  BountyList
//
//  Created by Ipageon_김태형 on 2022/02/03.
//

import UIKit

struct BountyInfo {
    let name : String
    let bounty : Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init (name : String, bounty : Int) {
        self.name = name
        self.bounty = bounty
    }
}
