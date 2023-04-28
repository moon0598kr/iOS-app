//
//  MainViewManager.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/28.
//

import Foundation

class MainViewManager: NSObject {
    static let shared = MainViewManager()
    
    var activeTab: MainView = .GroupsView
    
}
