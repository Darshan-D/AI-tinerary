//
//  ItineraryDetailScreen.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

class ItineraryDetailScreenViewController: UIViewController {
    
    // MARK: Properties
    
    private let tripDetails: TripPlan
    
    private lazy var detailScreenView: ItineraryDetailScreenView = {
        let view = ItineraryDetailScreenView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        
        button.configuration = HelperUtils.createButtonConfiguration(title: "< Back", buttonColor: .red)
        button.setNeedsUpdateConfiguration()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: Overrides
    
    init(tripDetails: TripPlan) {
        self.tripDetails = tripDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        detailScreenView.bindViewData(tripDetails: tripDetails)
    }
    
    // MARK: Private Helper
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(detailScreenView)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            detailScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            detailScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }

    // MARK: Interaction Handler
    
    @objc func backButtonTapped() {
        print("LOG: Dismissing ItineraryDetailScreenViewController")
        dismiss(animated: true)
    }
}
