//
//  ButtonItem.swift
//  TestDesignApp
//
//  Created by PhoenixDev on 07.06.2020.
//  Copyright © 2020 PhoenixDev. All rights reserved.
//

import UIKit

class ButtonItem: UIButton {

    // remember the checked state for button
    var checked = false
    // remember title of button
    var title: String?
    
    convenience init(title: String, color: UIColor, textColor: UIColor) {
        self.init()

        self.title = title
        
        // for using custon constraints
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // set the corner radius
        self.layer.cornerRadius = 23
        self.layer.masksToBounds = true
        // set title of button with the custom font parameters
        let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont().getRoundedFont(fontSize: 17), NSAttributedString.Key.foregroundColor: textColor])
        self.setAttributedTitle(attrTitle, for: .normal)
        
        // set background color
        self.backgroundColor = color
        
        // set default height 
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    

}
