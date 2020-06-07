//
//  TitleView.swift
//  TestDesignApp
//
//  Created by PhoenixDev on 07.06.2020.
//  Copyright © 2020 PhoenixDev. All rights reserved.
//

import UIKit

class TitleView: UIView {

    // title label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "Hello 👋"
        return label
    }()
    
    // plus image view
    let plusImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "Plus")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // for using custom constraints
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // set current size for image
        plusImage.widthAnchor.constraint(equalToConstant: 47.4).isActive = true
        plusImage.heightAnchor.constraint(equalToConstant: 47.4).isActive = true
        
        // grouped views in stack
        let horizontalStack = UIStackView(arrangedSubviews: [plusImage, titleLabel])
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 11
        horizontalStack.alignment = .center
        
        self.addSubview(horizontalStack)
        horizontalStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
