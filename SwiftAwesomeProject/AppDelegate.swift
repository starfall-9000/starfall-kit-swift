//
//  AppDelegate.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.registerService()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = SAPHomeViewController(viewModel: SAPHomeViewModel())
        let navVC = NavigationPage(rootViewController: viewController)
        navVC.statusBarStyle = .default
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }

    private func registerService() {
        DependencyManager.shared.registerDefaults()
        DependencyManager.shared.registerService(Factory<SAPJSONService> {
            SAPJSONService(baseUrl: BASE_FLICKR_SEARCH_URL)
        })
    }
}

