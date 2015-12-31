//
//  AppDelegate.swift
//  CurrencyTextField
//
//  Created by Andre Silva on 12/30/2015.
//  Copyright (c) 2015 Andre Silva. All rights reserved.
//

import UIKit

enum AtomicPunctuation: String{
    case Space = " "
    case BracketOpen = "("
    case BracketClose = ")"
    case Semicolon = ";"
    case Comma = ","
    case Quotation = "'"
    case BreakLine = "\n"
}

extension String {
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    var intValue: Int {
        return (self as NSString).integerValue
    }
    
    var count: Int{
        return self.characters.count
    }
    
    var spaceLeft: String {
        return AtomicPunctuation.Space.rawValue + self
    }
    
    var spaceRight: String {
        return self + AtomicPunctuation.Space.rawValue
    }
    
    var spaceLateralSides: String {
        return AtomicPunctuation.Space.rawValue + self + AtomicPunctuation.Space.rawValue
    }
    
    var quotationMarks: String{
        return AtomicPunctuation.Quotation.rawValue + self + AtomicPunctuation.Quotation.rawValue
    }
    
    var bracketMarks: String{
        return AtomicPunctuation.BracketOpen.rawValue + self + AtomicPunctuation.BracketClose.rawValue
    }
    
    mutating func removeLastCharacter(){
        self = String(self.characters.dropLast())
    }
    
    func removeNonNumbers() -> String {
        let stringArray = self.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        return NSArray(array: stringArray).componentsJoinedByString("")
    }
    
}
