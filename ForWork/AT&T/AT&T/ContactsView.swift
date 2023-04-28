//
//  ContactsView.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/23.
//

import UIKit

class ContactsView: UIView {
    static let shared = ContactsView()
    
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
        let view = Bundle.main.loadNibNamed("ContactsView",
                                       owner: self,
                                       options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
//        initTableView()
        
    }
}
