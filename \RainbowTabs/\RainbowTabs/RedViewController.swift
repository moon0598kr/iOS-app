//
//  ViewController.swift
//  \RainbowTabs
//
//  Created by Ipageon_김태형 on 2021/11/05.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "3"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         tabBarItem.badgeValue = nil
        
    }
    
    


}

