//
//  PublishSelectionTableCell.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
}

class PublishSelectionTableCell: BaseTableViewCell {
    
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = UIColor.lightGray
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func setup() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
            make.height.equalTo(46)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        if selected {
            contentView.backgroundColor = UIColor.yellow
        } else {
            contentView.backgroundColor = UIColor.white
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
}


class PublishSelectionTitleCell: BaseTableViewCell {
    
    let leftMargin: CGFloat = 11
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    override func setup() {
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: leftMargin, bottom: 0, right: 100))
            make.height.equalTo(44)
        }
    }
    
    func configure(titleText: String) {
        label.text = titleText
    }
    
}
