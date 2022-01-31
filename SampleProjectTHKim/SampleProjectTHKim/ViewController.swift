//
//  ViewController.swift
//  SampleProjectTHKim
//
//  Created by Ipageon_김태형 on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputEmail: UITextField!
    
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var goToSignup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        goToSignup.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
    }
    
    @IBAction func onClickSignup(_ sender: Any) {
    }
    

}

