//
//  ViewController.swift
//  ShopeApp
//
//  Created by Apple on 12/13/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var stateCodeTextField: UITextField!
    @IBOutlet weak var orderSummaryLbl: UILabel!
    @IBOutlet weak var orderDetailsLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        orderSummaryLbl.isHidden = true
        // Do any additional setup after loading the view.
    }

    func validate() {
        do {
           
            let name = try nameTextField.validatedText(validationType: OrderValidatorType.name)
            let quantity = try self.quantityTextField.validatedText(validationType: OrderValidatorType.quantity)
            let price = try self.priceTextField.validatedText(validationType: OrderValidatorType.price)
            let stateCode = try stateCodeTextField.validatedText(validationType: OrderValidatorType.stateCode)
           
          
            let data = OrderData(name: name, quantity: Int(quantity)!, price: Int(price)!, stateCode: stateCode)
            save(data)
        } catch(let error) {
            showAlert(for: (error as! OrderValidationError).message)
        }
    }
    @IBAction func ValidateAddToCart(_ sender: Any) {
        validate()
        orderSummaryLbl.isHidden = false
    }
    func showAlert(for alert: String) {
              let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert )
              let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
              alertController.addAction(alertAction)
              present(alertController, animated: true, completion: nil)
          }
          
          func save(_ data: OrderData) {
               showAlert(for: "Order Placed Successfully ")
           }
    }


