//
//  ViewController.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/07.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        
        label.textColor = .red
        label.text = "Hello World"
        label.textAlignment = .center
        view.addSubview(label)
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }
}

