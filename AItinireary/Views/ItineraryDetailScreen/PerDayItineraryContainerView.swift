//
//  PerDayItineraryContainerView.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

enum LabelType {
    case dayTitle
    case sessionTitle
    case destinationTitle
    case destinationDescription
}

class PerDayItineraryContainerView: UIView {
    
    // MARK: Lazy var
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tripItineraryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: Init
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: API
    
    func bindViewData(tripDetails: TripPlan) {
        let itinerary = tripDetails.itinerary
        for day in itinerary {
            tripItineraryStackView.addArrangedSubview(makeUILabel(text: "Day \(day.day) -----------------" , labelType: .dayTitle))
            tripItineraryStackView.addArrangedSubview(makeUILabel(text: "--------------------  Morning" , labelType: .sessionTitle))
            for activity in day.morning {
                tripItineraryStackView.addArrangedSubview(makeUILabel(text: activity.locationName, labelType: .destinationTitle))
                tripItineraryStackView.addArrangedSubview(makeUILabel(text: activity.description, labelType: .destinationDescription))
            }
            
            tripItineraryStackView.addArrangedSubview(makeUILabel(text: "------------------ Afternoon" , labelType: .sessionTitle))
            for activity in day.afternoon {
                tripItineraryStackView.addArrangedSubview(makeUILabel(text: activity.locationName, labelType: .destinationTitle))
                tripItineraryStackView.addArrangedSubview(makeUILabel(text: activity.description, labelType: .destinationDescription))
            }
            
            tripItineraryStackView.addArrangedSubview(makeUILabel(text: "--------------------   Evening" , labelType: .sessionTitle))
            for activity in day.evening {
                tripItineraryStackView.addArrangedSubview(makeUILabel(text: activity.locationName, labelType: .destinationTitle))
                tripItineraryStackView.addArrangedSubview(makeUILabel(text: activity.description, labelType: .destinationDescription))
            }
        }
        tripItineraryStackView.addArrangedSubview(makeUILabel(text: "------------------------------" , labelType: .dayTitle))
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    // MARK: Private Helper
    
    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(tripItineraryStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tripItineraryStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tripItineraryStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tripItineraryStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tripItineraryStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tripItineraryStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func makeUILabel(text: String, labelType: LabelType) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center

        switch labelType {
        case .dayTitle:
            label.font = UIFont.systemFont(ofSize: 25, weight: .light)
            label.textAlignment = .left
        case .sessionTitle:
            label.font = UIFont.systemFont(ofSize: 20, weight: .light)
            label.textAlignment = .right
        case .destinationTitle:
            label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        case .destinationDescription:
            label.font = UIFont.systemFont(ofSize: 12, weight: .light)
            label.numberOfLines = 3
        }
        
        return label
    }
}
