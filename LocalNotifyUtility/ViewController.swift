//
//  ViewController.swift
//  LocalNotifyUtility
//
//  Created by 片桐奏羽 on 2015/09/29.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateTimeLabel()

    }
    
    @IBAction func timePickerValueChanged(sender: AnyObject) {
        print("timePickerValueChanged")
    }
    
    @IBAction func timePickerLongPressed(sender: AnyObject) {
        print("timePickerLongPressed")
        
        let date = self.timePicker.date;
        
        let notifiUtil = LocalNotificationUtil()
        notifiUtil.clear()
        notifiUtil.scheduleSampleNotification(date)
        
        let vc = UIAlertController(title: "time", message: "local set\(date)", preferredStyle: .Alert)
       
        let ac = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) in
            print("close")
        }
        
        vc.addAction(ac)
        
        self.presentViewController(vc, animated: true, completion: {
            self.updateTimeLabel()
        })
    }
    
    
    func updateTimeLabel() {
        let notificationUtil = LocalNotificationUtil()
        let us_ = notificationUtil.settingNotifications()
        
        if us_ != nil {
            let us = us_!
            if us.count != 0 {
                let n = us[0]
                self.timeLabel.text = n.fireDate?.description
            }
        }
  
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {

    }

}

