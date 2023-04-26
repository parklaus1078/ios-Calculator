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
        self.operation(.Divide)
    }
    
    @IBAction func tabMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tabAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tabSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tabEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                    case .Add:
                        self.result = "\(firstOperand + secondOperand)"
                    case .Subtract:
                        self.result = "\(firstOperand - secondOperand)"
                    case .Divide:
                        self.result = "\(firstOperand / secondOperand)"
                    case .Multiply:
                        self.result = "\(firstOperand * secondOperand)"
                    default:
                        break;
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.NumberOutputLabel.text = self.result
            }
            
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

