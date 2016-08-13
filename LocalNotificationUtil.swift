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

    func setUpTime(notification:UILocalNotification, date:NSDate?) -> UILocalNotification
    {
        // time
        let date = {()->NSDate in
            if (date != nil) {
                return date!
            } else {
                return NSDate(timeIntervalSinceNow: 5)
            }
        }()
        
        let calender = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let timezone = NSTimeZone.localTimeZone()
        let repeatInterval : NSCalendarUnit = .Day

        notification.fireDate = date
        notification.timeZone = timezone
        notification.repeatCalendar = calender
        notification.repeatInterval = repeatInterval

        
        return notification
    }
    
    func setUpAlert(notification:UILocalNotification) -> UILocalNotification
    {
        notification.alertBody = "a"
        notification.alertAction = "b"
        notification.alertTitle = "t"
        
        return notification
    }
    

    func getSampleNotification(time:NSDate)->UILocalNotification {
        print("setNotification")
        
        let setting = UIUserNotificationSettings(forTypes: types, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        
        let notification = UILocalNotification()
        setUpTime(notification, date: time)
        setUpAlert(notification)
        
        return notification
    }
    
    func scheduleSampleNotification(time:NSDate){
        
        let notification = getSampleNotification(time)
        
        let app = UIApplication.sharedApplication()
        app.scheduleLocalNotification(notification)
    }
    
    func clear() {
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    func settingNotifications()->[UILocalNotification]?
    {
        return UIApplication.sharedApplication().scheduledLocalNotifications
    }
    
    
}
