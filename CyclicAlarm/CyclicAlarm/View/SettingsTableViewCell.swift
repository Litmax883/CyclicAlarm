//
//  SettingsTableViewCell.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    // MARK: Properties
    var buttonStatus = false
    var oneDayModel = DayModel()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    // MARK: Outlets
    
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var switchController: UISwitch!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var offLabel: UILabel!
    
    // MARK: Actions
    
    @IBAction func switchChange() {
        timeField.isHidden = !timeField.isHidden
        offLabel.isHidden = !offLabel.isHidden
    }
    
    @IBAction func chooseButtonPress() {
        buttonTurn()
    }
    
    // MARK: Toolbar settings
    
    func setToolbarToTextField() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        timeField.inputAccessoryView = toolbar
        
        datePicker.addTarget(self, action: #selector(timeChanger), for: .valueChanged)
        
        let tapToClose = UITapGestureRecognizer(target: self, action: #selector(doneAction))
        
        self.addGestureRecognizer(tapToClose)
    }
    
    // MARK: Functions
    
    func configureButtons(indexPath: Int) {
        
        chooseButton.setTitle("\(indexPath + 1)", for: .normal)
        
        chooseButton.layer.cornerRadius = 25
        chooseButton.clipsToBounds = true
        chooseButton.setBackgroundImage(UIImage(named: "turnOnButton"), for: .normal)

    }
    
    func setTextFieldToDatePicker () {
        timeField.inputView = datePicker
    }
    
    @objc func doneAction() {
        self.endEditing(true)
    }
    
    @objc func timeChanger() {
        getDateFromPicker()
    }
    
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeField.text = formatter.string(from: datePicker.date)
    }
    

    
    func buttonTurn() {

        if !buttonStatus {
            chooseButton.setBackgroundImage(UIImage(named: "turnOffButton"), for: .normal)
            buttonStatus = true
            
            timeField?.isHidden = true
            offLabel.isHidden = true
            switchController.isHidden = true
            switchController.isOn = false
        } else {
            chooseButton.setBackgroundImage(UIImage(named: "turnOnButton"), for: .normal)
            buttonStatus = false
            
            timeField.isHidden = false
            offLabel.isHidden = true
            switchController.isHidden = false
            switchController.isOn = true
        }
    }
    
    func turnSomeButtons() {
        chooseButton.setBackgroundImage(UIImage(named: "turnOnButton"), for: .normal)
        buttonStatus = false
        timeField?.isHidden = false
        switchController.isHidden = false
        switchController.isOn = true
        offLabel.isHidden = true
    }
    
    
    
    
    
    
    
    
    
}
