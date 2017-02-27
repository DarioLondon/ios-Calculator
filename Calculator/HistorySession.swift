//
//  HistorySession.swift
//  Calculator
//
//  Created by Dario Guida on 25/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import Foundation
import UIKit

class HistorySession : NSObject{

    var history :[String]=[]
    
    func updateHistory(_ button:String, newLine:Bool = false){
        
        if (self.history.isEmpty){
        self.history.append("\(button) ")
        }
        
        else if(newLine == true) {
            self.history.append("")
        }
            
        else{
            
            let session = String(self.history.last!) + "\(button) "
            self.history.removeLast()
            self.history.append(session)
        }
  
    }

    func displaySession(_ view:UITextView){
        
        for session in history{
        
            view.text.append("\(session)\n\n")
        }
    
    
    }
    
    func clearHistory(_ view: UITextView){
        view.text.removeAll()
        self.history.removeAll()
    }

}
