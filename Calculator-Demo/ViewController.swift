//
//  ViewController.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var calculator : CalculatorView = {
        return CalculatorView()
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = UIColor.brownColor()
    }
    
    func addSubviews() {
        view.addSubview(calculator)
        view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .CenterX, relatedBy: .Equal, toItem: calculator, attribute: .CenterX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .Top, relatedBy: .Equal, toItem: calculator, attribute: .Top, multiplier: 1, constant: 0))
    
        
    }


}

