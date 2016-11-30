//
//  BaseButton.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor.gray
            } else {
                backgroundColor = UIColor.white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        layer.cornerRadius = 5.0
        clipsToBounds = true
        setTitleColor(UIColor.black, for: UIControlState())
        setTitleColor(UIColor.blue, for: .highlighted)
        addTarget(self, action: #selector(self.selectedButton(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: 44, height: 44)
    }
    
    @objc @IBAction func selectedButton(_ sender:BaseButton) {
        clicked()
    }
    
    func clicked() {
        
    }

}
