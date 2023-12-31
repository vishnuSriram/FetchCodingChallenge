//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Vishnu Sriram on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.sortedMeals, id: \.idMeal) { meal in
                VStack(alignment: .leading) {
                    Button(action: {
                        viewModel.selectedMeal = meal
                    }) {
                        Text(meal.strMeal)
                            .font(.headline)
                    }
                    .foregroundColor(.black)
                }
            }
            .environment(\.defaultMinListRowHeight, 75)
            .task {
                await viewModel.loadMealData()
            }
            // A sheet view that you can easily dismiss by swiping down is ideal here!
            .sheet(item: $viewModel.selectedMeal) { meal in
                DetailView(meal: meal)
                    .presentationDetents([.medium, .large])
            }
            .navigationTitle("Dessert Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
