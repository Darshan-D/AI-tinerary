//
//  MakeItineraryViewController.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import Lottie
import UIKit

class MakeItineraryViewController: UIViewController {
    
    // MARK: Properties
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        
        button.configuration = HelperUtils.createButtonConfiguration(title: "< Back", buttonColor: .red)
        button.setNeedsUpdateConfiguration()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var getTripDetailsView: GatherItineraryDetailsView = {
        let view = GatherItineraryDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var generateItineraryButton: UIButton = {
        let button = UIButton()
        
        button.configuration = HelperUtils.createButtonConfiguration(title: "Generate Itinerary!!", buttonColor: .black)
        button.setNeedsUpdateConfiguration()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.generateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var loadingAnimationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "loading")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.isHidden = true
        return view
    }()

    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        updateLoadingViewState(isLoading: false)
    }
    
    // MARK: Private Helper
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(getTripDetailsView)
        view.addSubview(backButton)
        view.addSubview(generateItineraryButton)
        
        view.addSubview(blurEffectView)
        view.addSubview(loadingAnimationView)
        
        NSLayoutConstraint.activate([
            getTripDetailsView.topAnchor.constraint(equalTo: view.topAnchor),
            getTripDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            getTripDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            getTripDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            generateItineraryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            generateItineraryButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -16),

            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            
            blurEffectView.topAnchor.constraint(equalTo: getTripDetailsView.titleLabel.bottomAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            loadingAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func updateLoadingViewState(isLoading: Bool) {
        if isLoading {
            blurEffectView.isHidden = false
            loadingAnimationView.isHidden = false
            getTripDetailsView.titleLabel.text = "Generating ..."
            loadingAnimationView.play()
        } else {
            blurEffectView.isHidden = true
            loadingAnimationView.isHidden = true
            getTripDetailsView.titleLabel.text = "Start typing, for AI Magic"
            loadingAnimationView.pause()
        }
    }
    
    // MARK: Interaction Handler
    
    @objc func backButtonTapped() {
        print("LOG: Dismissing MakeItineraryViewController")
        dismiss(animated: true)
    }
    
    @objc func generateButtonTapped() {
        print("LOG: Generate itinerary button tapped")
        
        updateLoadingViewState(isLoading: true)
    
        let query = getTripDetailsView.getUserInput()
        Task {
            let tripPlan = await NetworkManager.shared.generateAIResponse(query: query)
            guard let tripPlan else {
                print("LOG: Failed to generate itinerary")
                updateLoadingViewState(isLoading: false)
                return
            }

            let detailScreenViewController = ItineraryDetailScreenViewController(tripDetails: tripPlan)
            detailScreenViewController.modalPresentationStyle = .fullScreen
            self.present(detailScreenViewController, animated: true)
        }
    }
}
