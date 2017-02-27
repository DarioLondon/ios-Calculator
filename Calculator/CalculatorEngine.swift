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
    
    func UnaryCalculation(unaryOperand:String, _ isRadinant :Bool  )->Double{
        
        switch(unaryOperand){
            
        case self.operands.squareRoot:
            if self.numberStack.count >= 0 {
                
            return sqrt(self.numberStack.removeLast())
            }
            
        case self.operands.powerOfTwo:
            
                return pow(abs(self.numberStack.removeLast()), 2.0)
            
        case self.operands.sin:
            if self.numberStack.count >= 1 {
                
                if isRadinant {
                    return  sin(self.numberStack.removeLast())
                }else{
                    
                    return __sinpi(self.numberStack.removeLast()/180.0)
                    
                }
            }
        case self.operands.asin:
            if self.numberStack.count >= 1 {
                
                if isRadinant {
                   
                    return  asin(self.numberStack.removeLast())
                    
                }else{

                    return  asin(self.numberStack.removeLast() * 180.0) / M_PI
                    
                }
            }
            
       
            
        case self.operands.cos:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return  cos(self.numberStack.removeLast())
                }else{
                    
                    return  __cospi(self.numberStack.removeLast()/180.0)

                    
                }
                
            }
            
        case self.operands.acos:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return  acos(self.numberStack.removeLast())
                }
                else{
                    
                    return  acos(self.numberStack.removeLast() * 180.0)/M_PI
                    
                    
                }
                
            }
            
        case self.operands.tan:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return tan(self.numberStack.removeLast())
                }else{
                    
                    return   __tanpi(self.numberStack.removeLast()/180.0)
                    
                }
                
            }
        case self.operands.atan:
            if self.numberStack.count >= 1 {
                if isRadinant {
                    return  atan(self.numberStack.removeLast())
                }else{
                    
                    return atan(self.numberStack.removeLast()  * 180.0)/M_PI
                    
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
        case self.operands.pi:
            if self.numberStack.count >= 0 {
                
                return M_PI
                
            }
            
        case self.operands.reciprocal:
            if self.numberStack.count >= 1 {
                
                return 1.0/self.numberStack.removeLast()
                
            }
            
        default:break
        }
        
        
        return 0.0
        
    }
    
    
}






