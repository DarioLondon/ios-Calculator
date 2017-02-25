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
        
        // Do any additional setup after loading the view.
        if(self.historyData == nil){
            print("the array is nil ")
        }else{
            print(self.historyData!.history)
        self.historyData!.displaySession(self.historyView!)
        
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "backToUserHistory" {
            
            let firstVC:ViewController = segue.destination as! ViewController
            
            //here I can now pass data to the other view controller by using the property username
            //for the calulator I could pass the tape data here
            
            print("History ==> \(self.historyData!.history )")
            firstVC.history = self.historyData
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
   

}

