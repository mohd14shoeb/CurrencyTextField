//
//  AppDelegate.swift
//  CurrencyTextField
//
//  Created by Andre Silva on 12/30/2015.
//  Copyright (c) 2015 Andre Silva. All rights reserved.
//

import UIKit

extension Double {
    
    func printableCurrency(decimalMark: String, separadorMark: String, useSeparator: Bool) -> String? {
        let currencyFormatter = NSNumberFormatter();
        currencyFormatter.numberStyle = .CurrencyStyle
        currencyFormatter.currencySymbol = ""
        currencyFormatter.usesGroupingSeparator = useSeparator
        currencyFormatter.decimalSeparator = decimalMark
        currencyFormatter.groupingSeparator = separadorMark
        return currencyFormatter.stringFromNumber(NSNumber(double: self))
    }
    
    mutating func removeLastDecimalNumber() {
       var value = String(format:"%.3f", self)
       value.removeLastCharacter()
       self = (value as NSString).doubleValue
    }

}