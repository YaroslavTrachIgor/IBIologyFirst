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

@available(iOS 11.0, *)
extension AppDelegate: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                  withError error: Error!) {
          if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
              print("The user has not signed in before or they have since signed out.")
            } else {
              print("\(error.localizedDescription)")
            }
            return
          }
          // Perform any operations on signed in user here.
          let userId        = user.userID                  // For client-side use only!
          let idToken       = user.authentication.idToken // Safe to send to the server
          let fullName      = user.profile.name
          let givenName     = user.profile.givenName
          let familyName    = user.profile.familyName
          let email         = user.profile.email
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("hludfgiy")
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let kFirstLaunchKey = "firstLaunchFlag"
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        rateManeger()
        UIViewTintColorPrefering()
        googleSignInSetup()
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }

    
    func googleSignInSetup() {
        GIDSignIn.sharedInstance()?.clientID = "com.googleusercontent.apps.773165120197-b7jgobadce59go3stoc4m5ql8anmlfdg"
        GIDSignIn.sharedInstance()?.delegate = self
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
    
    func navItemShadwSetup() {
        let navigationController = UINavigationController()
            navigationController.navigationBar.layer.shadowColor    = UIColor.black.cgColor
            navigationController.navigationBar.layer.shadowOpacity  = 1
            navigationController.navigationBar.layer.shadowOffset   = CGSize.zero
            navigationController.navigationBar.layer.shadowRadius   = 10
    }
    
    func rateManeger() {
        RateManager.incrementCount()
    }
    
    func UIViewTintColorPrefering() {
        window?.tintColor = lazyColor
        
        UINavigationBar.appearance().viewSystemBack()
        UITabBar.appearance().viewSystemBack()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: mediumFont, size: 10)!], for: .normal)
        
        UITabBar.appearance().backgroundImage   = UIImage()
        UITabBar.appearance().shadowImage       = UIImage()
        UITabBar.appearance().clipsToBounds     = true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

