//
//  ViewController.swift
//  AddOnForDM
//
//  Created by Zeran Wang on 1/15/18.
//  Copyright © 2018 Zeran Wang. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    var pbButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Publish", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.blue, for: .highlighted)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 0.8
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(pbButton)
        pbButton.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(90)
            make.width.greaterThanOrEqualTo(50)
            make.bottom.equalTo(view).offset(-50)
            make.height.equalTo(50)
            make.centerX.equalTo(view).priority(.required)
        }
        pbButton.addTarget(self, action: #selector(handleBtn), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleBtn() {
        let formVC = PublishFormViewController()
        let nav = UINavigationController(rootViewController: formVC)
        present(nav, animated: true, completion: nil)
    }

}

