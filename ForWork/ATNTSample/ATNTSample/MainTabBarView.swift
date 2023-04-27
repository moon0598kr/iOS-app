//
//  MainTabBarView.swift
//  ATNTSample
//
//  Created by 김태형 on 2023/04/27.
//

import UIKit

public enum MainView: Int {
    case GroupsView = 11
    case ContactsView
    case RecentsView
    case LocationView
}

protocol MainTabBarDelegate {
    func onClickTap(mainView: MainView)
}

class MainTabBarView: UIViewController {
    static let shared = MainTabBarView()
    var delegate: MainTabBarDelegate?

    @IBOutlet weak var groupsView: UIView!
    @IBOutlet weak var groupsIcon: UIImageView!
    @IBOutlet weak var groupsLabel: UILabel!
    
    @IBOutlet weak var contactsView: UIView!
    @IBOutlet weak var contactsIcon: UIImageView!
    @IBOutlet weak var contactsLabel: UILabel!
    
    @IBOutlet weak var recentsView: UIView!
    @IBOutlet weak var recentsIcon: UIImageView!
    @IBOutlet weak var recentsLabel: UILabel!
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    struct ViewSet {
        let tag: MainView
        let label: UILabel
        let image: UIImageView
    }
    
    var groupsSet: ViewSet?
    var contactsSet: ViewSet?
    var recentsSet: ViewSet?
    var locationSet: ViewSet?
    
    var tabSets: [ViewSet]?
    
    @IBOutlet var mainTabs: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsSet = ViewSet(tag: .GroupsView, label: groupsLabel, image: groupsIcon)
        contactsSet = ViewSet(tag: .ContactsView, label: contactsLabel, image: contactsIcon)
        recentsSet = ViewSet(tag: .RecentsView, label: recentsLabel, image: recentsIcon)
        locationSet = ViewSet(tag: .LocationView, label: locationLabel, image: locationIcon)
        tabSets = [groupsSet!, contactsSet!, recentsSet!, locationSet!]
        
        activeTab(tag: .GroupsView)
        setTabView()
    }
    
    
    func setTabView(){
        for tab in mainTabs {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onClickTab))
            tab.addGestureRecognizer(gestureRecognizer)
        }
        
        
    }

    @objc func onClickTab(sender: UITapGestureRecognizer){
        let tag = MainView(rawValue: sender.view!.tag)
        
        switch tag{
        case .GroupsView:
            activeTab(tag: .GroupsView)
            delegate!.onClickTap(mainView: .GroupsView)
            break
        case .ContactsView:
            activeTab(tag: .ContactsView)
            delegate!.onClickTap(mainView: .ContactsView)
            break
        case .RecentsView:
            activeTab(tag: .RecentsView)
            break
        case .LocationView:
            activeTab(tag: .LocationView)
            break
        case .none:
            break
        }
        
    }
    
    func activeTab(tag: MainView){
        for tabSet in tabSets! {
            var isActive: Bool
            isActive = tabSet.tag == tag ? true : false
            setColors(label: tabSet.label, imageView: tabSet.image, isActive: isActive)
        }
    }
    
    func setColors(label: UILabel, imageView: UIImageView, isActive: Bool){
        if (isActive) {
            label.textColor = UIColor(named: "darkLimeGreen")
            imageView.tintColor = UIColor(named: "darkLimeGreen")
        }else {
            label.textColor = UIColor(red: 191, green: 191, blue: 191, alpha: 1)
            imageView.tintColor = UIColor(red: 191, green: 191, blue: 191, alpha: 1)
        }
        
        
    }

}
