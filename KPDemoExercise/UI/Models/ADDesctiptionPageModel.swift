//
//  ADDesctiptionPageModel.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 22.2.24..
//

import Foundation
import UIKit

class ADDesctiptionPageModel {
    var pageController: UIPageViewController? = nil
    let adArray: [ADData]
    var adIndex: Int
    
    init(pageController: UIPageViewController? = nil, adArray: [ADData], adIndex: Int) {
        self.pageController = pageController
        self.adArray = adArray
        self.adIndex = adIndex
    }
}
