//
//  Model.swift
//  CyclicAlarm
//
//  Created by MAC on 05.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import Foundation

struct DayModel {
    
    var time: String?
    var date: String?
    var enabled: Bool
    
}

struct CycleModel {
    
    var name: String?
    var listOfDays: [DayModel]?
    
}
