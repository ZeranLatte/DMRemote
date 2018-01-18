//
//  PublishFormViewController.swift
//  AddOnForDM
//
//  Created by ZZZZeran on 1/15/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishFormViewController: UIViewController {
    
    // TODO: UserIns data model
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow2"), for: .normal)
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
    
    lazy var titleImgView: PublishTitleImgView = {
        let tiv = PublishTitleImgView()
        return tiv
    }()
    
    lazy var desView: PublishDescriptionView = {
        let dv = PublishDescriptionView()
        return dv
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
            scrollView.contentInsetAdjustmentBehavior = .always
        }
    }
    
    func setupUI() {
        view.addSubview(scrollView)
        view.addSubview(pubButton)
        pubButton.snp.makeConstraints { (make) in
            make.height.equalTo(58)
            make.left.right.bottom.equalTo(view)
        }
        pubButton.addTarget(self, action: #selector(handlePub), for: .touchUpInside)
        scrollView.contentInset.bottom = 58
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
                
        // description view
        scrollView.addSubview(desView)
        
        // title and image view
        scrollView.addSubview(titleImgView)
        
        desView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view).offset(0)
            make.top.equalTo(titleImgView.snp.bottom)
            make.height.equalTo(100)
        }
        let desTextTap = UITapGestureRecognizer(target: self, action: #selector(showDescriptionInput))
        desView.addGestureRecognizer(desTextTap)
        
        
        titleImgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(desView)
            make.top.equalTo(scrollView).offset(5)
            make.height.equalTo(100)
        }
        titleImgView.imgLocalUrl = "arrow2"
        titleImgView.titleTextField.delegate = self
        titleImgView.titleText = "arrow2"
        let options = PublishForm.options
        
        var lastview: UIView = desView
        for (index, opt) in options.enumerated() {
            let leftText = opt[0]
            let rightText = opt[1]
            let hasArrow = index != 3 ? true : false
            let optview = PublishFormSelectionView(leftTitle: leftText, rightTitle: rightText, withArrow: hasArrow)
            scrollView.addSubview(optview)
            optview.snp.makeConstraints({ (make) in
                make.width.centerX.equalTo(scrollView)
                make.top.equalTo(lastview.snp.bottom)
                make.height.equalTo(90)
            })
            optview.tapped = { [weak self] title in
                print("\(index) === \(title)")
                self?.showSelectionTable()
            }
            lastview = optview
        }
        
        scrollView.contentSize = view.bounds.size
    }
    
    func showSelectionTable() {
        let selectionTable = PublishSelectTableVC()
        let styles = ["Modern", "Modern", "Modern", "Modern", "Modern", "Industrial", "Industrial"] // all styles names
        var pubOption = PublishOption(title: "Select a Style", options: styles)
        selectionTable.modalPresentationStyle = .overCurrentContext

        present(selectionTable, animated: true) {
            
        }
        // TODO: set selected index or data in option
        pubOption.selectedIdx = 1
        selectionTable.dataSrc = pubOption
        selectionTable.selectCallback = { [weak self] (idx, title) in
            // TODO: update UserInspiration data
        }
    }
    
    func handleBackBtn() {
        dismiss(animated: false, completion: nil)
    }
    
    func showDescriptionInput() {
        let vc = PublishDescriptionInputVC()
        vc.textChanged = { [unowned self] text in
            // TODO: update UserIns data
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: send publish request
    func handlePub() {
        // TODO: gather data
        
        // handle empty title text
        
        // handle empty description
        
        
        
        
    }
    
}

extension PublishFormViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
