//
//  OrdersViewModel.swift
//  ShopeApp
//
//  Created by Apple on 12/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

class OrderValidationError: Error {
   
        var message: String
        
        init(_ message: String) {
            self.message = message
        }
    }

    protocol ValidatorConvertible {
        func validated(_ value: String) throws -> String
    }

    enum OrderValidatorType {
        case name
        case quantity
        case price
        case stateCode
        case requiredField(field: String)

    }

enum VaildatorFactory {
    static func validatorFor(type: OrderValidatorType) -> ValidatorConvertible {
        switch type {
        case .name: return NameValidator()
        case .quantity: return QuantityValidator()
        case .price: return PriceValidator()
        case .stateCode: return StateCodeValidator()
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
            
        }
    }
}

struct RequiredFieldValidator: ValidatorConvertible {
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {
            throw OrderValidationError("Required field " + fieldName)
        }
        return value
    }
}

struct NameValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value.count >= 2 else {
            throw OrderValidationError("Product name must contain more than Two characters" )
        }
        guard value.count < 20 else {
            throw OrderValidationError("Product name shoudn't contain more than 20 characters" )
        }
        
        do {
            if try NSRegularExpression(pattern: "^[a-z]{1,20}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw OrderValidationError("Invalid Product name, Product name should not contain whitespaces, numbers or special characters")
            }
        } catch {
            throw OrderValidationError("Invalid Product name, Product name should not contain whitespaces,  or special characters")
        }
        return value
    }
}

class QuantityValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value.count > 0 else {throw OrderValidationError("Quantity is required")}
        guard let quantValue = Int(value) else {throw OrderValidationError("Quantity must be a number!")}
        guard value.count < 4 else {throw OrderValidationError("Invalid bulk quantity number!")}
        guard quantValue >= 1 else {throw OrderValidationError("Quantity should not more than 1 :)")}
        return value
        
    }
}
    class PriceValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value.count > 1 else {throw OrderValidationError("Price is required")}
        guard let price = Int(value) else {throw OrderValidationError("Price must be a number!")}
        guard price <= 50000 else {throw OrderValidationError("Maximum price of our product is 50,000 :")}
        guard price >= 100 else {throw OrderValidationError("Price is required minimum 100")}
        return value
    }
}
    struct StateCodeValidator: ValidatorConvertible {
        func validated(_ value: String) throws -> String {
            guard value.count >= 2 else {
                throw OrderValidationError("State code must be equal to two characters" )
            }
            guard value.count < 3 else {
                throw OrderValidationError("State code must be equal to two characters" )
            }
            
            do {
                if try NSRegularExpression(pattern: "^[a-z]{1,2}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                    throw OrderValidationError("Invalid state code, username should not contain whitespaces, numbers or special characters")
                }
            } catch {
                throw OrderValidationError("Invalid state code, state code should not contain whitespaces,  or special characters")
            }
            return value
        }
    }

