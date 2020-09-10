//
//  SettingsViewController.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    
    // MARK: Properties
    
    let numberOfRows =  7
    
    
    // MARK: Actions
    
    
    
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearFooter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterObservers()
    }
    
}

// MARK: TableView

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSettings") as! SettingsTableViewCell
        
        cell.setTextFieldToDatePicker()
        cell.setToolbarToTextField()
        cell.configureButtons(indexPath: indexPath.row)
    
        
        return cell
    }
}



