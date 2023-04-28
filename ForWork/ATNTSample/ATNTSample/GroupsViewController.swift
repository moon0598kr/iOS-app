//
//  GroupsViewController.swift
//  ATNTSample
//
//  Created by 김태형 on 2023/04/27.
//

import UIKit

class GroupsViewController: UIViewController {
    static let shared = GroupsViewController()
    
    @IBOutlet weak var groupsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
    }
    


}

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func initTableView() {
        groupsTableView.delegate = self
        groupsTableView.dataSource = self
        groupsTableView.register(UINib(nibName: "GroupsTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupsTableViewCell")
        groupsTableView .separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView .dequeueReusableCell(withIdentifier: "GroupsTableViewCell", for: indexPath)
//        cell.backgroundColor = .red
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.backgroundColor = UIColor.blue
        
        var daa:Bool
        if #available(iOS 15.0, *) {
            
//            daa = INFocusStatusCenter.default.focusStatus.isFocused!
//            if (daa) {
//                print("isFocused")
//            }else {
//            }
        }
        
    }
    
}
