//
//  ViewController.swift
//  ActivityButton
//
//  Created by 李宗良 on 2019/6/17.
//  Copyright © 2019 andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: ActivityButton) {
        sender.activityColor = UIColor.red
        sender.showActivity = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            sender.showActivity = false
        }
    }
    
}

