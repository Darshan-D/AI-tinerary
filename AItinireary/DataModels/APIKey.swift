//
//  APIKey.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation

enum APIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist") else {
            fatalError("Couldn't find GenerativeAI-Info.plist")
        }
        
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find API_KEY in GenerativeAI-Info.plist")
        }
        
        if value.starts(with: "_") {
            fatalError("Invalid API KEY")
        }
        
        return value
    }
}
