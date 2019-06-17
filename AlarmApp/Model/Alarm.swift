//
//  Alarm.swift
//  AlarmApp
//
//  Created by julia rodriguez on 6/17/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class Alarm {
    
    var fireDate = Date()
    var name: String
    var enabled: Bool
    var uuid: String
    var fireTimeAsString: String {
        get {
            return DateFormatter().string(from: fireDate)
        }
        
    }
    
    init(name: String, enabled: Bool, uuid: String) {
        self.name = name
        self.enabled = enabled
        self.uuid = uuid
    }
}
