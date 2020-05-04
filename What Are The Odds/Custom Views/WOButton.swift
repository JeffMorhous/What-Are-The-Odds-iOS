//
//  WOButton.swift
//  What Are The Odds
//
//  Created by Jeff Morhous on 5/2/20.
//  Copyright © 2020 Jeff Morhous. All rights reserved.
//

import UIKit

class WOButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //Custom code
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius = 10 //White
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline) //System font
        translatesAutoresizingMaskIntoConstraints = false //Use autolayout
    }

}
