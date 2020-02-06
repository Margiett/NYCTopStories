//
//  SceneDelegate.swift
//  NYCTopStories
//
//  Created by Margiett Gil on 2/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        //MARK: Makesure you always replace _ with wondowSceen
        guard let windowSceen = (scene as? UIWindowScene) else { return }
        //MARK: This line of code was added.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowSceen
        window?.rootViewController = TopStoriesTabController() //MARK:Notes: Make sure you create a tabbarcontroller for this code will be calling that tabbarcontroller !!
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
      
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
   
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
  
    }


}

