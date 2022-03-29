//
//  ViewController.swift
//  challenge_2
//
//  Created by 森本拓未 on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var inputTextFieldFirst: UITextField!
    @IBOutlet private weak var inputTextFieldSecond: UITextField!
    @IBOutlet private weak var calculatorSelector: UISegmentedControl!
    @IBOutlet private weak var resultLavel: UILabel!
    private var calculator: (Double, Double) -> Double = { $0 + $1 }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func selectCalculator(_ sender: Any) {
        switch calculatorSelector.selectedSegmentIndex {
        case 0:
            calculator = { $0 + $1 }
        case 1:
            calculator = { $0 - $1 }
        case 2:
            calculator = { $0 * $1 }
        case 3:
            calculator = { $0 / $1 }
        default: return
        }
    }
    @IBAction private func calculate(_ sender: Any) {
        guard let inputNumberFirst = Double(inputTextFieldFirst.text ?? ""),
              let inputNumberSecond = Double(inputTextFieldSecond.text ?? "")
        else {
            resultLavel.text = "数字を入力してください"
            return
        }
        if calculatorSelector.selectedSegmentIndex == 3 && inputNumberSecond == 0 {
            resultLavel.text = "割る数には0以外を入力してください"
            return
        }
        let result = calculator(inputNumberFirst, inputNumberSecond)
        resultLavel.text = String(result)
    }
}
