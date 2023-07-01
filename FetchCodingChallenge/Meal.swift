//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Vishnu Sriram on 6/30/23.
//

import Foundation

struct Meal: Codable, Identifiable, Equatable {
    // Using a computed property to return idMeal as the ID
    var id: String { idMeal }
    var idMeal: String
    var strMeal: String
    
    // First Meal in API as example
    static let example = Meal(idMeal: "53049", strMeal: "Apam balik")
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        lhs.idMeal == rhs.idMeal
    }
}
