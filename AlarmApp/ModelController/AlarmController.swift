//
//  AlarmController.swift
//  AlarmApp
//
//  Created by julia rodriguez on 6/17/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class AlarmController {
    
    // Singleton
    
    static let sharedInstance = AlarmController()
    
    var alarms: [Alarm] = []
    
    var mockAlarms: [Alarm] {
        
        let firstAlarm = Alarm(name: "DevMount Alarm", fireDate: Date())
        let secondAlarm = Alarm(name: "Sat Lesson Alarm", fireDate: Date())
        return [firstAlarm, secondAlarm]
    }
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        
        let newAlarm = Alarm(name: name, enabled: enabled, uuid: "will be used later", fireDate: fireDate)
        
        alarms.append(newAlarm)
    }
    
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
    }
    
    func delete(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        alarms.remove(at: index)
    }
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
}
