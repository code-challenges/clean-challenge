//
//  ExternalInterfacesTests.swift
//  ExternalInterfacesTests
//
//  Created by Julio Cesar Guzman Villanueva on 10/22/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import XCTest
@testable import ExternalInterfaces

class NetworkingIntegrationTest: XCTestCase {
    var expectation = XCTestExpectation()
    let waiter = XCTWaiter()
    func testThatAPIReturnsItems() {
        waiter.wait(for: [expectation], timeout: 10)
        let task = URLSession.shared.itemsTask(with: URL.GenioSampleData) { (items) in
            if items.isEmpty { XCTFail("Items from API should not be empty") }
            self.expectation.fulfill()
        }
        task.resume()
    }
}
