//
//  DummyData.swift
//  AItinireary
//
//  Created by Darshan Dodia on 01/02/25.
//

import Foundation

class DummyData {
    
    static let tripMetaData_1 = TripMetaData(destination: "Mumbai", travelMonth: "July", numberOfDays: 2, interests: ["Adventure", "Food", "Bollywood"], budget: "Low", tripType: "Solo", preferences: ["Veg"])
    
    static let tripMetaData_2 = TripMetaData(destination: "Tokyo", travelMonth: "August", numberOfDays: 2, interests: ["Adventure", "Hike", "Relaxation"], budget: "Low", tripType: "Partner", preferences: ["Veg"])
    
    static let tripMetaData_3 = TripMetaData(destination: "Kashmir", travelMonth: "December", numberOfDays: 2, interests: ["Adventure", "Food", "Roadtrip"], budget: "Low", tripType: "Solo", preferences: ["Veg"])

    static let morningActivity = [
        Activity(locationName: "Gateway of India", description: "Take a good look at this iconic view"),
        Activity(locationName: "Asiatic Society", description: "Experience the colonial architecture")
    ]
    
    static let afternoonActivity = [
        Activity(locationName: "Kitab Khaana", description: "Buy a good book for your flight back home"),
        Activity(locationName: "Reegal Cinema", description: "Watch a movie in this iconic theatre")
    ]
    
    static let eveningActivity = [
        Activity(locationName: "Marine Drive", description: "Take a stroll on the iconic queens necklace"),
        Activity(locationName: "Pizza by the Bay", description: "Get some pizzas for dinner at this historic site")
    ]
    
    
    static let dayOnePlan = DayPlan(day: 1, morning: morningActivity, afternoon: afternoonActivity, evening: eveningActivity, travelTips: [
        "Carry cash for small purchases and street food.",
                "Bargain respectfully while shopping at local markets.",
                "Stay hydrated by carrying a reusable water bottle."
    ])
    
    static let dayTwoPan = DayPlan(day: 2, morning: eveningActivity, afternoon: afternoonActivity, evening: morningActivity, travelTips: [
        "Stay hydrated by carrying a reusable water bottle.",
        "Bargain respectfully while shopping at local markets.",
        "Carry cash for small purchases and street food.",
    ])
    
    static let dummyTravelPlan_1 = TripPlan(metadata: tripMetaData_1, itinerary: [dayOnePlan, dayTwoPan])
    
    static let dummyTravelPlan_2 = TripPlan(metadata: tripMetaData_2, itinerary: [dayOnePlan, dayTwoPan])
    
    static let dummyTravelPlan_3 = TripPlan(metadata: tripMetaData_3, itinerary: [dayOnePlan, dayTwoPan])
}
