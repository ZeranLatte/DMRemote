//
//  PublishFormSelectionView.swift
//  AddOnForDM
//
//  Created by ZZZZeran on 1/15/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit
import SnapKit

/// Base view in publish user inspiration
class PublishFormBaseView: UIView {
    let leftMargin: CGFloat = 11
    lazy var greyline: UIView = {
        let gl = UIView()
        gl.backgroundColor = UIColor.lightGray
        return gl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSharedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSharedView() {
        addSubview(greyline)
    }
    
    func setGreylineLayout() {
        greyline.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(leftMargin)
            make.right.bottom.equalTo(self)
            make.height.equalTo(0.5)
        }
    }
    
}

class PublishFormSelectionView: PublishFormBaseView {
    
    // callback connection to viewcontroller
    var tapped: ((_ title: String) -> Void)?
    
    let rightMargin: CGFloat = 21
    
    var defaultTextColor = UIColor.black

    // left
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    // right
    lazy var optionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var arrow: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "arrow2")
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    
    init(leftTitle: String, rightTitle: String, withArrow: Bool = true) {
        super.init(frame: CGRect.zero)
        setupUI()
        
        setLeftTitle(text: leftTitle)
        setRightTitle(text: rightTitle)
        arrow.isHidden = !withArrow
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }
    
    override func updateConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftMargin)
            make.top.bottom.equalTo(self)
            make.right.equalTo(self.snp.centerX).offset(-50)
        }
        arrow.snp.makeConstraints { (make) in
            make.rightMargin.equalTo(-rightMargin)
            make.top.bottom.equalTo(self)
            make.width.equalTo(20)
        }
        
        optionLabel.snp.makeConstraints { (make) in
            make.right.equalTo(arrow.snp.left).offset(-10)
            make.top.bottom.equalTo(self)
            make.left.equalTo(self.snp.centerX).offset(60)
        }

        super.setGreylineLayout()
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(optionLabel)
        addSubview(arrow)
    }
    
    func setRightTitle(text: String) {
        optionLabel.text = text
    }
    
    func setLeftTitle(text: String) {
        titleLabel.text = text
    }
    
    func handleTap() {
        guard let title = titleLabel.text else {
            return
        }
        if let callback = tapped {
            callback(title)
        }
    }
}
