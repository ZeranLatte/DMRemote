//
//  PublishTitleImgView.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/17/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishTitleImgView: PublishFormBaseView {
    
    let margin: CGFloat = 20
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Title"
        return lbl
    }()
    
    var titleTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.placeholder = "Please write title here"
        return tf
    }()
    
    var imgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var imgLocalUrl: String? {
        didSet {
            if imgLocalUrl != nil {
                setimage(url: imgLocalUrl!)
            }
        }
    }
    
    var titleText: String? {
        didSet {
            if titleText != nil {
                setTitleText(text: titleText!)
            }
        }
    }
    
    override func setupSharedView() {
        super.setupSharedView()
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(titleTextField)
    }
    
    override func updateConstraints() {
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(leftMargin)
            make.top.equalTo(self).offset(margin)
            make.bottom.equalTo(self).offset(-margin)
            make.width.lessThanOrEqualTo(50).priority(.high)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.right).offset(margin)
            make.top.equalTo(imgView)
        }
        titleTextField.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(margin)
            make.bottom.equalTo(self).offset(-margin)
            make.right.equalTo(self).offset(-margin)
        }
        super.setGreylineLayout()
        super.updateConstraints()
    }
    
    
    func setTitleText(text: String) {
        titleTextField.text = text
    }
    
    func setimage(url: String) {
        // TODO: set image
        let img = UIImage(named: url)
        imgView.image = img
    }
}
