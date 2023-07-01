//
//  ContentView-ViewModel.swift
//  FetchCodingChallenge
//
//  Created by Vishnu Sriram on 6/30/23.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var meals = [Meal]()
        @Published private(set) var sortedMeals = [Meal]()
        @Published var selectedMeal: Meal?
        
        func loadMealData() async {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                            
                if let decodedMealResponse = try? JSONDecoder().decode(MealResponse.self, from: data) {
                    meals = decodedMealResponse.meals
                    /* The meals in the API response are already sorted alphabetically, but for the sake of alphabetizing the meals for practice, let's randomize them, then alphabetize them!
                     */
                    let randomizedMeals = meals.shuffled()
                    sortedMeals = randomizedMeals.sorted(by: { $0.strMeal < $1.strMeal })
                }
            } catch {
                print("Invalid data")
            }
        }
    }
}
