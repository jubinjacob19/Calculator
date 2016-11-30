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
        view.backgroundColor = UIColor.brown
    }
    
    func addSubviews() {
        view.addSubview(calculator)
        view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .centerX, relatedBy: .equal, toItem: calculator, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .top, relatedBy: .equal, toItem: calculator, attribute: .top, multiplier: 1, constant: 0))
    
        
    }


}

