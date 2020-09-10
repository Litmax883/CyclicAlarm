//
//  ListVCExtensions.swift
//  CyclicAlarm
//
//  Created by MAC on 10.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

// Functions for viewDidLoad
extension ListViewController {
    
    func clearFooter() {
        tableView?.tableFooterView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: tableView.frame.size.width,
            height: 1))
    }
    
    func showMainTimeAndData() {
        
        timeManager.onTimeChanged = { [weak self] timeManager in
            guard let self = self else { return }
            
            self.currentTime.text = timeManager.updateTimeLabel(.time)
            self.currentDate.text = timeManager.updateTimeLabel(.date)
            
            self.tableView.visibleCells.forEach({
                guard let cell = $0 as? TableViewCell else { return }
                cell.configureTimeToAlarm(time: timeManager.updateTimeLabel(.time))
            })
        }
    }
}
