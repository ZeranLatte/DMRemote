//
//  PublishDescriptionInputVC.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit
import SnapKit

class PublishDescriptionInputVC: UIViewController, UITextViewDelegate {
    
    var textView: UITextView = {
        let tv = UITextView()
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    func setup() {
        // navigation
        
        
        // TextView
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        textView.delegate = self
    }
    
    
    
    
    
    // MARK: UITextView delegate
    func textViewDidChange(_ textView: UITextView) {
        
        
    }
    
    
    
}
