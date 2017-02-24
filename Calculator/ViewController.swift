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
    var history : [String]?
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
        
        if let historySaved:AnyObject = defaults.object(forKey:"history") as AnyObject?
        {
                self.history = (historySaved as! Array)
                print(self.history!)
        }
        else {
            print("nil value")
        }
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
        
        self.history?.append(sender.currentTitle!)
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
         self.history?.append(sender.currentTitle!)
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
    
    
    
    func appMovedInBackgound(){
        print("App moved in the background")
        let defaults = UserDefaults.standard
        
        if(self.history != nil){
           
            defaults.set(self.history, forKey:"history")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pushToUserHistory" {
            
            let secondVC:SecondControllerViewController = segue.destination as! SecondControllerViewController
            
            //here I can now pass data to the other view controller by using the property username
            //for the calulator I could pass the tape data here
            secondVC.history = self.history!
            
            
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
