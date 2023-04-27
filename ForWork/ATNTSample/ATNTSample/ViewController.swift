//
//  ViewController.swift
//  ATNTSample
//
//  Created by Ipageon_김태형 on 2023/04/14.
//

import UIKit

class ViewController: UIViewController, MainTabBarDelegate {

//    @IBSegueAction func sego(_ coder: NSCoder) -> HViewController? {
//        return <#HViewController(coder: coder)#>
//    }
    @IBOutlet weak var ddd: UIView!
    @IBOutlet weak var mainTabView: UIView!
    @IBOutlet weak var mainTabBarView: UIView!
    
    
    let groupsView = GroupsViewController.shared
    let contactsView = ContactsViewController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        ddd.setclet storyboard = UIStoryboard(name: "Main", bundle: .main)
//        if let viewController = storyboard?.instantiateViewController(identifier: "HViewController")
        let statusBar = MainStatusBarView(nibName: "MainStatusBarView", bundle: .main)
//        let tabBar = MainTabBarView(nibName: "MainTabBarView", bundle: .main)
//        let mainView = GroupsViewController(nibName: "GroupsViewController", bundle: .main)
        let tabBar = MainTabBarView.shared
        tabBar.delegate = self
            //            self .addchi
            // 핵심 메소드로서, 뷰 컨트롤러에 부모-자식 관계를 형성한다
        self.addChild(statusBar)
        self.addChild(groupsView)
        self.addChild(contactsView)
//        self.addChild(recentsView)
//        self.addChild(locationView)
        self.addChild(tabBar)
        
        
            // 자식 뷰 컨트롤러의 루트 뷰를 현재 뷰의 뷰 계층에 추가하는 코드
//            self.view.addSubview(viewController.view)
//        self.view.addSubview(viewController.view)
        
        setViews(subView: statusBar.view, superView: ddd)
        setViews(subView: groupsView.view, superView: mainTabView)
        setViews(subView: tabBar.view, superView: mainTabBarView)
        
//        ddd.addSubview(viewController.view)
//
//        viewController.view.translatesAutoresizingMaskIntoConstraints = false
//
//        viewController.view.heightAnchor.constraint(equalTo: ddd.heightAnchor).isActive = true
//        viewController.view.widthAnchor.constraint(equalTo: ddd.widthAnchor).isActive = true
//
//        viewController.view.leftAnchor.constraint(equalTo: ddd.leftAnchor).isActive = true
//        viewController.view.rightAnchor.constraint(equalTo: ddd.rightAnchor).isActive = true
//
//        viewController.view.centerXAnchor.constraint(equalTo: ddd.centerXAnchor).isActive = true
//        viewController.view.centerYAnchor.constraint(equalTo: ddd.centerYAnchor).isActive = true
        
        
//        self.ddd.addSubview(viewController.view)
//
//        viewController.view.translatesAutoresizingMaskIntoConstraints = false
////        viewController.view.con
//        viewController.view.heightAnchor.constraint(equalTo: ddd.heightAnchor).isActive = true
//        viewController.view.widthAnchor.constraint(equalTo: ddd.widthAnchor).isActive = true
//
//        viewController.view.leftAnchor.constraint(equalTo: ddd.leftAnchor).isActive = true
//        viewController.view.rightAnchor.constraint(equalTo: ddd.rightAnchor).isActive = true
//
//        viewController.view.centerXAnchor.constraint(equalTo: ddd.centerXAnchor).isActive = true
//        viewController.view.centerYAnchor.constraint(equalTo: ddd.centerYAnchor).isActive = true
//             제약 생성
//        let onscreenS =
//         let onscreenConstraints = configureConstraintsForContainedView(containedView: viewController.view,
//                                                 stage: .onscreen)
//                       NSLayoutConstraint.activate(onscreenConstraints)
        
            // 화면 전환이 완료되었다면 자식 뷰 컨트롤러의 메소드를 호출하여 알려준다.
        
        statusBar.didMove(toParent: self)
        tabBar.didMove(toParent: self)
        groupsView.didMove(toParent: self)
        
            
    }
    func onClickTap(mainView: MainView) {
        changeMainView(mainTab:mainView)
    }
    
    func changeMainView(mainTab: MainView) {
        switch mainTab {
        case .GroupsView:
            setViews(subView: groupsView.view, superView: mainTabView)
            break
        case .ContactsView:
            setViews(subView: contactsView.view, superView: mainTabView)
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

