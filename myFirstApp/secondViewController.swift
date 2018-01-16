//
//  secondViewController.swift
//  myFirstApp
//
//  Created by ZainAnjum on 16/01/2018.
//  Copyright © 2018 itEmpire. All rights reserved.
//

import UIKit
class secondViewController: ViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .cyan
        setupViews()
        
    }
    
    override func handelButton() {
        self.present(ViewController(), animated: true, completion: nil)
    }
}
