//
//  ViewController.swift
//  MyAlbum
//
//  Created by Ipageon_김태형 on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {

    var currentvalue = 0
    
    @IBOutlet weak var priceLabel: UILabel!
    
    private func randomPriceUpdate(){
       let randomPrice = arc4random_uniform(10000) + 1
       currentvalue = Int(randomPrice)
       priceLabel.text = "₩ \(currentvalue)"
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomPriceUpdate()
    }

    @IBAction func showAlert(_ sender: Any) {
        let messaage = "가격은 \(currentvalue) 입니다"
        let alert = UIAlertController(title: "Hello", message: messaage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.randomPriceUpdate()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
