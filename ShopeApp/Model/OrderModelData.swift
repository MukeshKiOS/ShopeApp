//
//  OrderModelData.swift
//  ShopeAppTests
//
//  Created by Apple on 12/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct OrderData {
    var name: String
    var quantity: Int
    var price: Int
    var stateCode: String

}

extension OrderData {
    
    // Product Name should not be empty - No special character
    // alphabet minimum and Maximum lenth
    
    func isValidProductName() -> Bool {
        return !name.isEmpty && name.count > 2 && name.count < 50
    }
    
   // Product Quantity should be not empty - No special character
    // number Int minimum and Maximum quantity
    
    func isValidQuantityNumber() -> Bool {
        return quantity > 1 && quantity <= 100
    }
    
    // Product Price should be not empty - No special character
    // number Int minimum and Maximum price

    func isValidPrice() -> Bool {
        return price > 100 && price < 50000
    }
    
    // Product state code should be not empty - No special character
    // fix 2 letters
    
    func isValidStateCode() -> Bool {
        return stateCode.count > 1 && stateCode.count < 3
    }
    
    func isDataValid() -> Bool {
        return isValidProductName() && isValidQuantityNumber() && isValidPrice() && isValidStateCode()
    }
}
