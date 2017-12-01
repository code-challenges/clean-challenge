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
    let taskExpectation = XCTestExpectation()
    let waiter = XCTWaiter()
    var task : URLSessionTask?
    func testThatAPIReturnsItems() {
        task = URLSession.shared.itemsTask(with: URL.LiverpoolSearch) { (items) in
            if items.isEmpty { XCTFail("Items from API should not be empty") }
            self.taskExpectation.fulfill()
        }
        task?.resume()
        wait(for: [taskExpectation], timeout: 10)
    }
}
