//
//  ViewController.swift
//  ActivityButton
//
//  Created by 李宗良 on 2019/6/17.
//  Copyright © 2019 andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: ActivityButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button1.activityColor = UIColor.red
    }

    @IBAction func start(_ sender: ActivityButton) {
        sender.showActivity = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            sender.showActivity = false
        }
    }
    
}

