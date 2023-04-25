//
//  ViewController.swift
//  Calculator-solo
//
//  Created by Geun Woo Park on 2023/04/23.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Multiply
    case Divide
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var NumberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else {
            return
        }
        
        if self.displayNumber.count < 9 { // maximum 9 characters can be entered
            self.displayNumber += numberValue
            self.NumberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tabClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.NumberOutputLabel.text = "0"
    }
    
    @IBAction func tabDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {    // # of characters limit = 9. Hence, if the a decimal point is added, the remaining characters can be entered = 8
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."       // if current characters entered is empty(""), the characters is 0. . If it's not empty, simply add a decimal point
            self.NumberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tabDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func tabAddButton(_ sender: UIButton) {
    }
    
    @IBAction func tabSubtractButton(_ sender: UIButton) {
    }
    
    @IBAction func tabEqualButton(_ sender: UIButton) {
    }
}

