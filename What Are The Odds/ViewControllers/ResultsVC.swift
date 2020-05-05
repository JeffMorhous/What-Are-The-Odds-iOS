//
//  ResultsVC.swift
//  What Are The Odds
//
//  Created by Jeff Morhous on 5/4/20.
//  Copyright © 2020 Jeff Morhous. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    var selectedOdds: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom programmatic UI
        view.backgroundColor = .systemBackground
        self.title = "What Are The Odds?"
        navigationController?.isNavigationBarHidden = true
        print("\(selectedOdds!)")
    }

}
