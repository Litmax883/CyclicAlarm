//
//  Model.swift
//  CyclicAlarm
//
//  Created by MAC on 05.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import RealmSwift

class CycleModel: Object {
    
    @objc dynamic var name = "Alarm"
    var listOfDays = List<DayModel>()
    
}


class DayModel: Object {
    
    @objc dynamic var time: String?
    @objc dynamic var enabled = true
    
}

