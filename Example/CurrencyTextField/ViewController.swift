//
//  ViewController.swift
//  CurrencyTextField
//
//  Created by Andre Silva on 12/30/2015.
//  Copyright (c) 2015 Andre Silva. All rights reserved.
//

import UIKit
import CurrencyTextField
    
class ViewController: UIViewController {

    @IBOutlet var currencyField: CurrencyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom Text Currency
        currencyField.currency = "US$"
        currencyField.showSeparatorMark = true
        currencyField.currencyPosition = .Start
        currencyField.decimalMark = "."
        currencyField.separadorMark = ","
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func printValues(sender: AnyObject) {
        print(currencyField.monetaryValue)
        print(currencyField.stringValue) 
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        currencyField.resignFirstResponder()
    }
    
}

