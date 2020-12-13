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

    var sut: OrderData!
    let productName = "Smart phone"
    let quantity = 10
    let price = 1000
    let stateCode = "TX"
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOrderModelStruc_canCreateNewInstance() {
       // let sut = OrderData(name: "Laptop", quantity: 5, price: 1000, stateCode: "TX")
        sut = OrderData(name: productName, quantity: quantity, price: price, stateCode: stateCode)
        XCTAssertNotNil(sut)
        
    }
     
    // Product Name should not be empty - No special character
    // alphabet minimum and Maximum lenth
    func testProductName_shouldPassIfValidProductName() {
      sut = OrderData(name: productName, quantity: quantity, price: price, stateCode: stateCode)
       XCTAssertTrue(sut.isValidProductName())
    }
    
    // Product Quantity should be not empty - No special character
    // number Int minimum and Maximum quantity
    func testProductQuantity_shouldPassIfValidProductNumber() {
        sut = OrderData(name: productName, quantity: quantity, price: price, stateCode: stateCode)
          XCTAssertTrue(sut.isValidQuantityNumber())
       }
    
    // Product Price should be not empty - No special character
    // number Int minimum and Maximum price
    func testProductPrice_shouldPassIfValidProductPrice() {
       sut = OrderData(name: productName, quantity: quantity, price: price, stateCode: stateCode)
       XCTAssertTrue(sut.isValidPrice())
    }

    // Product state code should be not empty - No special character
    // fix 2 letters
    func testStateCode_shouldPassIfValidStateCode() {
       sut = OrderData(name: productName, quantity: quantity, price: price, stateCode: stateCode)
       XCTAssertTrue(sut.isValidStateCode())
    }
    
    func testOrderData_shouldPassIfValidData() {
       sut = OrderData(name: productName, quantity: quantity, price: price, stateCode: stateCode)
       XCTAssertTrue(sut.isDataValid())
    }
    
}
