//
//  ViewController.swift
//  Calculator
//
//  Created by Dario Guida on 07/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelSin: UIButton!
    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var labelCos: UIButton!
    @IBOutlet weak var labelTan: UIButton!
    @IBOutlet weak var labelAngleType: UIButton!
    @IBOutlet weak var labelSquareRoot: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    var history : HistorySession?
    var session : String?
    
    var  cal : CalculatorEngine?
    
    var userHasStartedTyping = false
    
    var displayValue :Double {
        
        get{ return Double(labelDisplay.text!)! }
        set(newValue){
            if(newValue.truncatingRemainder(dividingBy: 1) == 0){
                let  newValue = Int(newValue)
                labelDisplay.text = "\(newValue)"
                
            }else{
                
                labelDisplay.text = "\(newValue)"
                
            }
            userHasStartedTyping = false
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("back")
        
        if (self.cal == nil){
            self.cal = CalculatorEngine()
        }
        
        if (self.history == nil){
            self.history = HistorySession()
        }
        
        
                let sel :Selector = #selector(
                    self.appMovedInBackgound
                )
        
                let notificationCenter = NotificationCenter.default
        
                notificationCenter.addObserver(
                    self,
                    selector: sel ,
                    name: NSNotification.Name.UIApplicationWillResignActive,
                    object: nil
                )
        
                let defaults = UserDefaults.standard
        
                if let historySaved = defaults.object(forKey:"history") as AnyObject?, let historyDisplay = defaults.object(forKey:"historyDisplay") as AnyObject?
                {
                   
                        self.history!.history = (historySaved as! NSArray) as! [String]
                        self.labelDisplay!.text = (historyDisplay as! NSString) as String
                        print(self.history!.history)
                }
        
        // Do any additional setup after loading the view, typically from a nib.
        
      
        
    }
    
    @IBAction func enterKey(_ sender: UIButton) {
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        updatePersistenteMemory()
        userHasStartedTyping = false
        
        if(self.cal!.numberStack.count < 2){
            
            self.cal!.numberStack.append(displayValue)
            print("NumberStack \(self.cal!.numberStack) ")
        }
        userClickedDecimalPoint = false
          userHasChangedSign = false
        
    }
    
    var userHasClickedFunc :Bool = false
    
    @IBAction func functionBtn(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        updatePersistenteMemory()
        
        
        if(!userHasClickedFunc){
            
            labelSin!.setTitle("asin", for: .normal)
            labelCos!.setTitle("acos" , for: .normal)
            labelTan!.setTitle("atan" , for : .normal)
            labelSquareRoot!.setTitle("⅟x" , for : .normal)
            userHasClickedFunc = true
        }else{
            
            labelSin!.setTitle("sin", for: .normal)
            labelCos!.setTitle("cos" , for: .normal)
            labelTan!.setTitle("tan" , for : .normal)
            labelSquareRoot!.setTitle("²√" , for : .normal)
            userHasClickedFunc = false
        }
        
    }
    
    
    @IBAction func operationBtn(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        updatePersistenteMemory()
        
        let operation :String = sender.currentTitle!
        print(operation)
        
        
        if userHasStartedTyping {
            
            self.enterKey(self.enterButton)
        }
        
        self.displayValue = self.cal!.binaryCalculation(operation)
        
        self.enterKey(self.enterButton)
        
        userClickedDecimalPoint = false
    }
    /*
     
     SWITCH BETWEEN RADIANTS AND DEGREES
     */
    var isRadiant :Bool = false
    
    @IBAction func isRadiant(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        updatePersistenteMemory()
        
        if(!isRadiant){
            sender.setTitle("Deg", for: .normal)
            isRadiant=true
        }else{
            sender.setTitle("Rad", for: .normal)
            isRadiant=false
        }
    }
    /*
     
     UNARY OPERATION SECTION
     
     */
    
    @IBAction func unaryOperation(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        self.updatePersistenteMemory()
    
        let operation :String = sender.currentTitle!
        print(operation)
        
        if (self.userHasStartedTyping == true){
            
            self.enterKey(self.enterButton)
            
            
        }
        
        self.displayValue = self.cal!.UnaryCalculation(unaryOperand:operation ,isRadiant)
        
        self.enterKey(self.enterButton)
       
        
        
    }
    
    var userHasChangedSign :Bool = false
    
    @IBAction func changeSign(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        updatePersistenteMemory()
        
        let sign : Character = "-"
        
        if userHasStartedTyping {
            
            if !userHasChangedSign && !(labelDisplay!.text?.characters.count == 0){
            let index = labelDisplay.text!.startIndex
            labelDisplay!.text!.insert(sign, at: index)
            userHasChangedSign = true
            userHasStartedTyping = true
       
        }
        else {
                if((labelDisplay!.text?.characters.count)! > 1){
            let index = labelDisplay.text!.startIndex
            labelDisplay!.text!.remove(at: index)
                userHasChangedSign = false
                userHasStartedTyping = false
                }
        }
        }
        
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        
        if !self.cal!.numberStack.isEmpty {
        self.history!.updateHistory(sender.currentTitle!, newLine: true )
        
        } else{
            
            
            self.history!.updateHistory(sender.currentTitle!)
        
        }
        updatePersistenteMemory()
        self.cal!.numberStack.removeAll()
        labelDisplay.text = "0"
        userHasStartedTyping=false
        userHasChangedSign = false
        userClickedDecimalPoint = false
        print("Memory cleaned : => \(self.cal!.numberStack.count)")
    }
    
    
    var userClickedDecimalPoint :Bool = false
    
    @IBAction func decimalPoint(_ sender: UIButton) {
        
        let decimal :String = sender.currentTitle!
       
        self.history!.updateHistory(decimal)
        updatePersistenteMemory()
        
        if !self.userClickedDecimalPoint {
            
            if(!self.userHasStartedTyping){
                
                self.labelDisplay.text = "0."
                self.userHasStartedTyping = true
                self.userClickedDecimalPoint = true
                
            }else{
                self.labelDisplay.text =  labelDisplay.text! + decimal
                
                self.userHasStartedTyping = true
                self.userClickedDecimalPoint = true
            }
            
        }
        
    }
    
    @IBAction func clearLastNumber(_ sender: UIButton) {
        let decimal :String = sender.currentTitle!
        
        self.history!.updateHistory(decimal)
        updatePersistenteMemory()
        
        self.labelDisplay.text = "0"
        self.userHasStartedTyping=false
        self.userClickedDecimalPoint = false
        self.userHasChangedSign = false
        print("Last Number Removed : => \(self.cal!.numberStack)")
    }
    
   
    
    
    @IBAction func digitPressed(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        updatePersistenteMemory()
        
    
        
        
        print("digit pressed ==> " + digit)
        
        if userHasStartedTyping {
            
            labelDisplay.text = labelDisplay.text! + digit
        }
        else {
            
            labelDisplay.text  = digit
            
            userHasStartedTyping = true;
        }
        
        
    }
    
    
    
    func appMovedInBackgound(){
        print("App moved in the background")
     
        let defaults = UserDefaults.standard
        if(self.history != nil){
            
            defaults.set(self.history!.history, forKey:"history")
             defaults.set(self.labelDisplay!.text, forKey:"historyDisplay")
        }
        
    }
    

    
    @IBAction func getPi(_ sender: UIButton) {
        
        let digit : String = sender.currentTitle!
        self.history!.updateHistory(digit)
        self.updatePersistenteMemory()

        
        let res :Double = self.cal!.UnaryCalculation(unaryOperand : digit )
        self.labelDisplay.text = "\(res)"
      
        self.userClickedDecimalPoint = true
        self.userHasStartedTyping = true
        
    }
    
    func updatePersistenteMemory(){
       
        
        if(self.history != nil){
            
           UserDefaults.standard.set(self.history!.history, forKey:"history")
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
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
