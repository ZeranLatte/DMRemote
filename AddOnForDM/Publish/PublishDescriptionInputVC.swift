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
    
    var savedText: String?
    
    var textChanged: ((_ text: String) -> Void)?
    
    var textView: UITextView = {
        let tv = UITextView()
        tv.textColor = .black
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    
    
    func updateTextForTV(text: String) {
        textView.text = text
    }
    
    
    // MARK: UITextView delegate
    func textViewDidChange(_ textView: UITextView) {
        if let callback = textChanged {
            callback(textView.text)
        }
        
    }
    
    
    
}
