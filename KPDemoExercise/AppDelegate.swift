//
//  AppDelegate.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PersistenceManager.shared.deleteAllData()
        PersistenceManager.shared.loadDescriptionData()
        
        let navigationViewAppearance = UINavigationBarAppearance()
        navigationViewAppearance.backgroundColor = UIColor(named: ColorNames.NavBarWhite)
        UINavigationBar.appearance().standardAppearance = navigationViewAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationViewAppearance        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
