//
//  SecondControllerViewController.swift
//  Calculator
//
//  Created by Dario Guida on 23/02/2017.
//  Copyright © 2017 Dario Guida. All rights reserved.
//

import UIKit

class SecondControllerViewController: UIViewController {

    var history : [String]?
    
    @IBOutlet weak var historyView: UITextView!
   
    
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
        // Do any additional setup after loading the view.
        
        for h in self.history!{
            historyView!.insertText(h)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func appMovedInBackgound(){
        print("App moved in the background")
        let defaults = UserDefaults.standard
        
        if(self.history != nil){
            
            defaults.set(self.history, forKey:"history")
        }
        
    }
    
   

}

