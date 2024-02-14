//
//  UIViewController.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation
import UIKit

extension UIViewController {
    func loadNavigationBar() {
        if let navBar = navigationController?.navigationBar {
            navBar.layer.shadowColor = UIColor.black.cgColor
            navBar.layer.shadowOffset = CGSize(width: 0, height: 2)
            navBar.layer.shadowOpacity = 0.5
            navBar.layer.shadowRadius = 2
        }
        let imageView = UIImageView(image: UIImage(named: ImageNames.KPLogo))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = UIColor(named: ColorNames.FontTitleColor)
        navigationItem.backBarButtonItem = backItem
    }
}
