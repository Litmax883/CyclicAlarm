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
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    // MARK: Outlets
    
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var switchController: UISwitch!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    // MARK: Actions
    
    @IBAction func switchChange() {
        timeField.isHidden = !timeField.isHidden
    }
    
    @IBAction func chooseButtonPress() {
        print("azaza")

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

        chooseButton.setBackgroundImage(UIImage(named: "turnOnButton"), for: .selected)
        chooseButton.setBackgroundImage(UIImage(named: "turnOffButton"), for: .normal)
        
        chooseButton.layer.cornerRadius = 25
        chooseButton.clipsToBounds = true
        
        // SetUp the button action
        chooseButton.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
        
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
    
    @objc func buttonTapped(button: UIButton) {
        

    }
    

    
    
    
}
