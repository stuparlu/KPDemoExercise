//
//  ADDesctiptionPageController.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation
import UIKit

class ADDesctiptionPageController: UIViewController {
    private var pageController: UIPageViewController? = nil
    var adArray: [ADData]
    var adIndex: Int
    
    init(adArray: [ADData], adIndex: Int = 0) {
        self.adArray = adArray
        self.adIndex = adIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init(adArray: [], adIndex: 0)
    }
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        loadNavigationBar()
        setupPageController()
    }
    
    private func setupPageController() {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        controller.dataSource = self
        controller.delegate = self
        controller.view.backgroundColor = .clear
        controller.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
        self.addChild(controller)
        self.view.addSubview(controller.view)
        let initialVC = ADDesctiptionViewController(adData: adArray[adIndex] )
        controller.setViewControllers([initialVC], direction: .forward, animated: true)
        controller.didMove(toParent: self)
        self.pageController = controller
    }
}

// MARK: UIPageViewControllerDataSource, UIPageViewControllerDelegate

extension ADDesctiptionPageController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if adIndex == 0 {
            return nil
        } else {
            adIndex -= 1
            return ADDesctiptionViewController(adData: adArray[adIndex])
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if adIndex == adArray.count - 1 {
            return nil
        } else {
            adIndex += 1
            return ADDesctiptionViewController(adData: adArray[adIndex])
        }
    }
}
