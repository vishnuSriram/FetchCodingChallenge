//
//  MealDataTests.swift
//  FetchCodingChallengeTests
//
//  Created by Vishnu Sriram on 7/1/23.
//

import XCTest
@testable import FetchCodingChallenge

final class FetchCodingChallengeSlowTests: XCTestCase {

    var sut: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }
    
    // Testing to see whether we can load desserts within 5 seconds
    func testLoadMealDataApiCallGetsHTTPStatusCode200() throws {
      // given
      let urlString =
        "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
      let url = URL(string: urlString)!
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }

    // Testing to see whether we can load a recipe within 5 seconds
    func testLoadMealDetailDataApiCallGetsHTTPStatusCode200() throws {
      // Given "Apam balik" with id=53049, the first dessert alphabetically in the database
      let urlString =
        "https://themealdb.com/api/json/v1/1/lookup.php?i=53049"
      let url = URL(string: urlString)!
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url) { _, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }
}
