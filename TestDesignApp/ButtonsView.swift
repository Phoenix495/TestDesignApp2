//
//  ButtonsView.swift
//  TestDesignApp
//
//  Created by PhoenixDev on 07.06.2020.
//  Copyright © 2020 PhoenixDev. All rights reserved.
//

import UIKit

class ButtonsView: UIView {

    // array with all buttons title
    let buttonTitles = ["Home", "Groceries","Work", "Shopping", "Finances", "Routines", "Ideas", "Project", "Study", "Birthdays", "Wedding", "Move", "Books", "Movies"]

    let unselectedButtonColor = UIColor(hexString: "#F0F6FF")
    let selectedButtonColor = UIColor(hexString: "#6CA7FF")
    
    // array with indexes of all selected buttons
    var selectedButtons = Set<Int>()
    
    
    let titleView = TitleView()
    
    let doneButton: ButtonItem = {
        let button = ButtonItem(title: "Done", color: .black, textColor: .white)
        return button
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "#737373")
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Welcome to the world’s fastest to-do app! Let’s create up to 3 lists you want to add tasks to."
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // set title view on top
        self.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 115).isActive = true
        titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        // set description view
        self.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 90).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 255).isActive = true
        
        // create stack view for easy placing buttons
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 46).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22).isActive = true
        
        // add all buttons to the stack view
        for (index, title) in buttonTitles.enumerated() {
            let button = ButtonItem(title: title, color: unselectedButtonColor, textColor: .black)
            button.tag = index
            button.addTarget(self, action: #selector(buttonPressHandle(_:)), for: .touchUpInside)
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 44).isActive = true
            stackView.addArrangedSubview(button)
        }
        
        // add done button on bottom
        self.addSubview(doneButton)
        doneButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 53).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22).isActive = true
//        doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 37).isActive = true
        doneButton.addTarget(self, action: #selector(doneButtonHandler(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressHandle(_ sender: ButtonItem) {
        
        // check if current button already selected
        if selectedButtons.contains(sender.tag)  {
            // if true remove button form the selected buttons array and uncheck
            selectedButtons.remove(sender.tag)
            sender.checked = false
        } else if !selectedButtons.contains(sender.tag) && selectedButtons.count < 3 {
            // if selected buttons less than 3 and current button alredy unselected. than select it
            selectedButtons.insert(sender.tag)
            sender.checked = true
        }
    
        // set current title color and background color for current button
        if sender.checked {
            sender.backgroundColor = selectedButtonColor
            let attrStr = NSAttributedString(string: sender.title ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont().getRoundedFont(fontSize: 17)])
            sender.setAttributedTitle(attrStr, for: .normal)
        } else {
            sender.backgroundColor = unselectedButtonColor
            let attrStr = NSAttributedString(string: sender.title ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont().getRoundedFont(fontSize: 17)])
            sender.setAttributedTitle(attrStr, for: .normal)
        }
        
        
    }
    
    @objc func doneButtonHandler(_ sender: UIButton) {
        print("Done")
    }
}
