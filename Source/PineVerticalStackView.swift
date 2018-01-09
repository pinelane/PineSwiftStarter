//
//  PineVerticalStackView.swift
//  PineSwiftStarter
//
//  Created by Prakash Raman on 09/01/18.
//  Copyright © 2018 Prakash Raman. All rights reserved.
//

import UIKit
import EasyPeasy

open class PineVerticalStackView: UIStackView {

    public init(){
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        self.alignment = .leading
        self.axis = .vertical
        self.distribution = .equalSpacing
        self.spacing = 0
    }
    
    open func getSpacer(_ height: CGFloat = 5) -> UIView {
        let v = UIView()
        v.easy.layout(Height(height))
        return v
    }
    
    open func insertSpacer(_ height: CGFloat = 5) {
        self.addArrangedSubview(getSpacer(height))
    }
    
    open func clearSubViews(){
        for v in subviews {
            self.removeArrangedSubview(v)
            v.removeFromSuperview()
        }
    }
    
    open func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }

}
