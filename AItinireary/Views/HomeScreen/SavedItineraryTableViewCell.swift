//
//  ItineraryTableViewCell.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

class SavedItineraryTableViewCell: UITableViewCell {
    
    static let cellReuseID = "savedItineraryTableViewCell"
    
    // MARK: Lazy Vars
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    // MARK: Initializers
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: APIs
    
    func bindViewData(title: String) {
        self.titleLabel.text = title
    }

    // MARK: Private Helpers

    private func setupViews() {
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
        ])
    }
}
