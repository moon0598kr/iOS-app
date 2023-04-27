//
//  GroupsView.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/23.
//

import UIKit
import Intents

class GroupsView: UIView {
    static let shared = GroupsView()
    
    @IBOutlet weak var groupTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        // xibSetup() // 하면 storyboard에서 실시간(컴파일타임)에 inspector창에서 변경해도 확인 불가
    }
    
    private func loadView() {
        let view = Bundle.main.loadNibNamed("GroupsView",
                                       owner: self,
                                       options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
//        INFocusStatusCenter.default.authorizationStatus
//
        /// Request authorization to check Focus Status
        if #available(iOS 15.0, *) {
            INFocusStatusCenter.default.requestAuthorization { status in
                /// Provides a INFocusStatusAuthorizationStatus
                //            status.
            }
        } else {
            // Fallback on earlier versions
        }

        
        initTableView()
        
    }
    
    func aa() {
        self.removeFromSuperview()
    }

}

extension GroupsView: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        groupTableView.delegate = self
        groupTableView.dataSource = self
        groupTableView.register(UINib.init(nibName: "GroupsTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupsTableViewCell")
//        groupTableView.register("GroupsTableViewCell", forCellReuseIdentifier: "GroupsTableViewCell")
        
//        groupTableView.table
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = UIColor.brown
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsTableViewCell", for: indexPath) as! GroupsTableViewCell
        
        cell.nameLabel.text = "Hi"
        cell.nameLabel.textColor = UIColor.systemRed
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.backgroundColor = UIColor.blue
        
        var daa:Bool
        if #available(iOS 15.0, *) {
            
            daa = INFocusStatusCenter.default.focusStatus.isFocused!
            if (daa) {
                print("isFocused")
            }else {
            }
        }
        
    }
    
    
}

