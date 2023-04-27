//
//  ViewController.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/23.
//

import UIKit
import Intents

class MainViewController: UIViewController, MainTabBarDelegate {
    static let shared = MainViewController()

    @IBOutlet var mainStatusBarView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var mainTabBarView: UIView!
    
    let groupsView = GroupsView.shared
    let contactsView = ContactsView.shared
//    let recentsView = RecentsView.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        MainTabBarView.shared.delegate = self

    }
    
    func initView() {
        let statusBarView = MainStatusBarView.shared
        let tabBarView = MainTabBarView.shared
        
        setViews(subView: statusBarView, superView: mainStatusBarView)
        setViews(subView: tabBarView, superView: mainTabBarView)
        setViews(subView: groupsView, superView: mainView)
    }
    
    func onClickTap(mainView: MainView) {
        changeMainView(mainTab:mainView)
    }
    
    func changeMainView(mainTab: MainView) {
        switch mainTab {
        case .GroupsView:
            setViews(subView: groupsView, superView: mainView)
            break
        case .ContactsView:
            setViews(subView: contactsView, superView: mainView)
            break
        case .RecentsView:
//            setViews(subView: contactsView, superView: mainView)
            break
        case .LocationView:
//            setViews(subView: contactsView, superView: mainView)
            break
        }
    }
    
    func setViews(subView: UIView, superView: UIView){
        superView.subviews.first?.removeFromSuperview()
        superView.addSubview(subView)
        
        subView.translatesAutoresizingMaskIntoConstraints = false

        subView.heightAnchor.constraint(equalTo: superView.heightAnchor).isActive = true
        subView.widthAnchor.constraint(equalTo: superView.widthAnchor).isActive = true

        subView.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        subView.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true

        subView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        subView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }

}

