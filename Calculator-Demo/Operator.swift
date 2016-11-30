//
//  Operator.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import Foundation

protocol Operator {
    func evaluate(_ lhs:Float, rhs:Float) -> Float
    var stringRepresentation : String {get}
}

extension Float {
    func isInteger()->Bool {
        return floor(self) == self
    }
}
