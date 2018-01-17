//
//  PublishForm.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import Foundation

struct UserInspiration {

    static let options: [[String]] = [["Select a Style", "Modern"],
                             ["Select a Category", "Dining"],
                             ["Space size", "Compact"],
                             ["Total Price", "$1,000.00"]]
    
    
    
    var title: String = ""
    
    var description = ""
    
    var styleId: String
    var categoryId: String
    var spaceSize: String
    var totalPrice: Double
    
}


struct PublishOption {
    
    
    var title: String
    
    // either style, category, space
    var options: [String]
    
    var selectedIdx: Int = 0
    
    init(title: String, options: [String]) {
        self.title = title
        self.options = options
    }
    
}
