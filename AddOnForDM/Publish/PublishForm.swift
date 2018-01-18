//
//  PublishForm.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import Foundation

struct PublishForm {
    
    struct Option {
        var id: String
        var name: String
    }

    static let options: [[String]] = [["Select a Style", "Modern"],
                             ["Select a Category", "Dining"],
                             ["Space size", "Compact"],
                             ["Total Price", "$1,000.00"]]
    
    
    
    var title: String = ""
    
    var description = ""
    
    var styleId: String = ""
    var categoryId: String = ""
    var totalPrice: Double = 0
    
    var size: String = ""
    
    
    func allOptions() -> [PublishOption] {
        var result: [PublishOption] = []
        
        // style
        let styles = Style.allStyles.map { (style) -> Option in
            let id = style[Style.styleIdKey] as! String
            let name = style[Style.styleNameKey] as! String
            let opt = Option(id: id, name: name)
            return opt
        }
        let styleOption = PublishOption(title: "Select a Style", options: styles)
        result.append(styleOption)
        
        // exclude 'accessory' and 'lighting'
        let spaceOptions = Array(Category.allCaterogies.prefix(6)).map { (cate) -> Option in
            let id = cate[Category.categoryIdKey] as! String
            let name = cate[Category.categoryNameKey] as! String
            let opt = Option(id: id, name: name)
            return opt
        }
        let cateOption = PublishOption(title: "Select a Category", options: spaceOptions)
        result.append(cateOption)
        
        // space size
        let sizes = ["Compact", "Medium", "Large", "Luxury"]
        let opts = generateSpaceSizes(spaceSizes: sizes)
        let spaceSizeOption = PublishOption(title: "Select a Space Size", options: opts)
        result.append(spaceSizeOption)
        
        // price
        let priceOption = PublishOption(title: "Total Price", options: [])
        result.append(priceOption)
        
        return result
    }
    
    
    private func generateSpaceSizes(spaceSizes: [String]) -> [Option] {
        var result: [Option] = []
        for sps in spaceSizes {
            let opt = Option(id: "spaceSize", name: sps)
            result.append(opt)
        }
        return result
    }
}


struct PublishOption {
    
    
    var title: String
    
    // either all-styles, all-categorys, all-spaces
    var options: [PublishForm.Option]
    
    var selectedIdx: Int = 0
    
    init(title: String, options: [PublishForm.Option]) {
        self.title = title
        self.options = options
    }
    
    
    func allNames() -> [String] {
        return []
    }
    
}
