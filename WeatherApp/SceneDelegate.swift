//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by MstfGrgn on 19.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        print("url \(url)")
        print("url host :\(url.host!)")
        print("url path :\(url.path)")
        
        
        let urlPath : String = (url.path as String?)!
        let urlHost : String = (url.host as String?)!
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if(urlHost != "apikey=")
        {
            print("Host is not correct")
            return false
        }
        
        if(urlPath == "8ddadecc7ae4f56fee73b2b405a63659"){
            let homePage: HomeViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            self.window?.rootViewController = homePage
        }
        self.window?.makeKeyAndVisible()
        return true
    }



}

