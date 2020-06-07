//
//  ViewController.swift
//  TestDesignApp
//
//  Created by PhoenixDev on 07.06.2020.
//  Copyright © 2020 PhoenixDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonsView = ButtonsView()
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // set size for main view
        buttonsView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        buttonsView.heightAnchor.constraint(equalToConstant: 1474).isActive = true
        
        // place buttons view in scroll view and set current content size
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1474)
        scrollView.addSubview(buttonsView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        view.addSubview(scrollView)
        
    }

    
}

