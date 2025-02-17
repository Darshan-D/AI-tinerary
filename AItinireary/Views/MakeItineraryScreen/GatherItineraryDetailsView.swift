//
//  GatherItineraryDetailsView.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

class GatherItineraryDetailsView: UIView {
    
    // MARK: Properties

    private let destinationTextField = createTextField(placeholder: "Eg: Mumbai, Goa, Tokyo")
    private let travelMonthTextField = createTextField(placeholder: "Eg: August, December")
    private let numberOfDaysTextField = createTextField(placeholder: "Eg: 3, 7", keyboardType: .numberPad)
    private let budgetTextField = createTextField(placeholder: "Eg: Low, Medium, High")
    private let tripTypeTextField = createTextField(placeholder: "Eg: Solo, Partner, Family")
    
    // MARK: Lazy vars
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Start typing, for AI Magic"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            createLabeledStack(labelText: "Destination", textField: destinationTextField),
            createLabeledStack(labelText: "Travel Dates", textField: travelMonthTextField),
            createLabeledStack(labelText: "Number of Days", textField: numberOfDaysTextField),
            createLabeledStack(labelText: "Budget", textField: budgetTextField),
            createLabeledStack(labelText: "Trip Type", textField: tripTypeTextField)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        
        return stackView
    }()

    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Helpers
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }

    private static func createTextField(placeholder: String, keyboardType: UIKeyboardType = .default) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.keyboardType = keyboardType
        textField.autocorrectionType = .yes
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func createLabeledStack(labelText: String, textField: UITextField) -> UIStackView {
        let label = UILabel()
        label.text = labelText
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let stackView = UIStackView(arrangedSubviews: [label, textField])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }
    
    // MARK: API

    func getUserInput() -> TripMetaData {
        return TripMetaData(
            destination: destinationTextField.text ?? "",
            travelMonth: travelMonthTextField.text ?? "",
            numberOfDays: Int(numberOfDaysTextField.text ?? "0") ?? 0,
            interests: ["Adventure", "Food", "Luxury"],
            budget: budgetTextField.text ?? "",
            tripType: tripTypeTextField.text ?? "",
            preferences: ["Vegetarian"])
    }
}

