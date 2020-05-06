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
        // TODO: Show a  label with "1 in \(odds)"
        // TODO: Show two numbers generated
        // TODO: Add same odds and half odds buttons
        playGame()
    }
    
    // Mark: Game Logic
    
    private func playGame(){
        let firstNumber = generateNumber(range: selectedOdds)
        let secondNumber = generateNumber(range: selectedOdds)
        
        var sameOdds = false
        if(firstNumber == secondNumber){
            sameOdds = true
        }
        showGameResults(sameOdds: sameOdds)
    }
    
    // Generate a number between 1 and the passed parameter, range
    private func generateNumber(range: Int) -> Int {
        // TODO: Implement
    }
    
    // Inform the player of the game results
    private func showGameResults(sameOdds: Bool){
        if(sameOdds){
            // TODO: Show the player that they've lost the game
        } else {
            // TODO: Show the player taht they've won the game
        }
    }

}
