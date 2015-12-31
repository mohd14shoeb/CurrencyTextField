//
//  AppDelegate.swift
//  CurrencyTextField
//
//  Created by Andre Silva on 12/30/2015.
//  Copyright (c) 2015 Andre Silva. All rights reserved.
//

import UIKit

public enum CurrencyTextFieldPosition{
    case None
    case Start
    case End
}

public class CurrencyTextField: UITextField {

    public var monetaryDouble: Double = 0.0
    public var currency = "$"
    public var decimalMark = ","
    public var separadorMark = "."
    public var validNumbers = ["0","1","2","3","4","5","6","7","8","9"]
    public var showSeparatorMark = true
    public var hideZeroValue = true
    public var currencyPosition: CurrencyTextFieldPosition = .Start
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
         self.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    public var monetaryString: String {
        return String(format:"%.2f", monetaryDouble)
    }

}

extension CurrencyTextField: UITextFieldDelegate {

    public func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text?.count == 0 {
            monetaryDouble = 0.0
            updateTextValue()
        }
    }
    
    public func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if monetaryDouble.isZero && hideZeroValue {
            textField.text = ""
        }
        return true
    }
    
    public func textFieldShouldClear(textField: UITextField) -> Bool {
        monetaryDouble = 0.0
        return false
    }
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let factorIncreasing = 10.0
        let factorDecrease = 0.01
        if validNumbers.contains(string) && textField.text?.removeNonNumbers().count < 15 {
            monetaryDouble *= factorIncreasing
            monetaryDouble += Double(string.intValue) * factorDecrease
            updateTextValue()
        }
        else if string.count == 0 && range.length > 0 {
            monetaryDouble /= factorIncreasing
            monetaryDouble.removeLastDecimalNumber()
            updateTextValue()
        }
        return false
    }
    
    private func updateTextValue(){
        if let value = monetaryDouble.printableCurrency(decimalMark,
                                                       separadorMark: separadorMark,
                                                       useSeparator: showSeparatorMark){
            switch currencyPosition {
            case .End: text = value + currency.spaceLeft
            case .Start: text = currency.spaceRight + value
            case .None: text = value
            }
        }
    }
    
}