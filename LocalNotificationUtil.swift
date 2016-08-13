//
//  LocalNotificationUtil.swift
//  LocalNotifyUtility
//
//  Created by 片桐奏羽 on 2015/09/29.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

class LocalNotificationUtil: NSObject {
   
    var types = UIUserNotificationType.Alert

    func setUpTime(notification:UILocalNotification) -> UILocalNotification
    {
        // time
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.timeZone = NSTimeZone.defaultTimeZone()
//        notification.repeatCalendar
//        notification.repeatInterval
        
        return notification
    }
    
    func setUpAlert(notification:UILocalNotification) -> UILocalNotification
    {
        notification.alertBody = "a"
        notification.alertAction = "b"
        notification.alertTitle = "t"
        
        return notification
    }
    

    func getSampleNotification()->UILocalNotification {
        print("setNotification")
        
        let setting = UIUserNotificationSettings(forTypes: types, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        
        return setUpAlert(setUpTime(UILocalNotification()))
        
    }
    
    func scheduleSampleNotification(){
        UIApplication.sharedApplication().scheduleLocalNotification(getSampleNotification())
    }
}
