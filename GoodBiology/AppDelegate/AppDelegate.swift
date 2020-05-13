//
//  AppDelegate.swift
//  GoodBiology
//
//  Created by Yaroslav on 11/10/18.
//  Copyright © 2018 Yaroslav. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn
import GoogleMaps
import GoogleMobileAds
import Firebase

@UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

extension AppDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDidFinishLaunchingMethods()
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        switch userActivity.activityType {
        case UserActivityType.openPlantsArticle.rawValue:
            if #available(iOS 13.0, *) {
                if let VC = window?.rootViewController as? PlantsViewController {
                    VC.openPlantsArticle()
                }
            }
        default:
            break
        }
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
