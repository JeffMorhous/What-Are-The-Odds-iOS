//
//  ResultsVC.swift
//  What Are The Odds
//
//  Created by Jeff Morhous on 5/4/20.
//  Copyright © 2020 Jeff Morhous. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    // UI Elements
    let titleLabel = UILabel()
    let userNumberLabel = UILabel()
    let computerNumberLabel = UILabel()
    let horizontalStack = UIStackView()
    let resultLabel = UILabel()
    
    // Class Properties
    var selectedOdds: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom programmatic UI
        view.backgroundColor = .systemBackground
        self.title = "What Are The Odds?"
        navigationController?.isNavigationBarHidden = true
        // Show a  label with "1 in \(odds)"
        configureTitleLabel()
        playGame()
        // TODO: Add same odds and half odds buttons
    }
    
    // MARK: UI Configuration
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "1 in \(selectedOdds!)"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureResultNumbers(userNumber: Int, computerNumber: Int) {
        view.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center // .Leading .FirstBaseline .Center .Trailing .LastBaseline
        horizontalStack.distribution = .equalCentering // .FillEqually .FillProportionally .EqualSpacing .EqualCentering
        
        NSLayoutConstraint.activate([
           horizontalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
           horizontalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
           horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
           horizontalStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        horizontalStack.addArrangedSubview(userNumberLabel)
        userNumberLabel.text = "\(userNumber)"
        userNumberLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        horizontalStack.addArrangedSubview(computerNumberLabel)
        computerNumberLabel.text = "\(computerNumber)"
        computerNumberLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    }
    
    // Inform the player of the game results
    private func showGameResults(sameOdds: Bool){
        if(sameOdds){
            resultLabel.text = "The numbers are the same, you lose!"
        } else {
            resultLabel.text = "The numbers are different, and you're safe!"
        }
        resultLabel.lineBreakMode = .byWordWrapping
        resultLabel.numberOfLines = 2
        resultLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        resultLabel.textAlignment = .center
        
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: Game Logic
    
    private func playGame(){
        let firstNumber = generateNumber(range: selectedOdds)
        let secondNumber = generateNumber(range: selectedOdds)
        
        configureResultNumbers(userNumber: firstNumber, computerNumber: secondNumber)
        
        var sameOdds = false
        if(firstNumber == secondNumber){
            sameOdds = true
        }
        showGameResults(sameOdds: sameOdds)
    }
    
    // Generate a number between 1 and the passed parameter, range
    private func generateNumber(range: Int) -> Int {
        return Int.random(in: 1...range)
    }

}
