//
//  CalculatorView.swift
//  Calculator-Demo
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import UIKit

class CalculatorView: UIView, NumberButtonDelegate, OperatorButtonDelegate,ClearButtonDelegate {
    
    
    var lhs : Float?
    var rhs : Float?
    var oprtr : Operator?
    
    
    let numbers : [Int] = [1,2,3,4,5,6,7,8,9]
    let operators : [Operator] = [Add(),Subtract(),Multiply(),Divide()]
    
    lazy var numberButtons : [NumberButton] = {
        return self.numbers.map { (number) -> NumberButton in
            return  NumberButton(no: number,delegate:self)
        }
    } ()
    
    lazy var operatorButtons : [OperatorButton] = {
        return self.operators.map { (oprtr) -> OperatorButton in
            return OperatorButton(koperator: oprtr,delegate:self)
        }
    } ()
    
    lazy var oneToNineContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44 * 3 + 2*self.padding))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44 * 3 + 2*self.padding))
        return view
    } ()
    
    lazy var clear : ClearButton = {
        return ClearButton(delegate : self)
    } ()
    
    lazy var zero : NumberButton = {
        return NumberButton(no: 0,delegate:self)
    } ()
    
    lazy var equalsButton : OperatorButton = {
        return OperatorButton(koperator: Equals(),delegate:self)
    } ()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    lazy var resultLabel : UILabel = {
        let field = UILabel()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.text = "0"
        field.backgroundColor = UIColor.whiteColor()
        field.layer.cornerRadius = 5.0
        field.clipsToBounds = true
        field.accessibilityIdentifier = "Result"
        return  field
    } ()
    
    let padding : CGFloat = 20
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        
        let views = ["cntnr":containerView,"field":resultLabel,"one":oneToNineContainer]
        
        addSubview(containerView)
        addSubview(resultLabel)
        containerView.addSubview(oneToNineContainer)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[cntnr]|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        let width = 44 * 4 + padding * 3
        let metrics = ["width":width]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[field(==width)]", options: NSLayoutFormatOptions(rawValue:0), metrics: metrics, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(20)-[field(==44)]-(20)-[cntnr]|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[one]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[one]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        
        for (index, button) in numberButtons.enumerate() {
            let xPos : CGFloat = CGFloat(index%3)
            let yPos : CGFloat = CGFloat(abs( (index/3) - 2))
            oneToNineContainer.addSubview(button)
            oneToNineContainer.addConstraint(NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: oneToNineContainer, attribute: .Leading, multiplier: 1, constant: (44 * xPos) + xPos*padding))
            oneToNineContainer.addConstraint(NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: oneToNineContainer, attribute: .Top, multiplier: 1, constant: (44 * yPos) + yPos*padding))
        }
        
        for (index,button) in operatorButtons.enumerate() {
            let yPos = CGFloat(index)
            containerView.addSubview(button)
            containerView.addConstraint(NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: containerView, attribute: .Leading, multiplier: 1, constant: (44 * 3) + 3*padding))
            containerView.addConstraint(NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1, constant: (44 * yPos) + yPos*padding))
            
        }
        
        addSubview(zero)
        addSubview(clear)
        addSubview(equalsButton)
        let btnViews = ["zero":zero,"clr":clear,"one":oneToNineContainer,"equ":equalsButton]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[zero]-(20)-[clr]-(20)-[equ]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: btnViews))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[one]-(20)-[zero]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: btnViews))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[one]-(20)-[clr]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: btnViews))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[one]-(20)-[equ]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: btnViews))
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(300, 500)
    }
    
    func selected(no: Float) {
        if oprtr == nil {
            if lhs == nil  {
                lhs = no
            } else  {
                let text = (resultLabel.text)! + "\(no)"
                lhs = Float(text)
            }
            resultLabel.text = "\(Int(lhs!))"
        } else {
            if rhs == nil  {
                rhs = no
            } else  {
                let text = (resultLabel.text)! + "\(no)"
                rhs = Float(text)
            }
            resultLabel.text = "\(Int(rhs!))"
        }
        
    
    }
    
    func selected(kOperator: Operator) {
        if(lhs != nil) { // proceed if lhs is non nil.
            if rhs == nil {
                oprtr = kOperator
            } else {
                lhs = oprtr?.evaluate(lhs!, rhs: rhs!)
                oprtr = kOperator
                let text = lhs?.isInteger() == true ? "\(Int(lhs!))" : "\(lhs!)"
                resultLabel.text = text
                rhs = nil
            }
        }
    }
    
    func clearField() {
        if rhs != nil {
            rhs = nil
            resultLabel.text = "0"
        } else if oprtr != nil {
            oprtr = nil
        } else {
            lhs = nil
            resultLabel.text = "0"
        }
    }
    
    
}
