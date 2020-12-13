//
//  OrderViewModelTest.swift
//  ShopeAppTests
//
//  Created by Apple on 12/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest

class OrderViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
        
        func testProductNameValidator() {
            let validator = NameValidator()
            let shortUsername = try? validator.validated( "ab")
            XCTAssertNil(shortUsername)
            
            let tooLongUsername = try? validator.validated("ABCDEFGHIJKLMNOPQRSTU")//20 chars
            XCTAssertNil(tooLongUsername)
            
            let whitespaceUsername = try? validator.validated("a cv as")
            XCTAssertNil(whitespaceUsername)
            
            let specialCharactersUsername = try? validator.validated("a#as!")
            XCTAssertNil(specialCharactersUsername)
            
            let mixedWithNumbers = try? validator.validated("Product123")
            XCTAssertNil(mixedWithNumbers)
            
            let mixedWithNumbers2 = try? validator.validated("123arl12ind123")
            XCTAssertNil(mixedWithNumbers2)
            
            let validProductName = "Laptop"
            let validatedProductName = try? validator.validated(validProductName)
            XCTAssertEqual(validProductName, validatedProductName)
        }
        
        func testQuantityValidator() {
            let validator = QuantityValidator()
            let numbersOnlyQuantity = try? validator.validated("123456")
            XCTAssertNil(numbersOnlyQuantity)
            
            let shortQuantity = try? validator.validated("0")
            XCTAssertNil(shortQuantity)
            
            let lettersOnly = try? validator.validated("abcdef")
            XCTAssertNil(lettersOnly)
            
            let validQuantity = "10"
            let validatedQuantity = try? validator.validated(validQuantity)
            XCTAssertEqual(validatedQuantity, validQuantity)
        }
    
    func testPriceValidator() {
        let validator = PriceValidator()
        let numbersOnlyPrice = try? validator.validated("123456")
        XCTAssertNil(numbersOnlyPrice)
        
        let shortPrice = try? validator.validated("10")
        XCTAssertNil(shortPrice)
        
        let lettersOnly = try? validator.validated("abcdef")
        XCTAssertNil(lettersOnly)
        
        let validPrice = "100"
        let validatedPrice = try? validator.validated(validPrice)
        XCTAssertEqual(validatedPrice, validPrice)
    }
        
    func testStateCodeValidator() {
        let validator = StateCodeValidator()
        
        let whitespaceUsername = try? validator.validated("a cv as")
        XCTAssertNil(whitespaceUsername)
        
        let specialCharactersUsername = try? validator.validated("a#as!")
        XCTAssertNil(specialCharactersUsername)
        
        let mixedWithNumbers = try? validator.validated("Pr123")
        XCTAssertNil(mixedWithNumbers)
        
        let mixedWithNumbers2 = try? validator.validated("123arl12ind123")
        XCTAssertNil(mixedWithNumbers2)
        
        let validStateCode = "TX"
        let validatedProductName = try? validator.validated(validStateCode)
        XCTAssertEqual(validStateCode, validatedProductName)
    }
    
        func testRequiredFieldValidator() {
            let validator = RequiredFieldValidator("Test Field")
            let emptyField = try? validator.validated("")
            XCTAssertNil(emptyField)

            let validField = try? validator.validated("valid field")
            XCTAssertEqual("valid field", validField)
        }
        
    }
