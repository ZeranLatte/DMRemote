//
//  PublishFormViewController.swift
//  AddOnForDM
//
//  Created by ZZZZeran on 1/15/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishFormViewController: UIViewController {
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("<", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    lazy var pubButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Publish", for: .normal)
        btn.backgroundColor = .black
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNav()
        setupUI()
    }

    
    func setupNav() {
        backBtn.addTarget(self, action: #selector(handleBackBtn), for: .touchUpInside)
        let baritem = UIBarButtonItem(customView: backBtn)
        navigationItem.leftBarButtonItem = baritem
        
        if #available(iOS 11, *) {
            backBtn.snp.makeConstraints({ (make) in
                make.size.equalTo(40)
            })
        }
    }
    
    func setupUI() {
        view.addSubview(pubButton)
        pubButton.snp.makeConstraints { (make) in
            make.height.equalTo(58)
            make.left.right.bottom.equalTo(view)
        }
        
    }
    
    
    func handleBackBtn() {
        dismiss(animated: false, completion: nil)//
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
