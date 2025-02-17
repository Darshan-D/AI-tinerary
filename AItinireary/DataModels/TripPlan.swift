//
//  TripPlan.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation

struct TripPlan: Codable {
    let metadata: TripMetaData
    let itinerary: [DayPlan]
}
