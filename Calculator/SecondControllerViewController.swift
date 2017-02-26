//
//  SecondControllerViewController.swift
//  Calculator
//
//  Created by Dario Guida on 23/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import UIKit

class SecondControllerViewController: UIViewController {

    var historyData : HistorySession?
    
    @IBOutlet weak var historyView: UITextView!
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if(self.historyData == nil){
         self.historyData = HistorySession()
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
        
        if let historySaved:AnyObject = defaults.object(forKey:"history") as AnyObject?
        {
            
            self.historyData!.history = (historySaved as!  NSArray) as! [String]
            print(self.historyData!.history)
            self.historyData!.displaySession(historyView)
        }
    }

    
    @IBAction func deleteHistory(_ sender: UIButton) {
        
        self.historyData!.clearHistory(historyView!)
        
       
        
        if(self.historyData != nil){
            
            UserDefaults.standard.set(self.historyData!.history, forKey:"history")
        }
    }
    
    
    func appMovedInBackgound(){
        print("App moved in the background")
       
        
        if(self.historyData != nil){
            
            UserDefaults.standard.set(self.historyData!.history, forKey:"history")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
   

}

