//
//  ItineraryDetailScreenView.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

class ItineraryDetailScreenView: UIView {
    
    // MARK: Lazy Vars
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleAndDetailsViewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var interestsLabel: UILabel = {
        let label = UILabel()
        label.text = "Interests: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var numOfDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of days: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var budgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Budget: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var tripTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Trip type: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var preferencesLabel: UILabel = {
        let label = UILabel()
        label.text = "Preferences: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var tripDetailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var detailsViewAndTableViewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var perDayItineraryContainerView: PerDayItineraryContainerView = {
        let view = PerDayItineraryContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Init
    
    init(delegate: ItineraryDetailScreenViewController) {
        super.init(frame: CGRect.zero)

        setupViewHierarchy()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: APIs
    
    func bindViewData(tripDetails: TripPlan) {
        let metadata = tripDetails.metadata
        titleLabel.text = "\(metadata.destination) in \(metadata.travelMonth)"
        numOfDaysLabel.text = getLabelText(existingText: numOfDaysLabel.text, newText: String(metadata.numberOfDays))
        interestsLabel.text = getLabelText(existingText: interestsLabel.text, newText: concatenateArrayToString(array: metadata.interests))
        budgetLabel.text = getLabelText(existingText: budgetLabel.text, newText: metadata.budget)
        tripTypeLabel.text = getLabelText(existingText: tripTypeLabel.text, newText: metadata.tripType)
        preferencesLabel.text = getLabelText(existingText: preferencesLabel.text, newText: concatenateArrayToString(array: metadata.preferences))
        
        perDayItineraryContainerView.bindViewData(tripDetails: tripDetails)
    }
    
    // MARK: Setup

    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(titleAndDetailsViewSeparator)
        tripDetailsStackView.addArrangedSubview(numOfDaysLabel)
        tripDetailsStackView.addArrangedSubview(interestsLabel)
        tripDetailsStackView.addArrangedSubview(budgetLabel)
        tripDetailsStackView.addArrangedSubview(tripTypeLabel)
        tripDetailsStackView.addArrangedSubview(preferencesLabel)
        addSubview(tripDetailsStackView)
        addSubview(detailsViewAndTableViewSeparator)
        addSubview(perDayItineraryContainerView)
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24.0),
            titleLabel.bottomAnchor.constraint(equalTo: titleAndDetailsViewSeparator.topAnchor, constant: -16),
            
            titleAndDetailsViewSeparator.heightAnchor.constraint(equalToConstant: 4),
            titleAndDetailsViewSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
            titleAndDetailsViewSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -72),
            titleAndDetailsViewSeparator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tripDetailsStackView.topAnchor.constraint(equalTo: titleAndDetailsViewSeparator.bottomAnchor, constant: 16),
            tripDetailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tripDetailsStackView.bottomAnchor.constraint(equalTo: detailsViewAndTableViewSeparator.topAnchor, constant: -16),
            tripDetailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            detailsViewAndTableViewSeparator.heightAnchor.constraint(equalToConstant: 4),
            detailsViewAndTableViewSeparator.topAnchor.constraint(equalTo: tripDetailsStackView.bottomAnchor, constant: 16),
            detailsViewAndTableViewSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
            detailsViewAndTableViewSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -72),
            detailsViewAndTableViewSeparator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            perDayItineraryContainerView.topAnchor.constraint(equalTo: detailsViewAndTableViewSeparator.bottomAnchor, constant: 16),
            perDayItineraryContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            perDayItineraryContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            perDayItineraryContainerView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: -32),
        ])
    }
    
    // MARK: Private Helpers
    
    private func getLabelText(existingText: String?, newText: String) -> String {
        guard let existingText else {
            return newText
        }

        return existingText + newText
    }
    
    private func concatenateArrayToString(array: [String]) -> String {
        return array.joined(separator: ", ")
    }
}
