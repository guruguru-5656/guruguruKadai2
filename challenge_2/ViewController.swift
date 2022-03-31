//
//  ViewController.swift
//  challenge_2
//
//  Created by 森本拓未 on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var firstInputTextField: UITextField!
    @IBOutlet private weak var secondInputTextField: UITextField!
    @IBOutlet private weak var calculatorSelector: UISegmentedControl!
    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func calculate(_ sender: Any) {
        let calculator: (Double, Double) -> Double
        switch calculatorSelector.selectedSegmentIndex {
        case 0:
            calculator = { $0 + $1 }
        case 1:
            calculator = { $0 - $1 }
        case 2:
            calculator = { $0 * $1 }
        case 3:
            calculator = { $0 / $1 }
        default:
            fatalError("selectedSegmentIndex is invalid")
        }

        guard let inputNumberFirst = Double(firstInputTextField.text ?? ""),
              let inputNumberSecond = Double(secondInputTextField.text ?? "")
        else {
            resultLabel.text = "数字を入力してください"
            return
        }

        if calculatorSelector.selectedSegmentIndex == 3 && inputNumberSecond == 0 {
            resultLabel.text = "割る数には0以外を入力してください"
            return
        }

        let result = calculator(inputNumberFirst, inputNumberSecond)
        resultLabel.text = String(result)
    }
}
