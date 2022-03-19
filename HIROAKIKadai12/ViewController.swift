//
//  ViewController.swift
//  HIROAKIKadai12
//
//  Created by HiroakiSaito on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var beforTaxTextField: UITextField!
    @IBOutlet private weak var taxTextFieild: UITextField!
    @IBOutlet private weak var includingTaxLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        includingTaxLabel.text = UserDefaults.standard.string(forKey: "TaxPrice") ?? ""
    }

    @IBAction private func totalcalc(_ sender: Any) {
        var totalPrice = 0
        let priceBeforTax = Double(beforTaxTextField.text ?? "") ?? 0.0
        let tax = Double(taxTextFieild.text ?? "") ?? 0.0

        totalPrice = Int(priceBeforTax * tax)
        includingTaxLabel.text = String(totalPrice)

        UserDefaults.standard.set(String(totalPrice), forKey: "TaxPrice")
    }
}
