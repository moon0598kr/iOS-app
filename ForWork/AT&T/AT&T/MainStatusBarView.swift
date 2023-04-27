//
//  MainStatusBarView.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/23.
//

import UIKit

class MainStatusBarView: UIView {
    static let shared = MainStatusBarView()
    
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
        // xibSetup() // 하면 storyboard에서 실시간(컴파일타임)에 inspector창에서 변경해도 확인 불가
    }
    
    func addObserver() {
//        NotificationCenter.default .addObserver(self, selector: #selector(onUpdate), name: NSNotification.Name("aa"), object: nil)
    }

    private func loadView() {
        let view = Bundle.main.loadNibNamed("MainStatusBarView",
                                       owner: self,
                                       options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
//        NotificationCenter.default .addObserver(self, selector: #selector(onUpdate), name: NSNotification.Name("aa"), object: nil)
    }
    
//    func loadViewFromNib(nib: String) -> UIView? {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: nib, bundle: bundle)
//        return nib.instantiate(withOwner: self, options: nil).first as? UIView
//    }
    

}
