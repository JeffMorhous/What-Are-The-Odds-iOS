//
//  ViewController.swift
//  What Are The Odds
//
//  Created by Jeff Morhous on 5/1/20.
//  Copyright © 2020 Jeff Morhous. All rights reserved.
//

import UIKit

class SplashVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: UI Elements
    let callToActionButton = WOButton(backgroundColor: .systemRed, title: "Go!")
    let helpButton = WOButton(backgroundColor: .systemBlue, title: "How To Play")
    let horizontalStack = UIStackView()
    let oddsPicker = UIPickerView()
    
    // MARK: Class Properties
    var selectedOdds: Int = 0
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom programmatic UI
        view.backgroundColor = .systemBackground
        self.title = "What Are The Odds?"
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        configureCallToActionButton()
        configureHelpButton()
        configureHorizontalStack()
    }
    
    // MARK: UI Configuration
    private func configureHelpButton() {
        view.addSubview(helpButton)
        helpButton.addTarget(self, action: #selector(pushHelpVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            helpButton.bottomAnchor.constraint(equalTo: callToActionButton.topAnchor, constant: -20),
            helpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            helpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            helpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushResultsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    fileprivate func configurePickerLabel() {
        let label = UILabel(frame: .zero)
        label.text = "1 : "
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        horizontalStack.addArrangedSubview(label)
    }
    
    
    fileprivate func configureOddsPicker() {
        oddsPicker.dataSource = self
        oddsPicker.delegate = self
        horizontalStack.addArrangedSubview(oddsPicker)
    }
    
    
    private func configureHorizontalStack() {
        view.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center // .Leading .FirstBaseline .Center .Trailing .LastBaseline
        horizontalStack.distribution = .fillEqually // .FillEqually .FillProportionally .EqualSpacing .EqualCentering
        
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            horizontalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        configurePickerLabel()
        configureOddsPicker()
    }
    
    
    // MARK: UI Event Handlers
    @objc func pushHelpVC() {
        let explainGameVC = ExplainGameVC()
        self.present(explainGameVC, animated: true, completion: nil)
    }
        
    
    @objc func pushResultsVC() {
        let resultsVC = ResultsVC()
        resultsVC.selectedOdds = self.selectedOdds + 2
        self.present(resultsVC, animated: true, completion: nil)
//        navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    
    // MARK: Picker Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rowTitle = row + 2
        return "\(rowTitle)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedOdds = row
    }

}

