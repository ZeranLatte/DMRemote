//
//  PublishDescriptionView.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit

class PublishDescriptionView: PublishFormBaseView {
    // callback connection to viewcontroller
    var tapped: (() -> Void)?

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

    override func setupSharedView() {
        super.setupSharedView()
        addSubview(titleLabel)
        addSubview(desLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }
    
    override func updateConstraints() {
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
        super.setGreylineLayout()
        super.updateConstraints()
    }
    
    func handleTap() {
        if let callback = tapped {
            callback()
        }
    }

}
