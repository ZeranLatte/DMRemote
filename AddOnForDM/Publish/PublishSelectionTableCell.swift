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
    
    func configure(option: PublishForm.Option) {
        
        
        if let num = option.number {
            // TODO: special treat price
        } else {
            titleLabel.text = option.name.capitalized
        }
        
    }
    
}


class PublishSelectionHeader: UITableViewHeaderFooterView {
    
    let leftMargin: CGFloat = 11
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .black
        return lbl
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    override func updateConstraints() {
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: leftMargin, bottom: 0, right: 0))
            make.height.equalTo(44).priority(.medium)
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(label)
        
    }
    
    func configure(titleText: String) {
        label.text = titleText
    }
    
}
