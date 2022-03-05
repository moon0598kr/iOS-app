//
//  ViewController.swift
//  DanguStarGoram
//
//  Created by Ipageon_김태형 on 2022/02/16.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loginButton.backgroundColor = UIColor .systemTeal
        
    }

    @IBAction func goMainView(_ sender: UIButton) {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
    }
    
}

