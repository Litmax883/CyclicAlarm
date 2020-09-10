//
//  NumberOfDays.swift
//  CyclicAlarm
//
//  Created by MAC on 03.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class DaysStackView: UIStackView {
    
    // MARK: Properties
    

    
    private var alarmButtons = [UIButton]()
    private var numberOfAlarm = 0 {
        didSet {
            updateNumberOfAlarms ()
        }
    }
    
    
    // MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button action
    
    @objc func buttonTapped(button: UIButton) {
        
        guard let index = alarmButtons.firstIndex(of: button) else { return }
        numberOfAlarm = index + 1
        
    }
    
    // MARK: Share buttons
    

    
    // MARK: Create buttons
    
    private func setupButtons() {
        
        // List of buttons color
        let turnOnButton = UIImage(named: "turnOnButton")
        let turnOffButton = UIImage(named: "turnOffButton")
        
        // Create buttons
        for index in 0...6 {
            
            let button = UIButton()
            
            // Set the button color
            button.setBackgroundImage(turnOnButton, for: .selected)
            button.setBackgroundImage(turnOffButton, for: .normal)
            
            button.layer.cornerRadius = 35
            button.clipsToBounds = true
            
            button.setTitle("\(index + 1)", for: .normal)
            button.titleLabel?.font = .monospacedSystemFont(ofSize: 20, weight: .thin)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            
            // Add constrains
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            
            // SetUp the button action
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            
            // Add button to the stack
            addArrangedSubview(button)
            
            // Default first alarm
            numberOfAlarm = 1
            
            // Add the new button on array
            alarmButtons.append(button)
            
        }
        
    }
    
    func updateNumberOfAlarms () {
        for (index, button) in alarmButtons.enumerated() {
            button.isSelected = index < numberOfAlarm

        }
    }
}
