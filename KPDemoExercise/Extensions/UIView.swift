//
//  UIView.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation
import UIKit

extension UIView {
    func addTopBorder() {
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: ViewDimensions.borderWidth)
        topBorder.backgroundColor = UIColor(named: ColorNames.BorderGrey)?.cgColor
        self.layer.addSublayer(topBorder)
    }
    
    func addBottomBorder() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: ViewDimensions.borderWidth)
        bottomBorder.backgroundColor = UIColor(named: ColorNames.BorderGrey)?.cgColor
        self.layer.addSublayer(bottomBorder)
    }
    
    func addBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(named: ColorNames.BorderGrey)?.cgColor
    }
}
