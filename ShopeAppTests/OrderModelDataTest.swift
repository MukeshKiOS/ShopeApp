//
//  OrderModelDataTest.swift
//  ShopeAppTests
//
//  Created by Apple on 12/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import ShopeApp

class OrderModelDataTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOrderModelStruc_canCreateNewInstance() {
        let sut = OrderData(name: "Laptop", quantity: 5, price: 1000, stateCode: "TX")
        XCTAssertNotNil(sut)
        
    }


}
