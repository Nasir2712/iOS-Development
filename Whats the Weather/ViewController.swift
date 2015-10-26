//
//  ViewController.swift
//  Whats the Weather
//
//  Created by Nasir Mohammed on 8/12/15.
//  Copyright © 2015 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var citytextField: UITextField!
    
    
    @IBOutlet weak var resultlabel: UILabel!
    
    
    @IBAction func button1(sender: AnyObject) {
        
        var wasSuccessful = false
        
        let attemptedurl = NSURL(string: "http://www.weather-forecast.com/locations/" + citytextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if let url = attemptedurl {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                if websiteArray!.count > 1 {
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                    
                    if weatherArray.count > 1  {
                        
                        wasSuccessful = true
                        
                        let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.resultlabel.text = weatherSummary
                        })
                        
                    }
                    
                }
                
            }
            
                if wasSuccessful == false {
                
                    self.resultlabel.text = " Could not find weather for this city please try again "
            }
        
        }
            
        task.resume()
            
        }  else {
            
                    self.resultlabel.text = " Could not find weather for this city please try again"
            }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

