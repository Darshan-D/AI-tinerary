//
//  ViewUtils.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation
import UIKit

class HelperUtils {
    
    static func createButtonConfiguration(title: String, buttonColor: UIColor) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.baseForegroundColor = buttonColor
        config.cornerStyle = .capsule

        config.background.strokeColor = buttonColor
        config.background.strokeWidth = 1.0
        config.background.backgroundColor = .white
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 20)
            return outgoing
        }
        
        return config
    }
    
    static func travelItineraryPrompt(inputJSON: String) -> String {
        return """
        
        
        
        You are a travel assistant specializing in creating detailed, well-structured travel itineraries.



        Generate a personalized travel itinerary based on the provided user inputs.



        Your itinerary must be realistic, well-balanced, and engaging. The plan should account for travel time, budget constraints, and user preferences.



        Each day’s itinerary should include:

        1. Morning activities

        2. Afternoon activities

        3. Evening activities

        4. Dining recommendations (if applicable)

        5. Additional travel tips



        For each time slot (morning, afternoon, evening), provide:

        - "locationName": The name of the place being visited.

        - "description": A short summary of what the user can do or experience there.



        The output must always be in valid JSON format.


        EXAMPLE:



        SAMPLE INPUT:

        {
            "destination": "Mumbai",
            "travel_dates": "September",
            "number_of_days": 2,
            "budget": "Low",
            "trip_type": "Solo",
        }



        SAMPLE OUTPUT:

        {
            "metadata": {
                "destination": "Mumbai",
                "travelMonth": "September",
                "numberOfDays": 2,
                "interests": ["Adventure", "Culture", "Food", "Relaxation"],
                "budget": "Low",
                "tripType": "Solo",
                "preferences": ["Vegetarian"],
            },
            "itinerary": [
                {
                    "day": 1,
                    "morning": [
                        {
                            "locationName": "Gateway of India",
                            "description": "Visit this iconic landmark and enjoy the sea breeze."
                        },
                        {
                            "locationName": "Elephanta Caves",
                            "description": "Take a ferry (₹200 ferry + ₹40 entry) to explore ancient rock-cut temples."
                        }
                    ],
                    "afternoon": [
                        {
                            "locationName": "Shree Thaker Bhojanalay",
                            "description": "Enjoy a delicious vegetarian thali at this famous eatery (₹400)."
                        },
                        {
                            "locationName": "Chhatrapati Shivaji Maharaj Vastu Sangrahalaya",
                            "description": "Explore Mumbai’s rich history and art collection (₹85 entry)."
                        }
                    ],
                    "evening": [
                        {
                            "locationName": "Marine Drive",
                            "description": "Walk along the scenic coastline and relax at Girgaum Chowpatty."
                        },
                        {
                            "locationName": "Local Street Stalls",
                            "description": "Try Sev Puri & Bhelpuri from popular stalls (₹50-₹100)."
                        }
                    ],
                    "travel_tips": [
                        "Take a local train to save money and experience Mumbai like a local."
                    ]
                },
                {
                    "day": 2,
                    "morning": [
                        {
                            "locationName": "Sanjay Gandhi National Park & Kanheri Caves",
                            "description": "Go for a hike and explore ancient Buddhist rock-cut caves (₹85 entry)."
                        }
                    ],
                    "afternoon": [
                        {
                            "locationName": "Ram Ashraya, Matunga",
                            "description": "Savor authentic South Indian vegetarian food (₹150)."
                        },
                        {
                            "locationName": "Haji Ali Dargah",
                            "description": "Visit this famous pilgrimage site surrounded by water."
                        }
                    ],
                    "evening": [
                        {
                            "locationName": "Colaba Causeway",
                            "description": "Shop for souvenirs and explore the bustling market."
                        },
                        {
                            "locationName": "Cafe Madras",
                            "description": "End your trip with filter coffee and crispy dosas (₹200)."
                        }
                    ],
                    "travel_tips": [
                        "Bargain at street markets and carry cash for small purchases."
                    ]
                }
            ]
        }

        DO NOT USE ANY INVALID CHARACTERS WHICH MIGHT FAIL JSON PARSING. EG: 'Â'

        
        Now give me output for following input
        
        
        ACTUAL INPUT:
        
        \(inputJSON)
        """
    }
}
