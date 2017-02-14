//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by Dario Guida on 13/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import Foundation
import UIKit

class CalculatorEngine{
    
    var numberStack :[Double]!
    var operandStack : [String]!
    let operand :Operand!
    
    init() {
        self.numberStack = [Double]()
        self.operandStack = [String]()
        self.operand = Operand.init()
    }
    
    
    
    func addNumeber(_ item:Double){
        self.numberStack.append(item)
    }
    
    func addOperand(_ item:String){
        self.operandStack.append(item)
    }
    
    func removeLastDigitedNumber(){
       self.numberStack.removeLast()
    }
    
    func cleanTheStacks(){
        self.operandStack.removeAll()
        self.numberStack.removeAll()
    }
    
    func calculate()-> Double{
        
        switch (self.operandStack.removeFirst()){
            
            
        case operand.plus :
                if self.numberStack.count >= 2
            {
                    return self.numberStack.removeLast() + self.numberStack.removeFirst()
            }
            case operand.minus :
                if self.numberStack.count >= 2
            {
                return self.numberStack.removeFirst() - self.numberStack.removeFirst()
            }
            case operand.multiply:
    
            if self.numberStack.count >= 2
            {
                return self.numberStack.removeFirst() * self.numberStack.removeFirst()
            }
            case operand.divide :
            
            if self.numberStack.count >= 2
            {
                return self.numberStack.removeFirst() / self.numberStack.removeLast()
            }
            case operand.squareRoot :
                
            if self.numberStack.count == 1
            {
                return sqrt(abs(self.numberStack.removeLast()))
            }
            
        default:break
            
            
        }
        return 0.0
    }
    
    
}



struct  Operand {
    
    let plus :String = "+"
    let minus :String = "−"
    let multiply :String = "×"
    let divide : String = "÷"
    let squareRoot :String = "²√"
    let plusMinus :String = "±"
    let pi :String = "π"
    let xTwo :String = "x²"
    let sin :String = "sin"
    let cos :String = "cos"
    let tan :String = "tan"
    let sinh :String = "sinh"
    let cosh  :String = "cosh"
    let tanh :String = "tanh"
    let logBaseTen :String = "㏒₁₀"
    
}


