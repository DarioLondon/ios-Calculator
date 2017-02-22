//
//  ViewController.swift
//  Calculator
//
//  Created by Dario Guida on 07/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelDisplay: UILabel!
    
    var  cal : CalculatorEngine?
    var userHasStartedTyping = false
    var displayValue : Double {
        get{
            return Double(labelDisplay.text!)!
        }
        set(newValue){
            labelDisplay.text = "\(newValue)"
            userHasStartedTyping = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (self.cal == nil){
            cal = CalculatorEngine()
        }
        
    }
    
    
    @IBAction func enterKey() {
        
        userHasStartedTyping = false
        
        self.cal!.numberStack.append(displayValue)
        
        print("NumberStack \(self.cal!.numberStack) ")
        
    }
    
    
    
    @IBAction func operationBtn(_ sender: UIButton) {
        
        let operation :String = sender.currentTitle!
        print(operation)
        
        
        if (userHasStartedTyping == true){
            
            enterKey()
            
        }
        
        self.displayValue = self.cal!.binaryCalculation(operation)
        
        enterKey()
    }
    
    
    
    @IBAction func clearMemory() {
        
        self.cal!.numberStack.removeAll()
        labelDisplay.text = "0"
        userHasStartedTyping=false
        print("Memory cleaned : => \(self.cal!.numberStack.count)")
    }
    
    
    @IBAction func clearTheLastNumberInserted() {
        if(self.cal!.numberStack.count>0){
            
            self.cal!.numberStack.removeLast()
            labelDisplay.text = "0"
            userHasStartedTyping=false
            print("Last Number Removed : => \(self.cal!.numberStack)")
        }
    }
    
    
    @IBAction func digitPressed(_ sender: UIButton) {
        
        let digit = sender.titleLabel?.text
        
        print("digit pressed ==> \(digit!)")
        
        if userHasStartedTyping {
            
            labelDisplay.text = labelDisplay.text! + digit!
        }
        else {
            
            labelDisplay.text  = digit!
            
            userHasStartedTyping = true;
        }
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
