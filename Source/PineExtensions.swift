//
//  PineExtensions.swift
//  PineSwiftStarter
//
//  Created by Prakash Raman on 11/01/18.
//  Copyright © 2018 Prakash Raman. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func addSubviews(_ views : UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}

