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
    
    lazy var scrollView: UIScrollView = {
        let scr = UIScrollView()
        
        return scr
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
        pubButton.addTarget(self, action: #selector(handlePub), for: .touchUpInside)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 58, right: 0))
        }
        
        let options = PublishForm.options
        print("Scroll View - ")
        print(scrollView.frame)
        for (index, opt) in options.enumerated() {
            let leftText = opt[0]
            let rightText = opt[1]
            let hasArrow = index != 3 ? true : false
            let optview = PublishFormSelectionView(leftTitle: leftText, rightTitle: rightText, withArrow: hasArrow)
            scrollView.addSubview(optview)
            optview.snp.makeConstraints({ (make) in
                make.width.centerX.equalTo(scrollView)
                make.top.equalTo(150 + index * 78)
                make.height.equalTo(78)
            })
            optview.
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func handlePub() {

    }
    
    func showSelectionTable() {
        
    }
    
    func handleBackBtn() {
        dismiss(animated: false, completion: nil)//
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
