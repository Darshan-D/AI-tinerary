//
//  NetworkManager.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import GoogleGenerativeAI

class NetworkManager {

    // MARK: Singleton instance
    
    static let shared = NetworkManager()
    
    // MARK: Properties

    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)

    // MARK: Initializer

    private init() {
        // no-op
    }
    
    // MARK: API
    
    func generateAIResponse(query: TripMetaData) async -> TripPlan? {
        let prompt = generatePrompt(query: query)

        // Call the async function to generate text
        let generatedText = await generateResponseV2(prompt: prompt)
        return generatedText
    }
    
    // MARK: Private Helper
    
    private func generatePrompt(query: TripMetaData?) -> String {
        do {
            let tripData = try JSONEncoder().encode(query)
            let tripJSONString = String(data: tripData, encoding: .utf8)
            return HelperUtils.travelItineraryPrompt(inputJSON: tripJSONString ?? "")
        } catch {
            print("ERROR: Unable to encode `TripMetaData` into string")
        }
        return ""
    }
    
    private func generateResponseV2(prompt: String) async -> TripPlan? {
        do {
            print("LOG: Generating itinerary now ...")
            let response = try await model.generateContent(prompt)
            print("LOG: Generated Response: \(String(describing: response.text))")

            if let jsonData = response.text?.data(using: .utf8) {
                do {
                    let travelDetails = try JSONDecoder().decode(TripPlan.self, from: jsonData)
                    return travelDetails
                } catch {
                    print("ERROR: Unable to decode response string into `TripMetaData` because of error: \(error)")
                }
            }
            
            return nil
        } catch {
            print("ERROR: Unable to generate content because of error: \(error)")
            return nil
        }
    }
}
