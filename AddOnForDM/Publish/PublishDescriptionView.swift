//
//  PublishDescriptionView.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishDescriptionView: UIView {
    // callback connection to viewcontroller
    var tapped: (() -> Void)?
    let leftMargin: CGFloat = 11
    let margin: CGFloat = 20
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var desLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.lightText
        return lbl
    }()
    lazy var greyline: UIView = {
        let gl = UIView()
        gl.backgroundColor = UIColor.lightGray
        return gl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(desLabel)
        addSubview(greyline)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftMargin)
            make.top.equalTo(margin)
            make.bottom.equalTo(self.snp.centerY).offset(-5)
            make.right.equalTo(self.snp.centerX)
        }
        desLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(self.snp.centerY).offset(5)
            make.right.equalTo(-margin)
            make.bottom.equalTo(-margin)
        }
        greyline.snp.makeConstraints { (make) in
            make.left.equalTo(leftMargin)
            make.right.bottom.equalTo(self)
            make.height.equalTo(1)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }
    
    func handleTap() {
        if let callback = tapped {
            callback()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
