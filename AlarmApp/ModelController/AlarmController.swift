//
//  AlarmController.swift
//  AlarmApp
//
//  Created by julia rodriguez on 6/17/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class AlarmController {
    
    init() {
        loadFromPersistentStore()
    }
    // Singleton
    
    static let sharedInstance = AlarmController()
    
    var alarms: [Alarm] = []
    
    var mockAlarms: [Alarm] {
        
        let firstAlarm = Alarm(name: "DevMount Alarm", fireDate: Date())
        let secondAlarm = Alarm(name: "Sat Lesson Alarm", fireDate: Date())
        return [firstAlarm, secondAlarm]
    }
    // Create (CRUD)
    func addAlarm(fireDate: Date, name: String, enabled: Bool) {
        
        let newAlarm = Alarm(name: name, enabled: enabled, uuid: "will be used later", fireDate: fireDate)
        
        alarms.append(newAlarm)
        saveToPersistentStorage()
        
    }
    // Update (CRUD)
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
        
        saveToPersistentStorage()
    }
    // Delete (CRUD)
    func delete(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        alarms.remove(at: index)
        
        saveToPersistentStorage()
    }
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    // Read (CRUD)
    private func fireURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "alarm.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStorage() {
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonAlarm = try jsonEncoder.encode(alarms)
            
            try jsonAlarm.write(to: fireURL())
        } catch let encodingError {
            print("There was an error saving the data as JSON! \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: fireURL())
            let decodedAlarms = try jsonDecoder.decode([Alarm].self, from: jsonData)
            alarms = decodedAlarms
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
        
    }
}
