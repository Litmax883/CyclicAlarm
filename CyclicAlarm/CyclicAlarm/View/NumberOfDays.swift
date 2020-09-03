//
//  NumberOfDays.swift
//  CyclicAlarm
//
//  Created by MAC on 03.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class NumberOfDays: UIStackView {

// MARK: Properties
    
    private var alarmButtons = [UIButton]()
    
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
        
    }
    
    private func setupButtons() {
        
        // Create buttons
        for index in 0...6 {
            
            let button = UIButton()
            button.backgroundColor = .lightGray
            
            button.layer.cornerRadius = 35
            button.clipsToBounds = true
            
            button.setTitle("\(index + 1)", for: .normal)
            button.titleLabel?.font = .monospacedSystemFont(ofSize: 20, weight: .medium)
            button.setTitleColor(.black, for: .normal)
            
            // Add constrains
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            
            // SetUp the button action
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            
            // Add button to the stack
            addArrangedSubview(button)
            
            // Add the new button on array
            alarmButtons.append(button)
            
        }
        
    }
}
