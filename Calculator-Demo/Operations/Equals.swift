//
//  Equals.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import Foundation

struct Equals : Operator {
    func evaluate(lhs: Float, rhs: Float) -> Float {
        return Float(rhs)
    }
    var stringRepresentation = "="
}