//
//  CustomFont.swift
//  UIPropertyAnimator
//
//  Created by 김병철 on 2021/05/10.
//

import Foundation
import UIKit

class CustomFont: UILabel {
    
    var outlineWidth: CGFloat = 1
    var outlineColor: UIColor = UIColor.white

    override func drawText(in rect: CGRect) {

        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : outlineColor,
            NSAttributedString.Key.strokeWidth : -1 * outlineWidth,
        ] as [NSAttributedString.Key : Any]

        self.attributedText = NSAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        super.drawText(in: rect)
    }
}
