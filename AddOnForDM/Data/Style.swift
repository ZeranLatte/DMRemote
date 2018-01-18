//
//  Style.swift
//  DecorMatters
//
//  Created by Ryan Fister on 3/16/17.
//  Copyright © 2017 DM. All rights reserved.
//

import UIKit

class Style: NSObject {
    
    static let styleNameKey = "styleName"
    static let styleIdKey = "styleId"
    static let imageNameKey = "imageName"
    
    static let modern =
        [styleNameKey : "Modern", styleIdKey : "modern", imageNameKey : "modernCategory"] as [String : Any]
    static let traditional =
        [styleNameKey : "Traditional", styleIdKey : "traditional", imageNameKey : "traditionalCategory"] as [String : Any]
    static let industrial =
        [styleNameKey : "Industrial", styleIdKey : "industrial", imageNameKey : "industrialCategory"] as [String : Any]
    static let eclectic =
        [styleNameKey : "Eclectic", styleIdKey : "eclectic", imageNameKey : "eclecticCategory"] as [String : Any]
    static let mediterranean =
        [styleNameKey : "Mediterranean", styleIdKey : "mediterranean", imageNameKey : "mediterraneanCategory"] as [String : Any]
    static let rustic =
        [styleNameKey : "Rustic", styleIdKey : "rustic", imageNameKey : "rusticCategory"] as [String : Any]
    static let scandinavian =
        [styleNameKey : "Scandinavian", styleIdKey : "scandinavian", imageNameKey : "scandinavianCategory"] as [String : Any]
    static let victorian =
        [styleNameKey : "Victorian", styleIdKey : "victorian", imageNameKey : "victorianCategory"] as [String : Any]
    static let asian =
        [styleNameKey : "Asian", styleIdKey : "asian", imageNameKey : "asianCategory"] as [String : Any]
    static let midcentury =
        [styleNameKey : "Midcentury", styleIdKey : "midcentury", imageNameKey : "midcenturyCategory"] as [String : Any]
    static let tropical =
        [styleNameKey : "Tropical", styleIdKey : "tropical", imageNameKey : "tropicalCategory"] as [String : Any]
    static let southwestern =
        [styleNameKey : "Southwestern", styleIdKey : "southwestern", imageNameKey : "southwesternCategory"] as [String : Any]
    static let farmhouse =
        [styleNameKey : "Farmhouse", styleIdKey : "farmhouse", imageNameKey : "farmhouseCategory"] as [String : Any]
    static let transitional =
        [styleNameKey : "Transitional", styleIdKey : "transitional", imageNameKey : "transitionalCategory"] as [String : Any]
    
    static let allStyles = [modern, traditional, industrial, eclectic, mediterranean, rustic, scandinavian, victorian, asian, midcentury, tropical, southwestern, farmhouse, transitional]
    
    class func allStyleNames() -> [String] {
        var styles = [String]()
        for style in allStyles {
            if let name = style[styleNameKey] as? String {
                styles.append(name)
            }
        }
        return styles
    }
}
