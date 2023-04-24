//
//  RoundButton.swift
//  Calculator-solo
//
//  Created by VTPL on 2023/04/24.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2.0
            }
        }
    }

}
