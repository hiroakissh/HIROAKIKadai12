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

    private let taxkey = "TAX"

    override func viewDidLoad() {
        super.viewDidLoad()
        beforTaxTextField.keyboardType = .numberPad
        taxTextFieild.keyboardType = .decimalPad

        let saveTax = UserDefaults.standard.float(forKey: taxkey)
        taxTextFieild.text = String(saveTax)
    }

    @IBAction private func totalcalc(_ sender: Any) {
        let priceBeforTax = Float(beforTaxTextField.text ?? "") ?? 0.0
        let tax = Float(taxTextFieild.text ?? "") ?? 0.0

        let totalPrice = Int(priceBeforTax * (1 + (tax / 100.0)))
        includingTaxLabel.text = String(totalPrice)

        UserDefaults.standard.set(tax, forKey: taxkey)
    }
}
