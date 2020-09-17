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
    
    let numberOfRows =  7 // fixed property - days of week
    
    let fullCycle = CycleModel()
    
    
    // MARK: Actions
    
    @IBAction func saveButton(_ sender: Any) {
        addAllDaysToCycle()
        navigationController?.popViewController(animated: true)
    }
    
    
    
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
    
    func buttonPressed(cell: SettingsTableViewCell) {
        let indexPath = self.tableView.indexPath
        print(indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSettings") as! SettingsTableViewCell
        cell.chooseButton.tag = indexPath.row
        
        cell.setTextFieldToDatePicker()
        cell.setToolbarToTextField()
        cell.configureButtons(indexPath: indexPath.row)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! SettingsTableViewCell
        cell.chooseButton.addTarget(self, action: #selector(buttonListChange(_:)), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! SettingsTableViewCell
        cell.chooseButton.removeTarget(self, action: #selector(buttonListChange(_:)), for: .touchUpInside)
    }
    
    @objc func buttonListChange(_ sender: UIButton) {
        
        tableView.visibleCells.compactMap({
            $0 as? SettingsTableViewCell
        }).forEach({
            $0.buttonStatus = false
            $0.buttonTurn()
        })
        for index in 0...sender.tag {
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? SettingsTableViewCell {
                cell.buttonStatus = true
                cell.buttonTurn()
            }
        }
    }
    
    func addAllDaysToCycle() {
        fullCycle.name = nameField.text!
        
        tableView.visibleCells.compactMap({
            $0 as? SettingsTableViewCell
        }).forEach({
            if $0.buttonStatus {
                let oneDay = DayModel()
                
                if $0.switchController.isOn {
                    oneDay.enabled = $0.switchController.isOn
                    if $0.timeField.text != nil {
                        oneDay.time = $0.timeField.text
                    } else {
                        oneDay.enabled = false
                    }
                } else {
                    oneDay.enabled = false
                    oneDay.time = nil
                }
                fullCycle.listOfDays.append(oneDay)
            }
        })
        saveToDataBase()
    }
    
    func saveToDataBase() {
        StorageManager.saveObject(fullCycle)
    }
    
    
}



