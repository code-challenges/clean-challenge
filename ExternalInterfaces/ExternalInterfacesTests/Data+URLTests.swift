//
//  DataTests.swift
//  ExternalInterfacesTests
//
//  Created by Julio Cesar Guzman Villanueva on 11/10/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import XCTest
@testable import ExternalInterfaces

class DataTests: XCTestCase {
    func testDataFromURL() {
        let url = URL(string: "https://pbs.twimg.com/profile_images/733357604823543808/ldjN2Qas_400x400.jpg")!
        Data.make(with: url) { (optionalData) in
            XCTAssertNotNil(optionalData, "Image from URL could not be loaded")
        }
    }
}
