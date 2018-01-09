//
//  PineBaseViewController.swift
//  PineSwiftStarter
//
//  Created by Prakash Raman on 08/01/18.
//  Copyright © 2018 Prakash Raman. All rights reserved.
//

import UIKit
import EasyPeasy

open class PineBaseViewController: UIViewController {
    
    var kStackView : PineVerticalStackView? = nil
    var kScrollView : UIScrollView? = nil

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
        self.setupNavigationButtons()
    }
    
    func setupNavigationButtons(){
        if let image = self.getPrefferedLeftBarImage() {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.getPrefferedLeftBarAction(sender:)))
        }
        
        self.navigationItem.rightBarButtonItem = nil
        
        if let image = self.getPrefferedRightBarImage() {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.getPrefferedRightBarAction(sender:)))
        }
        
        if let button = self.getPrefferedRightBarButton() {
            self.navigationItem.rightBarButtonItem = button
            if button.customView != nil {
                (button.customView as! UIControl).addTarget(self, action: #selector(self.getPrefferedRightBarAction(sender:)), for: .touchUpInside)
            }
        }
    }
    
    open func getPrefferedLeftBarImage() -> UIImage? {
        return nil
    }
    
    open func getPrefferedRightBarButton() -> UIBarButtonItem? {
        return nil
    }
    
    open func getPrefferedRightBarImage() -> UIImage? {
        return nil
    }
    
    @objc open func getPrefferedLeftBarAction(sender: AnyObject? = nil){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc open func getPrefferedRightBarAction(sender: AnyObject? = nil){
        print("looking for the right button action")
    }
    
    /* STACK VIEWS */
    open func setupStackView(){
        if kStackView != nil { fatalError("Seems that the stack view has already been iniitalized. Did you call both setupStackView and setupScrollableStackView? You should not!") }
        self.kStackView = PineVerticalStackView()
        self.view.addSubview(kStackView!)
        let top = self.navigationController == nil ? 0 : (self.navigationController!.navigationBar.frame.height + 20)
        kStackView!.easy.layout(Left(), Top(top), Right())
    }
    
    open func setupScrollableStackView(){
        if kStackView != nil { fatalError("Seems that the stack view has already been iniitalized. Did you call both setupStackView and setupScrollableStackView? You should not!") }
        self.kScrollView = UIScrollView()
        self.kStackView = PineVerticalStackView()
        self.view.addSubview(kScrollView!)
        self.kScrollView!.addSubview(kStackView!)
        self.kScrollView!.easy.layout(Edges())
        self.kStackView!.easy.layout(Top(), Left(), Bottom(), Width().like(self.view))
        
    }
    
    open func getStackView() -> PineVerticalStackView? {
        return kStackView
    }
    
    open func getScrollView() -> UIScrollView? {
        return kScrollView
    }
}
