//
//  Jitterable.swift
//  JitterAnimation
//
//  Created by Zeran Wang on 9/27/16.
//  Copyright © 2016 latte. All rights reserved.
//

import UIKit


protocol Jitterable {
    
    
}

extension Jitterable where Self: UIView {
    
    func jitter() {
        let animation = CABasicAnimation(keyPath: "positionJitter")
        animation.duration = 0.06
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        layer.add(animation, forKey: "positionJitter")
    }
    
    
}
