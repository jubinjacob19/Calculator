//
//  BaseButton.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = UIColor.grayColor()
            } else {
                backgroundColor = UIColor.whiteColor()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.whiteColor()
        layer.cornerRadius = 5.0
        clipsToBounds = true
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        setTitleColor(UIColor.blueColor(), forState: .Highlighted)
        addTarget(self, action: #selector(self.selectedButton(_:)), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(44, 44)
    }
    
    @objc @IBAction func selectedButton(sender:BaseButton) {
        clicked()
    }
    
    func clicked() {
        
    }

}
