//
//  AlertController.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class AlertController: UIAlertController {
    
    let instruction = "Some instructions"
    
    func showInfoAlert ()->(UIAlertController) {
        
        let alert = UIAlertController(title: "Information", message: "", preferredStyle: .alert)
        
        alert.message = instruction
        
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
        
        return alert
    }
}
