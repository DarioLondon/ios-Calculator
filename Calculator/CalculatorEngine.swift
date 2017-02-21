//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by Dario Guida on 13/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import Foundation
import UIKit

class CalculatorEngine : NSObject {
    
    var numberStack :[Double] = [Double]()
    let operands :Operand = Operand.init()
    
    
    
    
    func addNumeber(_ item:Double){
        self.numberStack.append(item)
    }
    
    
    func cleanTheStacks(){
      
        self.numberStack.removeAll()
    }
    
    func binaryCalculation(operand:String)-> Double{
        
        switch (operand){
            
            
        case operands.plus :
                if self.numberStack.count >= 2
            {
                    return self.numberStack.removeLast() + self.numberStack.removeFirst()
            }
            case operands.minus :
                if self.numberStack.count >= 2
            {
                return self.numberStack.removeFirst() - self.numberStack.removeFirst()
            }
            case operands.multiply:
    
            if self.numberStack.count >= 2
            {
                return self.numberStack.removeFirst() * self.numberStack.removeFirst()
            }
            case operands.divide :
            
            if self.numberStack.count >= 2
            {
                return self.numberStack.removeFirst() / self.numberStack.removeLast()
            }
          
        default:break
            
            
        }
        return 0.0
    }
    
    func UnaryCalculation(unaryOperand:String, _ isRadinant :Bool = false )->Double{
        
        switch(unaryOperand){
        
        case operands.squareRoot:
            if self.numberStack.count >= 1 {
                return sqrt(abs(numberStack.removeLast()))
            }
        case operands.powerOfTwo:
            if self.numberStack.count >= 1 {
               
                return pow(self.numberStack.last!,self.numberStack.removeLast())
            }
        case operands.sin:
            if self.numberStack.count >= 1 {
                
                    if isRadinant {
                        return ((self.numberStack.last!.truncatingRemainder(dividingBy: M_PI)) == 0.0)
                            ? 0.0
                            :  __sinpi(self.numberStack.removeLast()/180)
                    }else{
                    
                        return ((self.numberStack.last!.truncatingRemainder(dividingBy: 180.0)) == 0.0)
                            ? 0.0
                            : sin(self.numberStack.removeLast())
                    
                    }
            }
            
        case operands.cosh:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return ((self.numberStack.last!.truncatingRemainder(dividingBy: M_PI)) == 0.0)
                        ? 0.0
                        :  cosh(self.numberStack.removeLast() * M_PI)/180
                }else{
                    
                    return ((self.numberStack.last!.truncatingRemainder(dividingBy: 180.0)) == 0.0)
                        ? 0.0
                        : cosh(self.numberStack.removeLast())
                    
                }

            }
            
        case operands.cosh:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return ((self.numberStack.last!.truncatingRemainder(dividingBy: M_PI)) == 0.0)
                        ? 0.0
                        :  __cospi(self.numberStack.removeLast()/180)
                }else{
                    
                    return ((self.numberStack.last!.truncatingRemainder(dividingBy: 180.0)) == 0.0)
                        ? 0.0
                        : cos(self.numberStack.removeLast())
                    
                }
                
            }
            
        case operands.tan:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return ((self.numberStack.last!.truncatingRemainder(dividingBy: M_PI)) == 0.0)
                        ? 0.0
                        :  __tanpi(self.numberStack.removeLast()/180)
                }else{
                    
                    return ((self.numberStack.last!.truncatingRemainder(dividingBy: 180.0)) == 0.0)
                        ? 0.0
                        : tan(self.numberStack.removeLast())
                    
                }
                
            }
            
        case operands.logBaseTen :
            if self.numberStack.count >= 1 {
                
            return log10(self.numberStack.removeLast())
                
            }
            
        case operands.logBaseE :
            if self.numberStack.count >= 1 {
                
                return log(self.numberStack.removeLast())
                
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
    let powerOfTwo :String = "x²"
    let sin :String = "sin"
    let cos :String = "cos"
    let tan :String = "tan"
    let sinh :String = "sinh"
    let cosh  :String = "cosh"
    let tanh :String = "tanh"
    let logBaseTen :String = "㏒₁₀"
    let logBaseE :String = "㏒ℯ"
    
}


