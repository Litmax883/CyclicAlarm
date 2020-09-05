//
//  SettingsViewController.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: Properties
    
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: Actions
    

    
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: TableView

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSettings") as! SettingsTableViewCell
        
        return cell
    }
    
    
}

