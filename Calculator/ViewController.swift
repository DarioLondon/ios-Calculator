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
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
        var  cal : CalculatorEngine? 
   
    
    var userHasStartedTyping : Bool = false
    
    var displayValue : Double {
        get{
            return Double(labelDisplay.text!)!
        }
        set(newValue){
            labelDisplay.text! = "\(newValue)"
            userHasStartedTyping = false
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
