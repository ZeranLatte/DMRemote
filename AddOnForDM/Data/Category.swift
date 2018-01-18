//
//  IndixCategory.swift
//  DecorMatters
//
//  Created by Ryan Fister on 11/23/16.
//  Copyright © 2016 DM. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    static let categoryNameKey = "categoryName"
    static let categoryIdKey = "indixCategoryId"
    static let searchSuggestionsKey = "searchSuggestions"
    static let imageNameKey = "imageName"
    
    static let artCategoryId = "10002"
    static let diningRoomCategoryId = "18243"
    static let livingRoomCategoryId = "17006"
    static let officeCategoryId = "16566"
    static let outdoorCategoryId = "10000"
    static let bedroomCategoryId = "16703"
    static let lightingCategoryId = "10004"
    static let kidsCategoryId = "10003"
    static let accessoriesCategoryId = "10001"
    static let nurseryCategoryId = "16627"
    static let playroomCategoryId = "10005"
    static let photographyCategoryId = "10006"
    
    
    static let livingRoom =
        [categoryNameKey : "Living Room", categoryIdKey : livingRoomCategoryId, imageNameKey : "category_livingRoom"]
    
    static let diningRoom =
        [categoryNameKey : "Dining Room", categoryIdKey : diningRoomCategoryId, imageNameKey : "category_diningRoom"]
    
    static let office =
        [categoryNameKey : "Office", categoryIdKey : officeCategoryId, imageNameKey : "category_office"]
    
    static let bedroom =
        [categoryNameKey : "Bedroom", categoryIdKey : bedroomCategoryId, imageNameKey : "category_bedroom"]
    
    static let outdoor =
        [categoryNameKey : "Outdoor", categoryIdKey : outdoorCategoryId, imageNameKey : "category_outdoor"]
    
    static let accessories =
        [categoryNameKey : "Accessories", categoryIdKey : accessoriesCategoryId, imageNameKey : "category_accessories", searchSuggestionsKey : ["vase", "shelf", "tray", "cup",  "bowl", "plant", "throw", "sculpture", "curtain", "clock", "picture", "frame", "print", "pillow", "mirror", "candle", "rug", "lamp"]] as [String : Any]
    
    static let forKids =
        [categoryNameKey : "For Kids", categoryIdKey : kidsCategoryId, imageNameKey : "category_kids"]
    
    static let lighting =
        [categoryNameKey : "Lighting", categoryIdKey : lightingCategoryId, imageNameKey : "category_lighting"]

    static let allCaterogies = [Category.livingRoom,
                         Category.diningRoom,
                         Category.office,
                         Category.bedroom,
                         Category.outdoor,
                         Category.forKids,
                         Category.accessories,
                         Category.lighting
                         ]
    
    static let categoriesDict = [
        accessoriesCategoryId : [searchSuggestionsKey : ["vase", "shelf", "tray", "cup",  "bowl", "plant", "throw", "sculpture", "curtain", "clock", "picture", "frame", "print", "pillow", "mirror", "candle", "rug", "lamp"], categoryNameKey : "Accessories"],
        livingRoomCategoryId : [searchSuggestionsKey : ["Sofa", "Table", "Console", "Chair", "TV Stand", "Ottoman", "Lighting"]],
        diningRoomCategoryId : [searchSuggestionsKey : ["Table", "Chair", "Barstool", "Sideboard"]],
        officeCategoryId : [searchSuggestionsKey : ["Desk", "Chair", "Lighting", "Bookcase"], categoryNameKey : "Office"],
        bedroomCategoryId : [searchSuggestionsKey : ["Bed", "Dresser", "Lamp", "Headboard", "Nightstand", "Bedding", "Chest"], categoryNameKey : "Bedroom"],
        outdoorCategoryId : [searchSuggestionsKey : ["Tables", "Bench", "Seat", "Umbrella", "Bedswing", "Hammock", "Lighting"], categoryNameKey : "Outdoor"],
        lightingCategoryId : [searchSuggestionsKey : ["Chandelier", "Floor", "Table", "Desk", "Lamp Shades", "Tiffany", "Accent", "Art Shade", "Color Plus"], categoryNameKey : "Lighting"],
        kidsCategoryId : [searchSuggestionsKey : ["Full bed", "Twin Bed", "Bunk Bed", "Loft Bed", "Dresser", "Nightstand", "Chest", "Desk", "Chair"]],
        nurseryCategoryId : [categoryNameKey : "Nursery"],
        playroomCategoryId : [categoryNameKey : "Playroom"],
        artCategoryId : [categoryNameKey : "Art"]
        
    ] as [String : Any]
    
    class func allCategoryNames() -> [String] {
        var names = [String]()
        for category in allCaterogies {
            if let name = category[categoryNameKey] {
                names.append(name as! String)
            }
        }
        return names
    }
    
    static let friendlyCategoryNames = [
        "art" : artCategoryId,
        "living room" : livingRoomCategoryId,
        "dining room" : diningRoomCategoryId,
        "office" : officeCategoryId,
        "bedroom" : bedroomCategoryId,
        "outdoor" : outdoorCategoryId,
        "accessories" : accessoriesCategoryId,
        "kids" : kidsCategoryId,
        "for kids" : kidsCategoryId,
        "children" : kidsCategoryId,
        "for children" : kidsCategoryId,
        "lighting" : lightingCategoryId,
        "lights" : lightingCategoryId,
        "light" : lightingCategoryId
        ]
    
    class func cateNameFromId(catId: String) -> String {
        for cate in allCaterogies {
            if let id = cate[Category.categoryIdKey] as? String {
                if id == catId {
                    return cate[categoryNameKey] as! String
                }
            }
        }
        return allCategoryNames()[0]
    }
    
    class func namesForCreateFromTemp() -> [String] {
        return Array(allCategoryNames().prefix(6)).map({ (name) -> String in
            if name == "For Kids" {
                return "Kids"
            } else {
                return name.components(separatedBy: " ").first ?? name
            }
        })
    }

}

