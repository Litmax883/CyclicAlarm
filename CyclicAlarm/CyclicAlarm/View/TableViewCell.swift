//
//  TableViewCell.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var timeToAlarmLabel: UILabel!
    @IBOutlet weak var turnSwich: UISwitch!
    

    func configureTimeToAlarm(time: String) {
        timeToAlarmLabel.text = time
    }
    
    
    
}
