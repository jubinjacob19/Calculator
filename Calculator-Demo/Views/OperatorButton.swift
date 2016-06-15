//
//  OperatorButton.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

protocol OperatorButtonDelegate {
    func selected(kOperator:Operator)
}

class OperatorButton: BaseButton {
    
    private var delegate : OperatorButtonDelegate?
    
    private var optr : Operator? {
        didSet {
            self.setTitle(optr?.stringRepresentation, forState: .Normal)
        }
    }
    
    convenience init(koperator:Operator, delegate:OperatorButtonDelegate) {
        self.init(frame:CGRectZero)
        setOperator(koperator)
        self.delegate = delegate
    }
    
    func setOperator(koperator:Operator) {
        optr = koperator
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func clicked() {
        delegate?.selected(optr!)
    }

}
