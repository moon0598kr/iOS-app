//
//  SignUpViewController.swift
//  SampleProjectTHKim
//
//  Created by Ipageon_김태형 on 2022/01/19.
//

import UIKit
class SignUpViewController: UIViewController {

    @IBOutlet weak var inputID: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var goToLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        signupButton.layer.cornerRadius = 5
        goToLogin.layer.cornerRadius = 5
    }
    
    @IBAction func goLogin(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
