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
        
        if self.displayNumber.count < 9 { // maximum 9 significant figures can be entered
            self.displayNumber += numberValue
            self.NumberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tabClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tabDotButton(_ sender: UIButton) {
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

