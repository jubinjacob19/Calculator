//
//  Divide.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import Foundation

struct Divide : Operator {
    func evaluate(_ lhs: Float, rhs: Float) -> Float {
        if rhs != 0 {
            return Float(lhs / rhs)
        } else {
            return 0 //return infinity here
        }
    }
    var stringRepresentation = "/"
    
}
