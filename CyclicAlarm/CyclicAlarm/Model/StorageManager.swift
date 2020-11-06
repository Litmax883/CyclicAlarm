//
//  StorageManager.swift
//  CyclicAlarm
//
//  Created by MAC on 16.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ cycle: CycleModel) {
        
        try! realm.write {
            realm.add(cycle)
        }
    }
    
    static func deleteObject (_ alarm: CycleModel) {
        try! realm.write {
            realm.delete(alarm)
        }
    }
    
    
}
