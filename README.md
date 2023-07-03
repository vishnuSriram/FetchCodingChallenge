# FetchCodingChallenge
## Description
A SwiftUI app that helps you explore dessert recipes from https://www.themealdb.com! This app displays recipe names in a list, with a sheet view for each individual recipe. Yum 😋
## Getting started
1. Make sure you have Xcode version 14.0 or above installed on your computer.
2. iOS deployment target is set to 16.0 for this project, but please make sure that your iOS deployment target is at least set to 13.0.
## Architecture
- FetchCodingChallenge implements an <b>MVVM (Model-View-View-Model)</b> architecture pattern.
- There is a ContentView as the default view with ContentView-ViewModel, as well as a DetailView. The ContentView-ViewModel loads a list of desserts, as well as dessert details from TheMealDB.com using vanilla Swift via async/await.
## Structure
- "views" holds ContentView and DetailView
- "view-models" holds ContentView-ViewModel
- "models" holds Meal, MealDetail, MealResponse, and MealDetailResponse which all represent Codable objects
## Running the tests
- FetchCodingChallenge has unit tests written using the built-in framework XCTest.
- There are 2 unit tests written in "FetchCodingChallengeSlowTests" which verify a successful HTTP response of status code 200 for hitting TheMealDb.com APIs
- The 1st test hits this API endpoint which lists all desserts: https://themealdb.com/api/json/v1/1/filter.php?c=Dessert f
- The 2nd test hits this API endpoint which lists the meal details for the first dessert alphabetically in the database ("Apam balik" with id=53049): "https://themealdb.com/api/json/v1/1/lookup.php?i=53049"

