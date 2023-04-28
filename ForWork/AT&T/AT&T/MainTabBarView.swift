//
//  MainTabBarView.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/23.
//

import UIKit

protocol MainTabBarDelegate {
    func onClickTap(mainView: MainView)
}
class MainTabBarView: UIView {
    static let shared = MainTabBarView()
    
    let mainViewController = MainViewController.shared
    var delegate: MainTabBarDelegate?
    
    @IBOutlet weak var GroupsTab: UIView!
    @IBOutlet weak var ContactsTab: UIView!
    @IBOutlet weak var RecentsTab: UIView!
    @IBOutlet weak var LocationTab: UIView!
    
    @IBOutlet var mainTabs: [UIView]!
    
    var gesture: UIGestureRecognizer?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        addObserver()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        // xibS etup() // 하면 storyboard에서 실시간(컴파일타임)에 inspector창에서 변경해도 확인 불가
    }
    
    func addObserver() {
        //        NotificationCenter.default .addObserver(self, selector: #selector(onUpdate), name: NSNotification.Name("aa"), object: nil)
    }
    
    private func loadView() {
        let view = Bundle.main.loadNibNamed("MainTabBarView",
                                            owner: self,
                                            options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
        initView()
        
    }
    
    private func initView(){
        for tab in mainTabs {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onClickTab))
            tab.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    func updateTabBar(){
        
        
    }
    
    func setActiveColor(activeView: UIView){
//        activeView.
    }
    
    @objc func onClickTab(sender: UITapGestureRecognizer){
        let tag = MainView(rawValue: sender.view!.tag)
//        if (tag != MainViewManager.shared.activeTab) {
            switch tag{
            case .GroupsView:
                delegate!.onClickTap(mainView: .GroupsView)
                break
            case .ContactsView:
                delegate!.onClickTap(mainView: .ContactsView)
                break
            case .RecentsView:
                break
            case .LocationView:
                break
            case .none:
                break
            }
//        }

        
    }
}
