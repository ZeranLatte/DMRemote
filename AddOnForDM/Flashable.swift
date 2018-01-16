//
//  Flashable.swift
//  JitterAnimation
//
//  Created by Zeran Wang on 9/27/16.
//  Copyright © 2016 latte. All rights reserved.
//

import UIKit

protocol Flashable {
    
    
}


extension Flashable where Self: UIView {
    
    
    func flash() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            
            self.alpha = 1.0
            
        }) { (animationComplete) in
            if animationComplete {
                UIView.animate(withDuration: 1.0, delay: 3, options: .curveEaseOut, animations: {
                    self.alpha = 0
                    
                    }, completion: { (fadeOutComplete) in
                        print("fade out finished")
                })
            }
            
        }
        
        
    }

    
}
