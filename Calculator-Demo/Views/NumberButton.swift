//
//  NumberButton.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

protocol NumberButtonDelegate {
    func selected(_ no:Float)
}

class NumberButton: BaseButton {
    
    fileprivate var number : Int? {
        didSet {
            self.setTitle("\(number!)", for: UIControlState())
        }
    }
    
    fileprivate var delegate : NumberButtonDelegate?
    
    convenience init(no:Int, delegate:NumberButtonDelegate) {
        self.init(frame:CGRect.zero)
        setNumber(no)
        self.delegate = delegate
    }
    
    func setNumber(_ no:Int) {
        number = no
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func clicked() {
        delegate?.selected(Float(number!))
    }
    

}
