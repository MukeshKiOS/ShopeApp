//
//  UITextField+Extensions.swift
//  ShopeAppTests
//
//  Created by Apple on 12/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
