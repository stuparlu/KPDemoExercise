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
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        let initialVC = ADDesctiptionViewController(adData: adArray[adIndex] )
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true)
        self.pageController?.didMove(toParent: self)
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
