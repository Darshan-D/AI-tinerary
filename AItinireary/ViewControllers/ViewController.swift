//
//  ViewController.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import UIKit

class ViewController: UIViewController {

    private let mockTripData: [TripPlan] = [DummyData.dummyTravelPlan_1, DummyData.dummyTravelPlan_2, DummyData.dummyTravelPlan_3]
    
    private lazy var homeScreenView: HomeScreenView = {
        let view = HomeScreenView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeScreenView)
        
        NSLayoutConstraint.activate([
            homeScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: AddItineraryViewDelegate

extension ViewController: AddItineraryViewDelegate {
    func addItineraryButtonTapped() {
        print("LOG: Launching MakeItineraryViewController")
        let makeItineraryViewController = MakeItineraryViewController()
        makeItineraryViewController.modalPresentationStyle = .fullScreen
        self.present(makeItineraryViewController, animated: true)
    }
}

// MARK: UITableViewDelegate & UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("LOG: Launching ItineraryDetailScreenViewController")
        let detailScreenViewController = ItineraryDetailScreenViewController(tripDetails: mockTripData[indexPath.row])
        detailScreenViewController.modalPresentationStyle = .fullScreen
        self.present(detailScreenViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockTripData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedItineraryTableViewCell.cellReuseID, for: indexPath as IndexPath)
        
        guard let tableViewCell = cell as? SavedItineraryTableViewCell else {
            return cell
        }

        tableViewCell.bindViewData(title: "\(mockTripData[indexPath.row].metadata.destination)")
        return cell
    }
}
