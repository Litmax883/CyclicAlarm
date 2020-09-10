//
//  TimeManager.swift
//  CyclicAlarm
//
//  Created by MAC on 05.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class TimeManager {
    
    private var timer: Timer?
    var onTimeChanged: ((TimeManager)->())?
    
    init(){
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true,
            block: { [weak self] (_) in
                guard let self = self else { return }
                self.onTimeChanged?(self)
        })
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    enum TypeOfDate {
        case time
        case date
    }
    
    func updateTimeLabel (_ type: TypeOfDate)-> (String) {
        
        let date = Date()
        let formatter = DateFormatter()
        
        switch type {
            
        case .date:
            formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")
            let dateTime = formatter.string(from: date)
            return dateTime
            
        case .time:
            formatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
            let dateTime = formatter.string(from: date)
            return dateTime
        }
    }
    
}
