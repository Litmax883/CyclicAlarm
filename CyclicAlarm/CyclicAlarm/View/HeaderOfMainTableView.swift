//
//  HeaderOfMainTableView.swift
//  CyclicAlarm
//
//  Created by MAC on 05.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class HeaderOfMainTableView: UITableViewHeaderFooterView {

    let title = UILabel()
    let image = UIImageView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(image)
        contentView.addSubview(title)

        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        
            // Center the label vertically, and use it to fill the remaining
            // space in the header view.
                title.heightAnchor.constraint(equalToConstant: 30),
                title.leadingAnchor.constraint(equalTo: image.trailingAnchor,
                       constant: 15),
                title.trailingAnchor.constraint(equalTo:
                       contentView.layoutMarginsGuide.trailingAnchor),
                title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }

}
