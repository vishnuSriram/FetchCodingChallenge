//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Vishnu Sriram on 6/30/23.
//

import Foundation

struct Meal: Codable, Identifiable, Equatable {
    /*
     Using a computed property to return idMeal as the ID to conform to Identifiable protocol
     */
    var id: String { idMeal }
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
    
    // First Meal in API as example
    static let example = Meal(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        lhs.idMeal == rhs.idMeal
    }
}
