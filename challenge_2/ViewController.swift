//
//  ViewController.swift
//  challenge_2
//
//  Created by 森本拓未 on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var inputTextField_1: UITextField!
    @IBOutlet private weak var inputTextField_2: UITextField!
    @IBOutlet weak var calculatorSelector: UISegmentedControl!
    @IBOutlet weak var resultLavel: UILabel!
    private var calculator: (Double,Double) -> Double = { $0 + $1 }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func selectCalculator(_ sender: Any) {
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
    @IBAction func calculate(_ sender: Any) {
        guard let inputNumber_1 = Double(inputTextField_1.text ?? ""),
              let inputNumber_2 = Double(inputTextField_2.text ?? "")
        else{
            resultLavel.text = "数字を入力してください"
            return
        }
        if calculatorSelector.selectedSegmentIndex == 3 && inputNumber_2 == 0 {
            resultLavel.text = "割る数には0以外を入力してください"
            return
        }
        let result = calculator(inputNumber_1, inputNumber_2)
        resultLavel.text = String(result)
    }
}
