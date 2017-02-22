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
    let  operands : Operand = Operand()
    
    
    func binaryCalculation(_ operand:String)-> Double{
        
        switch operand {
            
        case operands.plus :
            if self.numberStack.count >= 2
            {
                return self.numberStack.removeLast() + self.numberStack.removeLast()
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
            
        case self.operands.squareRoot:
            if self.numberStack.count >= 1 {
                return sqrt(abs(numberStack.removeLast()))
            }
        case self.operands.powerOfTwo:
            if self.numberStack.count >= 1 {
                
                return pow(self.numberStack.last!,self.numberStack.removeLast())
            }
        case self.operands.sin:
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
            
        case self.operands.cosh:
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
            
        case self.operands.cosh:
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
            
        case self.operands.tan:
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
            
        case self.operands.logBaseTen :
            if self.numberStack.count >= 1 {
                
                return log10(self.numberStack.removeLast())
                
            }
            
        case self.operands.logBaseE :
            if self.numberStack.count >= 1 {
                
                return log(self.numberStack.removeLast())
                
            }
            
        default:break
        }
        
        
        return 0.0
        
    }
    
    
}






