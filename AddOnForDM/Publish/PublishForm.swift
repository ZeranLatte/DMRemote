//
//  PublishForm.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/16/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import Foundation

struct PublishForm {
    
    
    // data abstraction for style, category, space size, price selection for user inspiration
    struct Option {
        let id: String
        let name: String
        
        var number: Double? = nil
        
        init(id: String, name: String, number: Double? = nil) {
            self.id = id
            self.name = name
            self.number = number
        }
    }
    
    init() {
        
    }
    
    func allOptions() -> [PublishOption] {
        var result: [PublishOption] = []
        
        // style
        let styles = Style.allStyles.map { (style) -> Option in
            let id = style[Style.styleIdKey] as! String
            let name = style[Style.styleNameKey] as! String
            let opt = Option(id: id, name: name)
            return opt
        }
        let styleOption = PublishOption(type: .style, options: styles)
        result.append(styleOption)
        
        // exclude 'accessory' and 'lighting'
        let spaceOptions = Array(Category.allCaterogies.prefix(6)).map { (cate) -> Option in
            let id = cate[Category.categoryIdKey] as! String
            let name = cate[Category.categoryNameKey] as! String
            let opt = Option(id: id, name: name)
            return opt
        }
        let cateOption = PublishOption(type: .category, options: spaceOptions)
        result.append(cateOption)
        
        // space size
        let sizes = ["Compact", "Medium", "Large", "Luxury"]
        let opts = generateSpaceSizes(spaceSizes: sizes)
        let spaceSizeOption = PublishOption(type: .size, options: opts)
        result.append(spaceSizeOption)
        
        // price
        let priceOpt = Option(id: "price", name: "price", number: 1900.0)
        let priceOption = PublishOption(type: .price, options: [priceOpt])
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
    
    enum OptionType: String {
        case style = "style"
        case category = "category"
        case size = "size"
        case price = "price"
    }
    
    let type: OptionType
    
    // either all-styles, all-categorys, all-spaces
    let options: [PublishForm.Option]
    
    var selectedIdx: Int = 0
    
    init(type: OptionType, options: [PublishForm.Option]) {
        self.type = type
        self.options = options
    }
    
    
    func getTitle() -> String {
        switch type {
        case .category:
            return "Select a Category"
        case .style:
            return "Select a Style"
        case .size:
            return "Space Size"
        default: // price
            return "Total Price"
        }
    }
    
    func allNames() -> [String] {
        return []
    }
    
}
