//
//  HomeScreenView.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

class HomeScreenView: UIView {
    
    // MARK: Variables

    private var addItineraryViewDelegate: AddItineraryViewDelegate? //DD: Ask Sameer about this
    
    // MARK: Lazy Vars

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "AI-tinerary"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var savedItineraryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved Itineraries"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var savedItinerariesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SavedItineraryTableViewCell.self, forCellReuseIdentifier: SavedItineraryTableViewCell.cellReuseID)
        tableView.separatorColor = .gray
        
        return tableView
    }()
    
    private lazy var addItineraryLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Itinerary"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundSemicircleLayer: CAShapeLayer = {
        let backgroundSemicircleLayer = CAShapeLayer()
        backgroundSemicircleLayer.fillColor = UIColor.red.cgColor
        return backgroundSemicircleLayer
    }()

    private lazy var addItineraryTappableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(self.addItineraryViewTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()

    // MARK: Init
    
    init(delegate: ViewController) {
        super.init(frame: CGRect.zero)
        
        self.addItineraryViewDelegate = delegate
        savedItinerariesTableView.dataSource = delegate
        savedItinerariesTableView.delegate = delegate
        
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides

    override func layoutSubviews() {
        super.layoutSubviews()

        let center = CGPoint(x: bounds.midX, y: bounds.height + 20)
        let radius = bounds.width * 0.75

        // Create a path for the semicircle
        let path = UIBezierPath(arcCenter: center,
                               radius: radius,
                               startAngle: .pi,
                               endAngle: 2 * .pi,
                               clockwise: true)

        backgroundSemicircleLayer.path = path.cgPath
    }
    
    // MARK: Setup
    
    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(savedItineraryTitleLabel)
        
        layer.addSublayer(backgroundSemicircleLayer)
        backgroundSemicircleLayer.addSublayer(addItineraryLabel.layer)
        
        addSubview(savedItinerariesTableView)
        addSubview(addItineraryLabel)
        addSubview(addItineraryTappableView)
    }
    
    private func setupViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24.0),
            
            savedItineraryTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            savedItineraryTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48.0),
            
            savedItinerariesTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            savedItinerariesTableView.topAnchor.constraint(equalTo: savedItineraryTitleLabel.bottomAnchor, constant: 24.0),
            savedItinerariesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            savedItinerariesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            savedItinerariesTableView.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            addItineraryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            addItineraryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -96.0),
            
            addItineraryTappableView.topAnchor.constraint(equalTo: bottomAnchor, constant: -300),
            addItineraryTappableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            addItineraryTappableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            addItineraryTappableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Interaction Handler

    @objc func addItineraryViewTapped() {
        addItineraryViewDelegate?.addItineraryButtonTapped()
    }
}
