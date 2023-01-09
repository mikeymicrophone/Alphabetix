//
//  Notification.swift
//  TinyCalender
//
//  Created by Zero IT Solutions on 09/01/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import Foundation
import UserNotifications


class NotificationManager {

    static let instance = NotificationManager()
    
    func requestAuthorization () {
        let options:UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { succes, error in
            if error != nil {
                print("error Request")
            } else {
                self.scheduleNotification()
                print("Success Request")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Alphabetix Magicalendar"
        content.subtitle = "check Today's Letter"
        content.sound = .default
        //let badgeCount = UserDefaults.standard.value(forKey: "NotificationBadgeCount") as! Int + 1
        //UserDefaults.standard.set(badgeCount, forKey: "NotificationBadgeCount")
        //content.badge = badgeCount as NSNumber
       
        let AMDateComponents = DateComponents(year: Date.getCurrentYear(), month:  Date.getCurrentMonth(), day:  Date.getCurrentDate(), hour: 24 , minute: 00)
        
        let triggerAmNotification = UNCalendarNotificationTrigger(dateMatching: AMDateComponents, repeats: false)
        let requestForAM = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: triggerAmNotification)
        
        let PMDateComponent = DateComponents(year: Date.getCurrentYear(), month:  Date.getCurrentMonth(), day:  Date.getCurrentDate(), hour: 12 , minute: 00)
        
        let triggerPmNotification = UNCalendarNotificationTrigger(dateMatching: PMDateComponent, repeats: false)
        let requestForPM = UNNotificationRequest(identifier: UUID().uuidString, content: content,
                                            trigger: triggerPmNotification)
                
        UNUserNotificationCenter.current().add(requestForAM)
        UNUserNotificationCenter.current().add(requestForPM)
        print("Success")
    }
    
    //Delete with ID
//    func deleteNotification() {
//     UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["32"])
//
//     }
     
}
