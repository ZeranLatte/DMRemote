//
//  ViewController.swift
//  JitterAnimation
//
//  Created by Zeran Wang on 9/27/16.
//  Copyright © 2016 latte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jitterBtn: JitterButton!
    
    
    
    
    @IBOutlet weak var inputTF1: JitterTF!
    
    @IBOutlet weak var inputTF2: JitterTF!
    
    
    
    @IBOutlet weak var fadeLabel: FadeLabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func handleTap(sender: UIButton) {
        
        
        self.fadeLabel.flash()
        self.inputTF1.jitter()
        self.inputTF2.jitter()
        self.jitterBtn.jitter()
    }
    
    


}

