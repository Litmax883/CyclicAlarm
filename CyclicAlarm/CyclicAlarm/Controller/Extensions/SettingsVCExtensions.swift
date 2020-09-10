//
//  SettingsVCExtensions.swift
//  CyclicAlarm
//
//  Created by MAC on 10.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

// Functions for viewDidLoad
extension SettingsViewController {
    
    func clearFooter() {
        tableView?.tableFooterView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: tableView.frame.size.width,
            height: 1))
    }
    
}

// Observer protocol
extension SettingsViewController: KeyboardObservable {
    
    func keyboardStateChanged(state: KeyboardAppearanceState) {
        switch state {
        case .willShow(let info) where tableView.contentInset.bottom == 0:
            UIView.animate(withDuration: info.duration) { [weak self] in
                guard let self = self else { return }
                
                self.tableView.contentInset.bottom += info.keyboardFrame.height + 17
            }
        case .willHide(let info):
            UIView.animate(withDuration: info.duration) { [weak self] in
                self?.tableView.contentInset.bottom = 0
            }
        default: break
        }
    }
    
}
