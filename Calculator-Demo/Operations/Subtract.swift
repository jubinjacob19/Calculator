//
//  Subtract.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import Foundation

struct Subtract : Operator {
    func evaluate(lhs: Float, rhs: Float) -> Float {
        return Float(lhs - rhs)
    }
    var stringRepresentation = "-"
    
}