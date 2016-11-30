//
//  ClearButton.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

protocol ClearButtonDelegate {
    func clearField()
}

class ClearButton: BaseButton {

    var delegate : ClearButtonDelegate?
    
    convenience init(delegate:ClearButtonDelegate) {
        self.init(frame:CGRect.zero)
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("C", for: UIControlState())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func clicked() {
        delegate?.clearField()
    }

}
