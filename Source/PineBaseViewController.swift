//
//  PineBaseViewController.swift
//  PineSwiftStarter
//
//  Created by Prakash Raman on 08/01/18.
//  Copyright © 2018 Prakash Raman. All rights reserved.
//

import UIKit

open class PineBaseViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    open func setup(){
        print("Setting up the View Controller")
    }
}
