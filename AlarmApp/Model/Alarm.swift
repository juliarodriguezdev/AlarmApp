//
//  Alarm.swift
//  AlarmApp
//
//  Created by julia rodriguez on 6/17/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class Alarm: Codable {
    
    var fireDate: Date
    var name: String
    var enabled: Bool
    var uuid: String
    var fireTimeAsString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            let date = fireDate
            
            dateFormatter.locale = Locale(identifier: "en_US")
            return dateFormatter.string(from: date)
            
        }
        
    }
    
    init(name: String, enabled: Bool = true, uuid: String = UUID().uuidString, fireDate: Date) {
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
        self.fireDate = fireDate
    }
    
}

extension Alarm: Equatable {
    static func == (lhs:Alarm, rhs:Alarm) -> Bool {
        return lhs.fireDate == rhs.fireDate
            && lhs.name == rhs.name
            && lhs.enabled == rhs.enabled
            && lhs.uuid == rhs.uuid
            && lhs.fireTimeAsString == rhs.fireTimeAsString
    
    }
}

