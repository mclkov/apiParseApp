//
//  apiParseAppTests.swift
//  apiParseAppTests
//
//  Created by McL on 2/27/19.
//  Copyright © 2019 McL. All rights reserved.
//

import XCTest
@testable import apiParseApp

class apiParseAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testExchangeServiceAToB() {
        // bitcoin to usd
        // Arrange
        let service = ExchangeService()
        service.currencyA = 1 //bitcoin
        service.directionAToB = true
        service.exchangeRate = 3834
        
        // Act
        let result = service.calculate()
        
        // Assert
        XCTAssert(result == 3834)
    }
    
    func testExchangeServiceBToA() {
        // usd to bitcoin
        // Arrange
        let service = ExchangeService()
        service.currencyA = 3834 // usd
        service.directionAToB = false
        service.exchangeRate = 3834
        
        // Act
        let result = service.calculate()
        
        // Assert
        XCTAssert(result == 1)
    }
}
