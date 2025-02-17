//
//  TripMetaData.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation

struct TripMetaData: Codable {
    let destination: String
    let travelMonth: String
    let numberOfDays: Int
    let interests: [String]
    let budget: String
    let tripType: String
    let preferences: [String]
}
