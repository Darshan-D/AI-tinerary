//
//  DayPlan.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation

struct DayPlan: Codable {
    let day: Int
    let morning: [Activity]
    let afternoon: [Activity]
    let evening: [Activity]
    let travelTips: [String]?
}
