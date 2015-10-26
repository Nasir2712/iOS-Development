//
//  ViewController.swift
//  StopWatch
//
//  Created by Nasir Mohammed on 8/9/15.
//  Copyright © 2015 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var time = 0

    @IBOutlet weak var timerLabel: UILabel!
    func increasetime()
    {
        time++
   
        timerLabel.text = "\(time)"
    }
    
    
@IBAction func playButton(sender: AnyObject) {
    
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increasetime"), userInfo: nil, repeats: true)
}
    
    @IBAction func pauseButton(sender: AnyObject)
    {
        timer.invalidate()
    }
    
    @IBAction func StopButton(sender: AnyObject)
    {
        
        timer.invalidate()
        
        time = 0
        
        timerLabel.text="0"
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

